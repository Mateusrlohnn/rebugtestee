package com.cometproject.server.game.ranked;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class TeamBalancerTest {
    @Test
    public void snakeDraftOrder() {
        final Team[] expected = {Team.BLUE, Team.RED, Team.RED, Team.BLUE, Team.BLUE, Team.RED, Team.RED, Team.BLUE};

        for (int rank = 0; rank < expected.length; rank++) {
            assertEquals("rank " + (rank + 1), expected[rank], TeamBalancer.teamForRank(rank));
        }
    }

    @Test
    public void matchSplitsByMmrAndKeepsPositions() {
        final Position[] roles = {Position.GK, Position.ZAG, Position.MID, Position.ATK, Position.GK, Position.ZAG, Position.MID, Position.ATK};
        final List<Matchmaker.Slot> slots = new ArrayList<>();
        final List<RankedProfile> profiles = new ArrayList<>();

        for (int id = 1; id <= 8; id++) {
            final int mmr = 1000 + id * 10;

            profiles.add(new RankedProfile(id, "P" + id, "", RankedTier.BRONZE, 4, 0, mmr, 0, 0, 0, roles[id - 1], null, false));
            slots.add(new Matchmaker.Slot(new Matchmaker.Candidate(id, mmr, roles[id - 1], null, false, 0), roles[id - 1], Matchmaker.Placement.PRIMARY));
        }

        final RankedMatch match = RankedMatch.create(new Matchmaker.MatchPlan(slots), profiles, 0);

        // Highest MMR is P8, then P7... Blue gets ranks 1, 4, 5 and 8: P8, P5, P4 and P1.
        assertEquals(Team.BLUE, teamOf(match, 8));
        assertEquals(Team.BLUE, teamOf(match, 5));
        assertEquals(Team.BLUE, teamOf(match, 4));
        assertEquals(Team.BLUE, teamOf(match, 1));
        assertEquals(Team.RED, teamOf(match, 7));
        assertEquals(4, match.getTeam(Team.BLUE).size());
        assertEquals(4, match.getTeam(Team.RED).size());

        for (final RankedMatch.Player player : match.getPlayers()) {
            assertEquals(roles[player.getProfile().getPlayerId() - 1], player.getPosition());
        }
    }

    private static Team teamOf(RankedMatch match, int playerId) {
        for (final RankedMatch.Player player : match.getPlayers()) {
            if (player.getProfile().getPlayerId() == playerId) {
                return player.getTeam();
            }
        }

        throw new AssertionError("player " + playerId + " not in match");
    }
}
