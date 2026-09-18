package com.cometproject.server.game.ranked;

import com.cometproject.server.game.rooms.objects.entities.types.PlayerEntity;
import com.cometproject.server.game.rooms.types.Room;
import com.cometproject.server.network.messages.outgoing.room.avatar.WhisperMessageComposer;
import com.cometproject.server.storage.queries.ranked.RankedDao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Keeps one ranked queue per room. The elo behind it is global, stored in queue_ranking.
 */
public class RankedQueueManager {
    public static final int TEAM_SIZE = 4;
    public static final int MATCH_SIZE = TEAM_SIZE * 2;

    private static final RankedQueueManager instance = new RankedQueueManager();

    private final Map<Integer, RankedQueue> queues = new ConcurrentHashMap<>();

    public static RankedQueueManager getInstance() {
        return instance;
    }

    public RankedQueue getQueue(int roomId) {
        return this.queues.computeIfAbsent(roomId, RankedQueue::new);
    }

    public boolean join(Room room, int playerId, String username) {
        final RankedQueue queue = this.getQueue(room.getId());

        if (!queue.add(playerId, username)) {
            return false;
        }

        this.broadcast(room, username + " entrou na fila ranqueada (" + queue.size() + "/" + MATCH_SIZE + ").");
        this.tryStartMatch(room, queue);
        return true;
    }

    public boolean leave(Room room, int playerId, String username) {
        final RankedQueue queue = this.queues.get(room.getId());

        if (queue == null || !queue.remove(playerId)) {
            return false;
        }

        this.broadcast(room, username + " saiu da fila ranqueada (" + queue.size() + "/" + MATCH_SIZE + ").");
        return true;
    }

    public void onPlayerLeaveRoom(PlayerEntity entity) {
        if (entity.getRoom() == null || entity.getPlayer() == null) {
            return;
        }

        this.leave(entity.getRoom(), entity.getPlayerId(), entity.getPlayer().getData().getUsername());
    }

    private void tryStartMatch(Room room, RankedQueue queue) {
        final List<RankedQueue.Entry> players = queue.pollMatch(MATCH_SIZE);

        if (players == null) {
            return;
        }

        final List<RankedProfile> profiles = new ArrayList<>();

        for (final RankedQueue.Entry entry : players) {
            final RankedProfile profile = RankedDao.getOrCreateProfile(entry.getPlayerId());

            if (profile != null) {
                profiles.add(profile);
            }
        }

        // Shuffle first so players with an identical elo are ordered randomly; the sort is stable.
        Collections.shuffle(profiles);
        profiles.sort(RankedProfile.BEST_FIRST);

        final StringBuilder message = new StringBuilder("Partida encontrada!");

        if (profiles.size() >= 2) {
            message.append(" Capitães: ")
                    .append(profiles.get(0).getUsername()).append(" (").append(profiles.get(0).getEloDisplay()).append(") e ")
                    .append(profiles.get(1).getUsername()).append(" (").append(profiles.get(1).getEloDisplay()).append(").");
        }

        this.broadcast(room, message.toString());
    }

    private void broadcast(Room room, String message) {
        for (final PlayerEntity entity : room.getEntities().getPlayerEntities()) {
            if (entity.getPlayer() == null || entity.getPlayer().getSession() == null) {
                continue;
            }

            entity.getPlayer().getSession().send(new WhisperMessageComposer(entity.getId(), message));
        }
    }
}
