package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.Collection;
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

    public synchronized void removeAll(Collection<Integer> playerIds) {
        for (final int playerId : playerIds) {
            this.entries.remove(playerId);
        }
    }

    public synchronized Entry get(int playerId) {
        return this.entries.get(playerId);
    }

    public synchronized List<Entry> getEntries() {
        return new ArrayList<>(this.entries.values());
    }

    public synchronized List<Entry> getEntries(Predicate<Entry> filter) {
        final List<Entry> entries = new ArrayList<>();

        for (final Entry entry : this.entries.values()) {
            if (filter.test(entry)) {
                entries.add(entry);
            }
        }

        return entries;
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

        public Matchmaker.Candidate toCandidate() {
            return new Matchmaker.Candidate(this.profile.getPlayerId(), this.profile.getMmr(), this.profile.getPrimary(),
                    this.profile.getSecondary(), this.profile.isAutofillProtected(), this.joinedAt);
        }
    }
}
