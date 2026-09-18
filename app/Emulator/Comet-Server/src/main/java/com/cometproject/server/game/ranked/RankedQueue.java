package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Players waiting for a ranked match anywhere in the hotel, in the order they joined.
 */
public class RankedQueue {
    private final Map<Integer, Entry> entries = new LinkedHashMap<>();

    public synchronized boolean add(RankedProfile profile) {
        if (this.entries.containsKey(profile.getPlayerId())) {
            return false;
        }

        this.entries.put(profile.getPlayerId(), new Entry(profile, System.currentTimeMillis()));
        return true;
    }

    public synchronized boolean remove(int playerId) {
        return this.entries.remove(playerId) != null;
    }

    public synchronized Entry get(int playerId) {
        return this.entries.get(playerId);
    }

    public synchronized int size() {
        return this.entries.size();
    }

    public synchronized List<Entry> getEntries() {
        return new ArrayList<>(this.entries.values());
    }

    /**
     * Removes and returns the first players in the queue when there are enough for a match.
     */
    public synchronized List<Entry> pollMatch(int matchSize) {
        if (this.entries.size() < matchSize) {
            return null;
        }

        final List<Entry> match = new ArrayList<>(this.getEntries().subList(0, matchSize));

        for (final Entry entry : match) {
            this.entries.remove(entry.getPlayerId());
        }

        return match;
    }

    public static class Entry {
        private final RankedProfile profile;
        private final long joinedAt;

        public Entry(RankedProfile profile, long joinedAt) {
            this.profile = profile;
            this.joinedAt = joinedAt;
        }

        public int getPlayerId() {
            return this.profile.getPlayerId();
        }

        public RankedProfile getProfile() {
            return this.profile;
        }

        public long getJoinedAt() {
            return this.joinedAt;
        }
    }
}
