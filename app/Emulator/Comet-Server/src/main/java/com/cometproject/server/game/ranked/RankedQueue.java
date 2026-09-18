package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

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

    public synchronized int count(Predicate<Entry> filter) {
        int count = 0;

        for (final Entry entry : this.entries.values()) {
            if (filter.test(entry)) {
                count++;
            }
        }

        return count;
    }

    /**
     * Removes and returns the first players accepted by the filter when there are enough of them for a match.
     */
    public synchronized List<Entry> pollMatch(int matchSize, Predicate<Entry> filter) {
        final List<Entry> match = new ArrayList<>();

        for (final Entry entry : this.entries.values()) {
            if (match.size() < matchSize && filter.test(entry)) {
                match.add(entry);
            }
        }

        if (match.size() < matchSize) {
            return null;
        }

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
