package com.cometproject.server.game.ranked;

import com.cometproject.server.storage.queries.ranked.RankedDao;

import java.util.ArrayList;
import java.util.List;

/**
 * Turns a finished match into PDL and MMR changes for every player.
 *
 * The hidden MMR decides how much a result is worth: beating a stronger team gives more PDL and losing to a weaker
 * team costs more. A draw changes nothing.
 */
public final class RankedScoring {
    private static final int MIN_POINTS = 10;
    private static final int MAX_POINTS = 30;
    private static final int POINTS_SCALE = 40;
    private static final int MMR_FACTOR = 32;

    private RankedScoring() {
    }

    /**
     * Applies the result, saves every player and refreshes the Grandmaster slots.
     */
    public static List<Change> applyMatch(List<RankedProfile> blueTeam, List<RankedProfile> redTeam, int blueGoals, int redGoals) {
        final double blueExpected = expectedScore(averageMmr(blueTeam), averageMmr(redTeam));
        final double blueScore = blueGoals > redGoals ? 1 : blueGoals < redGoals ? 0 : 0.5;

        final List<Change> changes = new ArrayList<>();
        changes.addAll(applyTeam(blueTeam, blueScore, blueExpected));
        changes.addAll(applyTeam(redTeam, 1 - blueScore, 1 - blueExpected));

        RankedLadder.getInstance().refreshGrandmasters();
        return changes;
    }

    private static List<Change> applyTeam(List<RankedProfile> team, double score, double expected) {
        final List<Change> changes = new ArrayList<>();
        final int points = pointsFor(score, expected);
        final int mmrChange = score == 0.5 ? 0 : (int) Math.round(MMR_FACTOR * (score - expected));

        for (final RankedProfile profile : team) {
            final LeagueRules.Standing before = new LeagueRules.Standing(profile.getTier(), profile.getDivision(), profile.getLeaguePoints());
            final LeagueRules.Standing after = LeagueRules.apply(before, points);

            RankedDao.saveMatchResult(profile.getPlayerId(), after, profile.getMmr() + mmrChange,
                    score == 1 ? 1 : 0, score == 0 ? 1 : 0, score == 0.5 ? 1 : 0);

            changes.add(new Change(profile, before, after, points));
        }

        return changes;
    }

    static int pointsFor(double score, double expected) {
        if (score == 0.5) {
            return 0;
        }

        if (score == 1) {
            return clamp((int) Math.round(POINTS_SCALE * (1 - expected)));
        }

        return -clamp((int) Math.round(POINTS_SCALE * expected));
    }

    static double expectedScore(double mmr, double opponentMmr) {
        return 1 / (1 + Math.pow(10, (opponentMmr - mmr) / 400));
    }

    private static double averageMmr(List<RankedProfile> team) {
        return team.stream().mapToInt(RankedProfile::getMmr).average().orElse(RankedProfile.DEFAULT_MMR);
    }

    private static int clamp(int points) {
        return Math.max(MIN_POINTS, Math.min(MAX_POINTS, points));
    }

    public static class Change {
        private final RankedProfile profile;
        private final LeagueRules.Standing before;
        private final LeagueRules.Standing after;
        private final int points;

        public Change(RankedProfile profile, LeagueRules.Standing before, LeagueRules.Standing after, int points) {
            this.profile = profile;
            this.before = before;
            this.after = after;
            this.points = points;
        }

        public RankedProfile getProfile() {
            return this.profile;
        }

        public LeagueRules.Standing getBefore() {
            return this.before;
        }

        public LeagueRules.Standing getAfter() {
            return this.after;
        }

        public int getPoints() {
            return this.points;
        }
    }
}
