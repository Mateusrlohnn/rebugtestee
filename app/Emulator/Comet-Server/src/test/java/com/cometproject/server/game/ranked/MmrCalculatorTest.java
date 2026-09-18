package com.cometproject.server.game.ranked;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class MmrCalculatorTest {
    @Test
    public void equalMmrExpectsHalf() {
        assertEquals(0.5, MmrCalculator.expected(1000, 1000), 1e-9);
    }

    @Test
    public void expectationFollowsEloFormula() {
        // 1 / (1 + 10^(200/400))
        assertEquals(0.2402530733, MmrCalculator.expected(1000, 1200), 1e-9);
    }

    @Test
    public void newPlayersUseK64UntilTenMatches() {
        assertEquals(64, MmrCalculator.kFactor(0));
        assertEquals(64, MmrCalculator.kFactor(9));
        assertEquals(32, MmrCalculator.kFactor(10));
        assertEquals(32, MmrCalculator.kFactor(250));
    }

    @Test
    public void winAgainstEqualTeamGivesHalfOfK() {
        assertEquals(32, MmrCalculator.delta(1000, 1000, MmrCalculator.WIN, 5));
        assertEquals(16, MmrCalculator.delta(1000, 1000, MmrCalculator.WIN, 30));
        assertEquals(-16, MmrCalculator.delta(1000, 1000, MmrCalculator.LOSS, 30));
        assertEquals(0, MmrCalculator.delta(1000, 1000, MmrCalculator.DRAW, 30));
    }

    @Test
    public void beatingStrongerTeamIsWorthMore() {
        final int againstStronger = MmrCalculator.delta(1000, 1200, MmrCalculator.WIN, 30);
        final int againstWeaker = MmrCalculator.delta(1000, 800, MmrCalculator.WIN, 30);

        assertEquals(24, againstStronger);
        assertTrue(againstStronger > againstWeaker);
    }

    @Test
    public void veteransExchangeTheSameAmount() {
        final int winner = MmrCalculator.delta(1000, 1100, MmrCalculator.WIN, 20);
        final int loser = MmrCalculator.delta(1100, 1000, MmrCalculator.LOSS, 20);

        assertEquals(0, winner + loser);
    }
}
