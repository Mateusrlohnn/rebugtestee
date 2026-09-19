package com.cometproject.server.game.ranked;

import org.junit.Test;

import static com.cometproject.server.game.ranked.RankedTier.BRONZE;
import static com.cometproject.server.game.ranked.RankedTier.CHALLENGER;
import static com.cometproject.server.game.ranked.RankedTier.DIAMOND;
import static com.cometproject.server.game.ranked.RankedTier.GOLD;
import static com.cometproject.server.game.ranked.RankedTier.GRANDMASTER;
import static com.cometproject.server.game.ranked.RankedTier.MASTER;
import static com.cometproject.server.game.ranked.RankedTier.SILVER;
import static org.junit.Assert.assertEquals;

public class LeagueRulesTest {
    private static void check(RankedTier tier, int division, int leaguePoints, int points,
                              RankedTier expectedTier, int expectedDivision, int expectedPoints) {
        final LeagueRules.Standing result = LeagueRules.apply(new LeagueRules.Standing(tier, division, leaguePoints), points);

        assertEquals("tier", expectedTier, result.getTier());
        assertEquals("division", expectedDivision, result.getDivision());
        assertEquals("league points", expectedPoints, result.getLeaguePoints());
    }

    @Test
    public void promotionCarriesExtraPoints() {
        check(BRONZE, 4, 90, 25, BRONZE, 3, 15);
    }

    @Test
    public void exactly100Promotes() {
        check(BRONZE, 4, 80, 20, BRONZE, 3, 0);
    }

    @Test
    public void divisionOnePromotesToNextTier() {
        check(BRONZE, 1, 95, 10, SILVER, 4, 5);
    }

    @Test
    public void demotionTakesMissingPointsFrom100() {
        check(BRONZE, 3, 5, -20, BRONZE, 4, 85);
    }

    @Test
    public void demotionDropsTier() {
        check(SILVER, 4, 5, -20, BRONZE, 1, 85);
    }

    @Test
    public void bronzeFourIsTheFloor() {
        check(BRONZE, 4, 5, -20, BRONZE, 4, 0);
    }

    @Test
    public void reachingZeroDoesNotDemote() {
        check(GOLD, 2, 20, -20, GOLD, 2, 0);
    }

    @Test
    public void diamondOneBecomesMaster() {
        check(DIAMOND, 1, 90, 25, MASTER, 0, 15);
    }

    @Test
    public void masterHasNoCap() {
        check(MASTER, 0, 480, 30, MASTER, 0, 510);
    }

    @Test
    public void negativeMasterDropsToDiamondOne() {
        check(MASTER, 0, 10, -25, DIAMOND, 1, 85);
    }

    @Test
    public void negativeGrandmasterDropsToDiamondOne() {
        check(GRANDMASTER, 0, 5, -20, DIAMOND, 1, 85);
    }

    @Test
    public void challengerKeepsTitleWhilePositive() {
        check(CHALLENGER, 0, 700, -20, CHALLENGER, 0, 680);
    }
}
