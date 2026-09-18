package com.cometproject.server.game.ranked;

/**
 * How league points move a player between divisions and tiers.
 *
 * Bronze IV up to Diamond I have 100 PDL per division. Reaching 100 promotes right away and the extra points carry
 * over; going below 0 demotes to the previous division with the missing points taken from 100. Diamond I with 100
 * becomes Master, where points have no cap. Master, Grandmaster and Challenger are stored with their points only:
 * which of the three a player is depends on the other players and is decided by {@link RankedLadder}.
 */
public final class LeagueRules {
    public static final int POINTS_PER_DIVISION = 100;
    public static final int HIGHEST_DIVISION = 1;

    private LeagueRules() {
    }

    public static Standing apply(Standing standing, int points) {
        RankedTier tier = standing.getTier();
        int division = standing.getDivision();
        int leaguePoints = standing.getLeaguePoints() + points;

        while (true) {
            if (isApex(tier)) {
                if (leaguePoints >= 0) {
                    return new Standing(tier, 0, leaguePoints);
                }

                // Negative points in the apex tiers drop the player back to Diamond I.
                tier = RankedTier.DIAMOND;
                division = HIGHEST_DIVISION;
                leaguePoints += POINTS_PER_DIVISION;
                continue;
            }

            if (leaguePoints >= POINTS_PER_DIVISION) {
                leaguePoints -= POINTS_PER_DIVISION;

                if (division > HIGHEST_DIVISION) {
                    division--;
                } else if (tier == RankedTier.DIAMOND) {
                    tier = RankedTier.MASTER;
                    division = 0;
                } else {
                    tier = RankedTier.values()[tier.ordinal() + 1];
                    division = RankedProfile.LOWEST_DIVISION;
                }

                continue;
            }

            if (leaguePoints < 0) {
                if (tier == RankedTier.BRONZE && division == RankedProfile.LOWEST_DIVISION) {
                    return new Standing(tier, division, 0);
                }

                leaguePoints += POINTS_PER_DIVISION;

                if (division < RankedProfile.LOWEST_DIVISION) {
                    division++;
                } else {
                    tier = RankedTier.values()[tier.ordinal() - 1];
                    division = HIGHEST_DIVISION;
                }

                continue;
            }

            return new Standing(tier, division, leaguePoints);
        }
    }

    public static boolean isApex(RankedTier tier) {
        return tier.ordinal() >= RankedTier.MASTER.ordinal();
    }

    public static class Standing {
        private final RankedTier tier;
        private final int division;
        private final int leaguePoints;

        public Standing(RankedTier tier, int division, int leaguePoints) {
            this.tier = tier;
            this.division = division;
            this.leaguePoints = leaguePoints;
        }

        public RankedTier getTier() {
            return this.tier;
        }

        public int getDivision() {
            return this.division;
        }

        public int getLeaguePoints() {
            return this.leaguePoints;
        }

        @Override
        public String toString() {
            return this.tier + (this.division > 0 ? " " + this.division : "") + " " + this.leaguePoints + " PDL";
        }
    }
}
