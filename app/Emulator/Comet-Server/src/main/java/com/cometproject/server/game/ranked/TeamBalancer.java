package com.cometproject.server.game.ranked;

/**
 * Splits the players into two teams with a snake draft over MMR: sorted best first, Blue gets the 1st, 4th, 5th and
 * 8th, Red gets the 2nd, 3rd, 6th and 7th. Positions are kept as assigned by the matchmaker.
 */
public final class TeamBalancer {
    private TeamBalancer() {
    }

    /**
     * Team for the player at this place in the MMR order, starting at 0 for the highest MMR.
     */
    public static Team teamForRank(int rank) {
        final boolean evenRound = (rank / 2) % 2 == 0;
        final boolean firstPick = rank % 2 == 0;

        return evenRound == firstPick ? Team.BLUE : Team.RED;
    }
}
