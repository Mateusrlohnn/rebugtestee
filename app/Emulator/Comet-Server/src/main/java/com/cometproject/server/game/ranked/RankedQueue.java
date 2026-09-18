package com.cometproject.server.game.ranked;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Players waiting for a ranked match in one room, in the order they joined.
 */
public class RankedQueue {
    private final int roomId;
    private final Map<Integer, Entry> entries = new LinkedHashMap<>();

    public RankedQueue(int roomId) {
        this.roomId = roomId;
    }

    public synchronized boolean add(int playerId, String username) {
        if (this.entries.containsKey(playerId)) {
            return false;
        }

        this.entries.put(playerId, new Entry(playerId, username, System.currentTimeMillis()));
        return true;
    }

    public synchronized boolean remove(int playerId) {
        return this.entries.remove(playerId) != null;
    }

    public synchronized boolean contains(int playerId) {
        return this.entries.containsKey(playerId);
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

    public int getRoomId() {
        return this.roomId;
    }

    public static class Entry {
        private final int playerId;
        private final String username;
        private final long joinedAt;

        public Entry(int playerId, String username, long joinedAt) {
            this.playerId = playerId;
            this.username = username;
            this.joinedAt = joinedAt;
        }

        public int getPlayerId() {
            return this.playerId;
        }

        public String getUsername() {
            return this.username;
        }

        public long getJoinedAt() {
            return this.joinedAt;
        }
    }
}
