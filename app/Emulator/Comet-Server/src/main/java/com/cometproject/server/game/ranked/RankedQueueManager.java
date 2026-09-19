package com.cometproject.server.game.ranked;

import com.cometproject.server.network.NetworkManager;
import com.cometproject.server.network.messages.outgoing.ranked.RankedPanelMessageComposer;
import com.cometproject.server.network.sessions.Session;
import com.cometproject.server.storage.queries.ranked.RankedDao;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;

import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedDeque;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Ranked queue shared by the whole hotel, shown to players through the :queue panel.
 *
 * Players pick a primary and a secondary position before joining. Every few seconds the {@link Matchmaker} forms as
 * many matches as the online players allow, each from its own MMR band, so several searches run at the same time in
 * any room and feed one ranking. The teams are split by {@link TeamBalancer}.
 */
public class RankedQueueManager {
    public static final int MATCH_SIZE = Matchmaker.MATCH_SIZE;
    private static final int RANKING_SIZE = 50;
    private static final int RECONNECT_GRACE_SECONDS = 120;
    private static final int MATCHMAKING_INTERVAL_SECONDS = 3;
    private static final String POSITIONS_ACTION = "positions:";
    private static final long RECENT_MATCHES_MILLIS = TimeUnit.MINUTES.toMillis(10);

    private static final RankedQueueManager instance = new RankedQueueManager();

    private final RankedQueue queue = new RankedQueue();

    // Players with the panel open, who receive live updates.
    private final Set<Integer> watchers = ConcurrentHashMap.newKeySet();

    // Last match found for each player, until they dismiss it.
    private final Map<Integer, RankedMatch> matches = new ConcurrentHashMap<>();

    // Queued players who dropped and still have time to come back.
    private final Map<Integer, Long> disconnected = new ConcurrentHashMap<>();

    // When recent matches were found, to show how many searches finish in parallel.
    private final Deque<Long> recentMatches = new ConcurrentLinkedDeque<>();

    // Search window of every queued player at the last check, to notice when one widens.
    private List<Integer> lastMargins = new ArrayList<>();

    private final ScheduledExecutorService timer = Executors.newSingleThreadScheduledExecutor();

    private RankedQueueManager() {
        // Starts the daily Challenger update together with the queue.
        RankedLadder.getInstance();

        this.timer.scheduleAtFixedRate(this::runMatchmaking, MATCHMAKING_INTERVAL_SECONDS, MATCHMAKING_INTERVAL_SECONDS, TimeUnit.SECONDS);
    }

    public static RankedQueueManager getInstance() {
        return instance;
    }

    public void handleAction(Session session, String action) {
        if (session.getPlayer() == null) {
            return;
        }

        final int playerId = session.getPlayer().getId();

        if (action.startsWith(POSITIONS_ACTION)) {
            this.choosePositions(session, action.substring(POSITIONS_ACTION.length()));
            return;
        }

        switch (action) {
            case "open":
                this.watchers.add(playerId);
                this.sendState(session, true);
                break;

            case "close":
                this.watchers.remove(playerId);
                break;

            case "join":
                this.join(session);
                break;

            case "leave":
                if (this.queue.remove(playerId)) {
                    this.broadcastState();
                } else {
                    this.sendState(session, false);
                }
                break;

            case "dismiss":
                this.matches.remove(playerId);
                this.sendState(session, false);
                break;

            case "ranking":
                this.sendRanking(session);
                break;
        }
    }

    /**
     * Sends the queue status on login, so a player who reloaded the page sees they are still in the queue.
     */
    public void onPlayerLogin(Session session) {
        final int playerId = session.getPlayer().getId();

        this.disconnected.remove(playerId);

        if (this.queue.get(playerId) != null) {
            // Back in time: the player counts again and may complete a match.
            this.runMatchmaking();
            this.broadcastState();
        } else if (this.matches.containsKey(playerId)) {
            this.sendState(session, false);
        }
    }

    /**
     * Keeps the player's place for a while, so reloading the page or a short drop does not lose it. Meanwhile they
     * are not counted and cannot be picked for a match.
     */
    public void onPlayerDisconnect(int playerId) {
        this.watchers.remove(playerId);

        if (this.queue.get(playerId) == null) {
            return;
        }

        final long disconnectedAt = System.currentTimeMillis();
        this.disconnected.put(playerId, disconnectedAt);
        this.broadcastState();

        this.timer.schedule(() -> {
            if (this.disconnected.remove(playerId, disconnectedAt) && this.queue.remove(playerId)) {
                this.broadcastState();
            }
        }, RECONNECT_GRACE_SECONDS, TimeUnit.SECONDS);
    }

