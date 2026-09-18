package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Picks 8 players and their positions (2 of each) from the queue. It has no state and no database access.
 *
 * The anchor is the player waiting longest; their wait sets the {@link SearchWindow} for everyone: the MMR margin
 * around the anchor and whether secondary positions and autofill are allowed. A player with autofill protection is
 * never autofilled. Among the lineups that fit, the best one has, in this order: fewer autofills, fewer secondary
 * positions, autofilled players closer to the anchor's MMR, and players who waited longer. When the anchor cannot
 * get a match, the next player in waiting order is tried.
 */
public final class Matchmaker {
    public static final int PLAYERS_PER_POSITION = 2;
    public static final int MATCH_SIZE = PLAYERS_PER_POSITION * Position.values().length;

    // The anchor plus the players waiting longest within the margin; keeps the search small and fast.
    static final int MAX_POOL = 12;

    private static final long AUTOFILL_COST = 1_000_000_000_000L;
    private static final long SECONDARY_COST = 1_000_000_000L;
    private static final long MMR_DISTANCE_COST = 1_000L;

    private Matchmaker() {
    }

    public static MatchPlan find(List<Candidate> queue, long now) {
        final List<Candidate> byWait = new ArrayList<>(queue);
        byWait.sort(Comparator.comparingLong(Candidate::getJoinedAt));

        for (final Candidate anchor : byWait) {
            final SearchWindow window = SearchWindow.forWait((now - anchor.getJoinedAt()) / 1000);
            final List<Candidate> pool = new ArrayList<>();
            pool.add(anchor);

            for (final Candidate candidate : byWait) {
                if (pool.size() == MAX_POOL) {
                    break;
                }

                if (candidate != anchor && Math.abs(candidate.getMmr() - anchor.getMmr()) <= window.getMmrMargin()) {
                    pool.add(candidate);
                }
            }

            if (pool.size() < MATCH_SIZE) {
                continue;
            }

            final MatchPlan plan = new Search(anchor, pool, window).run();

            if (plan != null) {
                return plan;
            }
        }

        return null;
    }

    /**
     * How a player may take a position, or null when they may not.
     */
    static Placement placement(Candidate candidate, Position position, SearchWindow window) {
        if (position == candidate.getPrimary()) {
            return Placement.PRIMARY;
        }

        if (position == candidate.getSecondary()) {
            return window.isSecondaryAllowed() ? Placement.SECONDARY : null;
        }

        return window.isAutofillAllowed() && !candidate.isAutofillProtected() ? Placement.AUTOFILL : null;
    }

    /**
     * Depth-first search over the pool: each player either takes a free position or stays in the queue. The anchor,
     * first in the pool, always plays.
     */
    private static final class Search {
        private final Candidate anchor;
        private final List<Candidate> pool;
        private final SearchWindow window;

        private final int[] freeSlots = new int[Position.values().length];
        private final Slot[] lineup = new Slot[MATCH_SIZE];
        private int lineupSize;

        private Slot[] best;
        private long bestCost = Long.MAX_VALUE;

        private Search(Candidate anchor, List<Candidate> pool, SearchWindow window) {
            this.anchor = anchor;
            this.pool = pool;
            this.window = window;
            Arrays.fill(this.freeSlots, PLAYERS_PER_POSITION);
        }

        private MatchPlan run() {
            this.visit(0, 0);
            return this.best == null ? null : new MatchPlan(Arrays.asList(this.best));
        }

        private void visit(int index, long cost) {
            if (cost >= this.bestCost) {
                return;
            }

            if (this.lineupSize == MATCH_SIZE) {
                this.bestCost = cost;
                this.best = this.lineup.clone();
                return;
            }

            if (this.pool.size() - index < MATCH_SIZE - this.lineupSize) {
                return;
            }

            final Candidate candidate = this.pool.get(index);

            for (final Position position : this.preferredOrder(candidate)) {
                final Placement placement = placement(candidate, position, this.window);

                if (placement == null || this.freeSlots[position.ordinal()] == 0) {
                    continue;
                }

                this.freeSlots[position.ordinal()]--;
                this.lineup[this.lineupSize++] = new Slot(candidate, position, placement);

                this.visit(index + 1, cost + this.cost(candidate, placement, index));

                this.lineupSize--;
                this.freeSlots[position.ordinal()]++;
            }

            if (candidate != this.anchor) {
                this.visit(index + 1, cost);
            }
        }

        private long cost(Candidate candidate, Placement placement, int waitRank) {
            long cost = waitRank;

            if (placement == Placement.SECONDARY) {
                cost += SECONDARY_COST;
            } else if (placement == Placement.AUTOFILL) {
                cost += AUTOFILL_COST + MMR_DISTANCE_COST * Math.abs(candidate.getMmr() - this.anchor.getMmr());
            }

            return cost;
        }

        /**
         * Tries the primary, then the secondary, then the rest, so good lineups are found first and prune the rest.
         */
        private List<Position> preferredOrder(Candidate candidate) {
            final List<Position> order = new ArrayList<>();
            order.add(candidate.getPrimary());

            if (candidate.getSecondary() != null && candidate.getSecondary() != candidate.getPrimary()) {
                order.add(candidate.getSecondary());
            }

            for (final Position position : Position.values()) {
                if (!order.contains(position)) {
                    order.add(position);
                }
            }

            return order;
        }
    }

    public enum Placement {
        PRIMARY,
        SECONDARY,
        AUTOFILL
    }

    public static final class Candidate {
        private final int playerId;
        private final int mmr;
        private final Position primary;
        private final Position secondary;
        private final boolean autofillProtected;
        private final long joinedAt;

        public Candidate(int playerId, int mmr, Position primary, Position secondary, boolean autofillProtected, long joinedAt) {
            this.playerId = playerId;
            this.mmr = mmr;
            this.primary = primary;
            this.secondary = secondary;
            this.autofillProtected = autofillProtected;
            this.joinedAt = joinedAt;
        }

        public int getPlayerId() {
            return this.playerId;
        }

        public int getMmr() {
            return this.mmr;
        }

        public Position getPrimary() {
            return this.primary;
        }

        public Position getSecondary() {
            return this.secondary;
        }

        public boolean isAutofillProtected() {
            return this.autofillProtected;
        }

        public long getJoinedAt() {
            return this.joinedAt;
        }
    }

    public static final class Slot {
        private final Candidate candidate;
        private final Position position;
        private final Placement placement;

        public Slot(Candidate candidate, Position position, Placement placement) {
            this.candidate = candidate;
            this.position = position;
            this.placement = placement;
        }

        public Candidate getCandidate() {
            return this.candidate;
        }

        public Position getPosition() {
            return this.position;
        }

        public Placement getPlacement() {
            return this.placement;
        }

        public boolean isAutofilled() {
            return this.placement == Placement.AUTOFILL;
        }
    }

    public static final class MatchPlan {
        private final List<Slot> slots;

        public MatchPlan(List<Slot> slots) {
            this.slots = Collections.unmodifiableList(slots);
        }

        public List<Slot> getSlots() {
            return this.slots;
        }

        public Slot slotOf(int playerId) {
            for (final Slot slot : this.slots) {
                if (slot.getCandidate().getPlayerId() == playerId) {
                    return slot;
                }
            }

            return null;
        }
    }
}
