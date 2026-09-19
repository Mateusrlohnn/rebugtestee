package com.cometproject.server.game.ranked;

import com.cometproject.server.storage.queries.ranked.RankedDao;

import java.util.ArrayList;
import java.util.List;

/**
 * Turns a finished match into PDL, MMR and autofill protection changes for every player.
 *
 * MMR follows {@link MmrCalculator}: each player against the enemy team's average, K 64 or 32. PDL moves 10 to 30 per
 * match, guided by the teams' expected result, and a draw changes no PDL.
 */
public final class RankedScoring {
    private static final int MIN_POINTS = 10;
    private static final int MAX_POINTS = 30;
    private static final int POINTS_SCALE = 40;

    private RankedScoring() {
    }

    /**
     * Applies the result, saves every player and refreshes the Grandmaster slots.
     */
    public static List<Change> applyMatch(RankedMatch match, int blueGoals, int redGoals) {
        final List<RankedMatch.Player> blue = match.getTeam(Team.BLUE);
        final List<RankedMatch.Player> red = match.getTeam(Team.RED);

        final double blueResult = blueGoals > redGoals ? MmrCalculator.WIN : blueGoals < redGoals ? MmrCalculator.LOSS : MmrCalculator.DRAW;

        final List<Change> changes = new ArrayList<>();
        changes.addAll(applyTeam(blue, red, blueResult));
        changes.addAll(applyTeam(red, blue, 1 - blueResult));

        RankedLadder.getInstance().refreshGrandmasters();
        return changes;
    }

    private static List<Change> applyTeam(List<RankedMatch.Player> team, List<RankedMatch.Player> enemies, double result) {
        final double teamMmr = averageMmr(team);
        final double enemyMmr = averageMmr(enemies);
        final int points = pointsFor(result, MmrCalculator.expected(teamMmr, enemyMmr));

        final List<Change> changes = new ArrayList<>();

        for (final RankedMatch.Player player : team) {
            final RankedProfile profile = player.getProfile();
            final LeagueRules.Standing before = new LeagueRules.Standing(profile.getTier(), profile.getDivision(), profile.getLeaguePoints());
            final LeagueRules.Standing after = LeagueRules.apply(before, points);
            final int mmrChange = MmrCalculator.delta(profile.getMmr(), enemyMmr, result, profile.getMatchesPlayed());

            RankedDao.saveMatchResult(profile.getPlayerId(), after, profile.getMmr() + mmrChange,
                    result == MmrCalculator.WIN ? 1 : 0, result == MmrCalculator.LOSS ? 1 : 0, result == MmrCalculator.DRAW ? 1 : 0);
            RankedDao.setAutofillProtected(profile.getPlayerId(), AutofillProtection.afterMatchFinished(player.isAutofilled()));

            changes.add(new Change(profile, before, after, points, mmrChange));
        }

        return changes;
    }

    static int pointsFor(double result, double expected) {
        if (result == MmrCalculator.DRAW) {
            return 0;
        }

        if (result == MmrCalculator.WIN) {
            return clamp((int) Math.round(POINTS_SCALE * (1 - expected)));
        }

        return -clamp((int) Math.round(POINTS_SCALE * expected));
    }

    private static double averageMmr(List<RankedMatch.Player> team) {
        return team.stream().mapToInt(player -> player.getProfile().getMmr()).average().orElse(RankedProfile.DEFAULT_MMR);
    }

    private static int clamp(int points) {
        return Math.max(MIN_POINTS, Math.min(MAX_POINTS, points));
    }

    public static class Change {
        private final RankedProfile profile;
        private final LeagueRules.Standing before;
        private final LeagueRules.Standing after;
        private final int points;
        private final int mmrChange;

        public Change(RankedProfile profile, LeagueRules.Standing before, LeagueRules.Standing after, int points, int mmrChange) {
            this.profile = profile;
            this.before = before;
            this.after = after;
            this.points = points;
            this.mmrChange = mmrChange;
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

        public int getMmrChange() {
            return this.mmrChange;
        }
    }
}