    private boolean isOnline(RankedQueue.Entry entry) {
        return !this.disconnected.containsKey(entry.getPlayerId());
    }

    /**
     * Saves the positions picked in the panel, as "GK,ZAG". They cannot change while the player is in the queue.
     */
    private void choosePositions(Session session, String codes) {
        final int playerId = session.getPlayer().getId();
        final String[] parts = codes.split(",");

        final Position primary = parts.length == 2 ? Position.fromCode(parts[0]) : null;
        final Position secondary = parts.length == 2 ? Position.fromCode(parts[1]) : null;

        if (primary != null && secondary != null && primary != secondary && this.queue.get(playerId) == null
                && RankedDao.getOrCreateProfile(playerId) != null) {
            RankedDao.savePositions(playerId, primary, secondary);
        }

        this.sendState(session, false);
    }

    private void join(Session session) {
        final RankedProfile profile = RankedDao.getOrCreateProfile(session.getPlayer().getId());

        if (profile == null || !profile.hasPositions() || !this.queue.add(profile)) {
            this.sendState(session, false);
            return;
        }

        this.matches.remove(profile.getPlayerId());
        this.runMatchmaking();
        this.broadcastState();
    }

    /**
     * Forms every match the online players allow right now.
     */
    private synchronized void runMatchmaking() {
        boolean formed = false;

        while (true) {
            final List<Matchmaker.Candidate> candidates = new ArrayList<>();

            for (final RankedQueue.Entry entry : this.queue.getEntries(this::isOnline)) {
                candidates.add(entry.toCandidate());
            }

            final Matchmaker.MatchPlan plan = Matchmaker.find(candidates, System.currentTimeMillis());

            if (plan == null) {
                break;
            }

            this.startMatch(plan);
            formed = true;
        }

        // Search windows widen with waiting time, so the "in your band" counts change even without new players.
        final List<Integer> margins = new ArrayList<>();
        final long now = System.currentTimeMillis();

        for (final RankedQueue.Entry entry : this.queue.getEntries(this::isOnline)) {
            margins.add(SearchWindow.forWait((now - entry.getJoinedAt()) / 1000).getMmrMargin());
        }

        if (formed || !margins.equals(this.lastMargins)) {
            this.lastMargins = margins;
            this.broadcastState();
        }
    }

    private void startMatch(Matchmaker.MatchPlan plan) {
        final List<RankedProfile> profiles = new ArrayList<>();
        final List<Integer> playerIds = new ArrayList<>();

        for (final Matchmaker.Slot slot : plan.getSlots()) {
            final RankedQueue.Entry entry = this.queue.get(slot.getCandidate().getPlayerId());

            profiles.add(entry.getProfile());
            playerIds.add(entry.getPlayerId());
        }

        this.queue.removeAll(playerIds);

        final RankedMatch match = RankedMatch.create(plan, profiles, System.currentTimeMillis());
        this.recentMatches.addLast(match.getFoundAt());

        for (final RankedMatch.Player player : match.getPlayers()) {
            final RankedProfile profile = player.getProfile();

            if (player.isAutofilled()) {
                RankedDao.setAutofillProtected(profile.getPlayerId(), AutofillProtection.afterMatchFormed(profile.isAutofillProtected(), true));
            }

            this.matches.put(profile.getPlayerId(), match);

            final Session session = NetworkManager.getInstance().getSessions().getByPlayerId(profile.getPlayerId());

            if (session != null) {
                this.watchers.add(profile.getPlayerId());
                this.sendState(session, true);
            }
        }
    }

    /**
     * Updates everyone with the panel open, plus everyone in the queue so their on-screen badge stays current.
     */
    private void broadcastState() {
        final Set<Integer> receivers = new HashSet<>(this.watchers);

        for (final RankedQueue.Entry entry : this.queue.getEntries()) {
            receivers.add(entry.getPlayerId());
        }

        for (final int playerId : receivers) {
            final Session session = NetworkManager.getInstance().getSessions().getByPlayerId(playerId);

            if (session == null || session.getPlayer() == null) {
                this.watchers.remove(playerId);
                continue;
            }

            this.sendState(session, false);
        }
    }

