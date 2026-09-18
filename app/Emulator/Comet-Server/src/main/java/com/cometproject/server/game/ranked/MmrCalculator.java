package com.cometproject.server.game.ranked;

/**
 * Hidden MMR change after a match, using Elo: E = 1 / (1 + 10^((enemy - own) / 400)) and new = own + K * (result - E).
 * K is 64 for players with fewer than 10 matches, so new players find their level fast, and 32 afterwards.
 */
public final class MmrCalculator {
    public static final int NEW_PLAYER_MATCHES = 10;
    public static final int NEW_PLAYER_K = 64;
    public static final int VETERAN_K = 32;

    public static final double WIN = 1;
    public static final double DRAW = 0.5;
    public static final double LOSS = 0;

    private MmrCalculator() {
    }

    public static double expected(double mmr, double enemyMmr) {
        return 1 / (1 + Math.pow(10, (enemyMmr - mmr) / 400));
    }

    public static int kFactor(int matchesPlayed) {
        return matchesPlayed < NEW_PLAYER_MATCHES ? NEW_PLAYER_K : VETERAN_K;
    }

    /**
     * MMR change for one player against the average MMR of the enemy team.
     */
    public static int delta(int mmr, double enemyAverageMmr, double result, int matchesPlayed) {
        return (int) Math.round(kFactor(matchesPlayed) * (result - expected(mmr, enemyAverageMmr)));
    }
}
