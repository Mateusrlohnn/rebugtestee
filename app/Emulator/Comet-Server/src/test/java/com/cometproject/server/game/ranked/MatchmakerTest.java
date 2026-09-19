package com.cometproject.server.game.ranked;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static com.cometproject.server.game.ranked.Position.ATK;
import static com.cometproject.server.game.ranked.Position.GK;
import static com.cometproject.server.game.ranked.Position.MID;
import static com.cometproject.server.game.ranked.Position.ZAG;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class MatchmakerTest {
    private static final long NOW = 1_000_000_000L;

    private final List<Matchmaker.Candidate> queue = new ArrayList<>();
    private int nextId = 1;

    /**
     * Adds a player who has waited the given seconds. Each new player joined one millisecond later than the last one,
     * so the first added is the anchor.
     */
    private Matchmaker.Candidate add(int mmr, Position primary, Position secondary, boolean autofillProtected, int waitedSeconds) {
        final int id = this.nextId++;
        final Matchmaker.Candidate candidate = new Matchmaker.Candidate(id, mmr, primary, secondary, autofillProtected,
                NOW - waitedSeconds * 1000L + id);

        this.queue.add(candidate);
        return candidate;
    }

    private void addFullLineup(int mmr, int waitedSeconds) {
        for (final Position position : Position.values()) {
            this.add(mmr, position, null, false, waitedSeconds);
            this.add(mmr, position, null, false, waitedSeconds);
        }
    }

    private Matchmaker.MatchPlan find() {
        return Matchmaker.find(this.queue, NOW);
    }

    @Test
    public void twoOfEachPrimaryFormsAMatchRightAway() {
        this.addFullLineup(1000, 5);

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);
        assertEquals(8, plan.getSlots().size());

        for (final Matchmaker.Slot slot : plan.getSlots()) {
            assertEquals(Matchmaker.Placement.PRIMARY, slot.getPlacement());
        }
    }

    @Test
    public void everyMatchHasTwoOfEachPosition() {
        this.addFullLineup(1000, 5);

        final int[] counts = new int[Position.values().length];

        for (final Matchmaker.Slot slot : this.find().getSlots()) {
            counts[slot.getPosition().ordinal()]++;
        }

        for (final int count : counts) {
            assertEquals(2, count);
        }
    }

    @Test
    public void onlyPrimaryCountsInTheFirst15Seconds() {
        // No one has GK as primary: two players have it as secondary.
        this.add(1000, ZAG, GK, false, 10);
        this.add(1000, ZAG, GK, false, 10);
        this.add(1000, ZAG, null, false, 10);
        this.add(1000, ZAG, null, false, 10);
        this.add(1000, MID, null, false, 10);
        this.add(1000, MID, null, false, 10);
        this.add(1000, ATK, null, false, 10);
        this.add(1000, ATK, null, false, 10);

        assertNull(this.find());
    }

    @Test
    public void secondaryCountsFrom16Seconds() {
        final Matchmaker.Candidate firstGoalkeeper = this.add(1000, ZAG, GK, false, 20);
        final Matchmaker.Candidate secondGoalkeeper = this.add(1000, ZAG, GK, false, 20);
        this.add(1000, ZAG, null, false, 20);
        this.add(1000, ZAG, null, false, 20);
        this.add(1000, MID, null, false, 20);
        this.add(1000, MID, null, false, 20);
        this.add(1000, ATK, null, false, 20);
        this.add(1000, ATK, null, false, 20);

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);
        assertEquals(GK, plan.slotOf(firstGoalkeeper.getPlayerId()).getPosition());
        assertEquals(Matchmaker.Placement.SECONDARY, plan.slotOf(firstGoalkeeper.getPlayerId()).getPlacement());
        assertEquals(GK, plan.slotOf(secondGoalkeeper.getPlayerId()).getPosition());
    }

    @Test
    public void playersOutsideTheMmrMarginAreLeftOut() {
        this.addFullLineup(1000, 10);
        this.queue.remove(this.queue.size() - 1);
        this.add(1100, ATK, null, false, 10);

        // 0-15s: +-50 around the anchor, so the 1100 player cannot complete the match.
        assertNull(this.find());
    }

    @Test
    public void marginWidensWithWaitingTime() {
        this.addFullLineup(1000, 20);
        this.queue.remove(this.queue.size() - 1);
        this.add(1100, ATK, null, false, 20);

        // 16-45s: +-150 now includes the 1100 player.
        assertNotNull(this.find());
    }

    @Test
    public void marginNeverGoesPast500() {
        this.addFullLineup(1000, 600);
        this.queue.remove(this.queue.size() - 1);
        this.add(1501, ATK, null, false, 600);

        assertNull(this.find());
    }

    @Test
    public void noAutofillBefore46Seconds() {
        this.addLineupWithoutGoalkeepers(false, 40);

        assertNull(this.find());
    }

    @Test
    public void autofillFillsMissingPositionsFrom46Seconds() {
        this.addLineupWithoutGoalkeepers(false, 50);

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);

        int autofilled = 0;

        for (final Matchmaker.Slot slot : plan.getSlots()) {
            if (slot.isAutofilled()) {
                autofilled++;
                assertEquals(GK, slot.getPosition());
            }
        }

        assertEquals(2, autofilled);
    }

    @Test
    public void protectedPlayersAreNeverAutofilled() {
        // The only way to close the match is to autofill two of them as GK, and all of them are protected.
        this.addLineupWithoutGoalkeepers(true, 600);

        assertNull(this.find());
    }

    @Test
    public void autofillSkipsProtectedAndPicksClosestMmr() {
        // Protected anchor, so it cannot be the one autofilled.
        final Matchmaker.Candidate anchor = this.add(1000, ZAG, null, true, 60);
        this.add(1200, ZAG, null, false, 60);
        this.add(1200, MID, null, false, 60);
        this.add(1200, MID, null, false, 60);
        this.add(1200, ATK, null, false, 60);
        this.add(1200, ATK, null, false, 60);

        final Matchmaker.Candidate protectedClosest = this.add(1000, ATK, null, true, 60);
        final Matchmaker.Candidate closest = this.add(1010, ATK, null, false, 60);
        final Matchmaker.Candidate secondClosest = this.add(1020, ATK, null, false, 60);

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);
        assertEquals(ZAG, plan.slotOf(anchor.getPlayerId()).getPosition());

        final Matchmaker.Slot protectedSlot = plan.slotOf(protectedClosest.getPlayerId());
        assertTrue("protected player may only be left out or play a preferred position",
                protectedSlot == null || !protectedSlot.isAutofilled());

        assertTrue(plan.slotOf(closest.getPlayerId()).isAutofilled());
        assertEquals(GK, plan.slotOf(closest.getPlayerId()).getPosition());
        assertTrue(plan.slotOf(secondClosest.getPlayerId()).isAutofilled());
        assertEquals(GK, plan.slotOf(secondClosest.getPlayerId()).getPosition());
    }

    @Test
    public void preferredPositionsBeatAutofill() {
        this.addFullLineup(1000, 120);

        for (final Matchmaker.Slot slot : this.find().getSlots()) {
            assertFalse(slot.isAutofilled());
        }
    }

    @Test
    public void anchorAlwaysPlays() {
        final Matchmaker.Candidate anchor = this.add(1000, GK, null, false, 30);
        this.addFullLineup(1000, 5);

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);
        assertNotNull(plan.slotOf(anchor.getPlayerId()));
    }

    @Test
    public void notEnoughPlayersMeansNoMatch() {
        this.addFullLineup(1000, 600);
        this.queue.remove(0);

        assertNull(this.find());
    }

    @Test(timeout = 1000)
    public void worstCaseSearchIsFast() {
        // Everyone wants GK (ZAG as secondary), so MID and ATK need 4 autofills: the widest search it can face.
        for (int i = 0; i < 40; i++) {
            this.add(1000 + i, GK, ZAG, false, 600);
        }

        final Matchmaker.MatchPlan plan = this.find();

        assertNotNull(plan);

        int autofilled = 0;

        for (final Matchmaker.Slot slot : plan.getSlots()) {
            if (slot.isAutofilled()) {
                autofilled++;
            }
        }

        assertEquals(4, autofilled);
    }

    @Test(timeout = 1000)
    public void impossibleSearchGivesUpFast() {
        // Every player is protected and wants GK: no anchor can ever close a match.
        for (int i = 0; i < 40; i++) {
            this.add(1000, GK, ZAG, true, 600);
        }

        assertNull(this.find());
    }

    private void addLineupWithoutGoalkeepers(boolean autofillProtected, int waitedSeconds) {
        this.add(1000, ZAG, MID, autofillProtected, waitedSeconds);
        this.add(1000, ZAG, MID, autofillProtected, waitedSeconds);
        this.add(1000, ZAG, ATK, autofillProtected, waitedSeconds);
        this.add(1000, MID, ZAG, autofillProtected, waitedSeconds);
        this.add(1000, MID, ATK, autofillProtected, waitedSeconds);
        this.add(1000, ATK, ZAG, autofillProtected, waitedSeconds);
        this.add(1000, ATK, MID, autofillProtected, waitedSeconds);
        this.add(1000, ATK, ZAG, autofillProtected, waitedSeconds);
    }
}
