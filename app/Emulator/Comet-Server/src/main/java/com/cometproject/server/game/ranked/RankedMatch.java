package com.cometproject.server.game.ranked;

import java.util.List;

/**
 * A match found by the queue. Players meet and organize it on their own.
 */
public class RankedMatch {
    private final List<RankedProfile> players;
    private final long foundAt;

    public RankedMatch(List<RankedProfile> players, long foundAt) {
        this.players = players;
        this.foundAt = foundAt;
    }

    /**
     * Players ordered best first, so the first two are the captains.
     */
    public List<RankedProfile> getPlayers() {
        return this.players;
    }

    public boolean isCaptain(RankedProfile profile) {
        return this.players.indexOf(profile) < 2;
    }

    public long getFoundAt() {
        return this.foundAt;
    }
}
