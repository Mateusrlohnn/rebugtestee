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
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * One ranked queue for the whole hotel, shown to players through the :queue panel.
 */
public class RankedQueueManager {
    public static final int TEAM_SIZE = 4;
    public static final int MATCH_SIZE = TEAM_SIZE * 2;
    private static final int RANKING_SIZE = 50;

    private static final RankedQueueManager instance = new RankedQueueManager();

    private final RankedQueue queue = new RankedQueue();

    // Players with the panel open, who receive live updates.
    private final Set<Integer> watchers = ConcurrentHashMap.newKeySet();

    // Last match found for each player, until they dismiss it.
    private final Map<Integer, RankedMatch> matches = new ConcurrentHashMap<>();

    public static RankedQueueManager getInstance() {
        return instance;
    }

    public void handleAction(Session session, String action) {
        if (session.getPlayer() == null) {
            return;
        }

        final int playerId = session.getPlayer().getId();

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

    public void onPlayerDisconnect(int playerId) {
        this.watchers.remove(playerId);

        if (this.queue.remove(playerId)) {
            this.broadcastState();
        }
    }

    private void join(Session session) {
        final RankedProfile profile = RankedDao.getOrCreateProfile(session.getPlayer().getId());

        if (profile == null || !this.queue.add(profile)) {
            this.sendState(session, false);
            return;
        }

        this.matches.remove(profile.getPlayerId());

        final List<RankedQueue.Entry> players = this.queue.pollMatch(MATCH_SIZE);

        if (players != null) {
            this.startMatch(players);
        }

        this.broadcastState();
    }

    private void startMatch(List<RankedQueue.Entry> players) {
        final List<RankedProfile> profiles = new ArrayList<>();

        for (final RankedQueue.Entry entry : players) {
            profiles.add(entry.getProfile());
        }

        // Shuffle first so players with an identical elo are ordered randomly; the sort is stable.
        Collections.shuffle(profiles);
        profiles.sort(RankedProfile.BEST_FIRST);

        final RankedMatch match = new RankedMatch(profiles, System.currentTimeMillis());

        for (final RankedProfile profile : profiles) {
            this.matches.put(profile.getPlayerId(), match);

            final Session session = NetworkManager.getInstance().getSessions().getByPlayerId(profile.getPlayerId());

            if (session != null) {
                this.watchers.add(profile.getPlayerId());
                this.sendState(session, true);
            }
        }
    }

    private void broadcastState() {
        for (final int playerId : this.watchers) {
            final Session session = NetworkManager.getInstance().getSessions().getByPlayerId(playerId);

            if (session == null) {
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

        final JsonObject me = this.writeProfile(profile);
        me.addProperty("position", RankedDao.getPosition(profile));
        me.addProperty("winRate", profile.getWinRate());
        me.addProperty("inQueue", ownEntry != null);
        me.addProperty("waitSeconds", ownEntry == null ? 0 : (now - ownEntry.getJoinedAt()) / 1000);

        final JsonArray queuePlayers = new JsonArray();

        for (final RankedQueue.Entry entry : this.queue.getEntries()) {
            final JsonObject player = this.writeProfile(entry.getProfile());
            player.addProperty("waitSeconds", (now - entry.getJoinedAt()) / 1000);
            player.addProperty("me", entry.getPlayerId() == playerId);
            queuePlayers.add(player);
        }

        final JsonObject queue = new JsonObject();
        queue.addProperty("size", queuePlayers.size());
        queue.addProperty("max", MATCH_SIZE);
        queue.add("players", queuePlayers);

        final JsonObject state = new JsonObject();
        state.addProperty("type", "state");
        state.addProperty("open", open);
        state.add("me", me);
        state.add("queue", queue);
        state.add("match", this.writeMatch(this.matches.get(playerId), playerId, now));

        session.send(new RankedPanelMessageComposer(state));
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

        for (final RankedProfile profile : match.getPlayers()) {
            final JsonObject player = this.writeProfile(profile);
            player.addProperty("captain", match.isCaptain(profile));
            player.addProperty("me", profile.getPlayerId() == playerId);
            players.add(player);
        }

        data.addProperty("secondsAgo", (now - match.getFoundAt()) / 1000);
        data.add("players", players);
        return data;
    }

    private JsonObject writeProfile(RankedProfile profile) {
        final JsonObject data = new JsonObject();
        data.addProperty("username", profile.getUsername());
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
