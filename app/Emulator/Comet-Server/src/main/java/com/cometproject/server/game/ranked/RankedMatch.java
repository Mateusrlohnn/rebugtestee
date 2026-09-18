package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * A match found by the queue: 8 players with their team and position. Players meet and play it on their own.
 */
public class RankedMatch {
    private final List<Player> players;
    private final long foundAt;

    public RankedMatch(List<Player> players, long foundAt) {
        this.players = Collections.unmodifiableList(players);
        this.foundAt = foundAt;
    }

    /**
     * Builds the match from the matchmaker lineup, splitting the teams with a snake draft over MMR.
     */
    public static RankedMatch create(Matchmaker.MatchPlan plan, List<RankedProfile> profiles, long foundAt) {
        final List<RankedProfile> byMmr = new ArrayList<>(profiles);
        byMmr.sort(Comparator.comparingInt(RankedProfile::getMmr).reversed());

        final List<Player> players = new ArrayList<>();

        for (int rank = 0; rank < byMmr.size(); rank++) {
            final RankedProfile profile = byMmr.get(rank);
            final Matchmaker.Slot slot = plan.slotOf(profile.getPlayerId());

            players.add(new Player(profile, TeamBalancer.teamForRank(rank), slot.getPosition(), slot.getPlacement()));
        }

        return new RankedMatch(players, foundAt);
    }

    public List<Player> getPlayers() {
        return this.players;
    }

    public List<Player> getTeam(Team team) {
        final List<Player> members = new ArrayList<>();

        for (final Player player : this.players) {
            if (player.getTeam() == team) {
                members.add(player);
            }
        }

        return members;
    }

    public long getFoundAt() {
        return this.foundAt;
    }

    public static class Player {
        private final RankedProfile profile;
        private final Team team;
        private final Position position;
        private final Matchmaker.Placement placement;

        public Player(RankedProfile profile, Team team, Position position, Matchmaker.Placement placement) {
            this.profile = profile;
            this.team = team;
            this.position = position;
            this.placement = placement;
        }

        public RankedProfile getProfile() {
            return this.profile;
        }

        public Team getTeam() {
            return this.team;
        }

        public Position getPosition() {
            return this.position;
        }

        public Matchmaker.Placement getPlacement() {
            return this.placement;
        }

        public boolean isAutofilled() {
            return this.placement == Matchmaker.Placement.AUTOFILL;
        }
    }
}