    private void sendState(Session session, boolean open) {
        final int playerId = session.getPlayer().getId();
        final RankedProfile profile = RankedDao.getOrCreateProfile(playerId);

        if (profile == null) {
            return;
        }

        final long now = System.currentTimeMillis();
        final RankedQueue.Entry ownEntry = this.queue.get(playerId);
        final List<RankedQueue.Entry> online = this.queue.getEntries(this::isOnline);

        // The player's own search: who fits their current MMR window. Several of these run at once in the hotel.
        final long waitSeconds = ownEntry == null ? 0 : (now - ownEntry.getJoinedAt()) / 1000;
        final int margin = SearchWindow.forWait(waitSeconds).getMmrMargin();
        final List<RankedQueue.Entry> band = new ArrayList<>();

        for (final RankedQueue.Entry entry : online) {
            if (Math.abs(entry.getProfile().getMmr() - profile.getMmr()) <= margin) {
                band.add(entry);
            }
        }

        final JsonObject me = this.writeProfile(profile);
        me.addProperty("position", RankedDao.getPosition(profile));
        me.addProperty("primary", profile.getPrimary() == null ? null : profile.getPrimary().name());
        me.addProperty("secondary", profile.getSecondary() == null ? null : profile.getSecondary().name());
        me.addProperty("autofillProtected", profile.isAutofillProtected());
        me.addProperty("inQueue", ownEntry != null);
        me.addProperty("waitSeconds", waitSeconds);

        // Only counts are sent: who is waiting in the queue stays hidden.
        final JsonObject queue = new JsonObject();
        queue.addProperty("size", band.size());
        queue.addProperty("max", MATCH_SIZE);
        queue.addProperty("hotelSize", online.size());
        queue.addProperty("recentMatches", this.countRecentMatches(now));
        queue.add("fastPositions", this.writeFastPositions(band));

        final JsonObject state = new JsonObject();
        state.addProperty("type", "state");
        state.addProperty("open", open);
        state.add("me", me);
        state.add("queue", queue);
        state.add("match", this.writeMatch(this.matches.get(playerId), playerId, now));

        session.send(new RankedPanelMessageComposer(state));
    }

    private int countRecentMatches(long now) {
        while (!this.recentMatches.isEmpty() && now - this.recentMatches.peekFirst() > RECENT_MATCHES_MILLIS) {
            this.recentMatches.pollFirst();
        }

        return this.recentMatches.size();
    }

    /**
     * Positions fewest queued players picked as primary: choosing one of them finds a match faster.
     */
    private JsonArray writeFastPositions(List<RankedQueue.Entry> online) {
        final int[] counts = new int[Position.values().length];

        for (final RankedQueue.Entry entry : online) {
            counts[entry.getProfile().getPrimary().ordinal()]++;
        }

        int fewest = Integer.MAX_VALUE;
        int most = 0;

        for (final int count : counts) {
            fewest = Math.min(fewest, count);
            most = Math.max(most, count);
        }

        final JsonArray fast = new JsonArray();

        if (fewest == most) {
            return fast;
        }

        for (final Position position : Position.values()) {
            if (counts[position.ordinal()] == fewest) {
                fast.add(position.name());
            }
        }

        return fast;
    }

    private void sendRanking(Session session) {
        final int playerId = session.getPlayer().getId();
        final JsonArray players = new JsonArray();

        int position = 1;

        for (final RankedProfile profile : RankedDao.getTopProfiles(RANKING_SIZE)) {
            final JsonObject player = this.writeProfile(profile);
            player.addProperty("position", position++);
            player.addProperty("me", profile.getPlayerId() == playerId);
            players.add(player);
        }

        final JsonObject ranking = new JsonObject();
        ranking.addProperty("type", "ranking");
        ranking.add("players", players);

        session.send(new RankedPanelMessageComposer(ranking));
    }

    private JsonElement writeMatch(RankedMatch match, int playerId, long now) {
        if (match == null) {
            return JsonNull.INSTANCE;
        }

        final JsonObject data = new JsonObject();
        final JsonArray players = new JsonArray();

        for (final RankedMatch.Player matchPlayer : match.getPlayers()) {
            final JsonObject player = this.writeProfile(matchPlayer.getProfile());
            player.addProperty("team", matchPlayer.getTeam().name().toLowerCase());
            player.addProperty("role", matchPlayer.getPosition().name());
            player.addProperty("autofilled", matchPlayer.isAutofilled());
            player.addProperty("me", matchPlayer.getProfile().getPlayerId() == playerId);
            players.add(player);
        }

        data.addProperty("secondsAgo", (now - match.getFoundAt()) / 1000);
        data.add("players", players);
        return data;
    }

    private JsonObject writeProfile(RankedProfile profile) {
        final JsonObject data = new JsonObject();
        data.addProperty("username", profile.getUsername());
        data.addProperty("figure", profile.getFigure());
        data.addProperty("tier", profile.getTier().name().toLowerCase());
        data.addProperty("tierName", profile.getTier().getDisplayName());
        data.addProperty("division", profile.getDivisionName());
        data.addProperty("leaguePoints", profile.getLeaguePoints());
        data.addProperty("wins", profile.getWins());
        data.addProperty("losses", profile.getLosses());
        data.addProperty("draws", profile.getDraws());
        return data;
    }
}
