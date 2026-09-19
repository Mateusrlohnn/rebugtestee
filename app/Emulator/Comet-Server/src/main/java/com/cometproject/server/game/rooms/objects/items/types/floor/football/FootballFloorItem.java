package com.cometproject.server.game.rooms.objects.items.types.floor.football;

import com.cometproject.api.game.rooms.RoomProcessingType;
import com.cometproject.api.game.rooms.objects.data.RoomItemData;
import com.cometproject.server.game.rooms.objects.entities.RoomEntity;
import com.cometproject.server.game.rooms.objects.items.RoomItemFloor;
import com.cometproject.server.game.rooms.objects.items.types.floor.games.BallonFootBall;
import com.cometproject.server.game.rooms.types.Room;
import com.cometproject.server.tasks.CometThreadManager;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;


public class FootballFloorItem extends RoomItemFloor {
    private static final long CONTEST_WINDOW_MS = 50L;

    private final Object contestLock = new Object();
    private final Map<Integer, PendingTouch> pendingTouches = new LinkedHashMap<>();

    private boolean contestScheduled = false;

    public FootballFloorItem(RoomItemData itemData, Room room) {
        super(itemData, room);
    }

    @Override
    public RoomEntity getPusher() {
        return this.pusher;
    }

    private RoomEntity pusher;

    @Override
    public void onEntityPostStepOn(RoomEntity entity) {
        if (this.getRoom().getData().getRoomProcessType() != RoomProcessingType.PRESSURE) {
            this.pusher = entity;
            CometThreadManager.getInstance().executeSchedule(
                    new BallonFootBall(this, entity, entity.getProcessingPath().size() == 0),
                    CONTEST_WINDOW_MS,
                    TimeUnit.MILLISECONDS
            );
            return;
        }

        final boolean lastStep = entity.getProcessingPath().size() == 0;
        final PendingTouch touch = new PendingTouch(
                entity,
                lastStep,
                new BallonFootBall(this, entity, lastStep)
        );

        synchronized (this.contestLock) {
            // Um novo toque do mesmo jogador tambem precisa ocupar o fim da
            // fila, exatamente como ocorria quando o pusher era sobrescrito.
            this.pendingTouches.remove(entity.getId());
            this.pendingTouches.put(entity.getId(), touch);

            if (!this.contestScheduled) {
                this.contestScheduled = true;
                CometThreadManager.getInstance().executeSchedule(
                        this::resolvePressureContest,
                        CONTEST_WINDOW_MS,
                        TimeUnit.MILLISECONDS
                );
            }
        }
    }

    private void resolvePressureContest() {
        final PendingTouch winner;

        synchronized (this.contestLock) {
            final List<PendingTouch> touches = new ArrayList<>(this.pendingTouches.values());
            this.pendingTouches.clear();
            this.contestScheduled = false;

            if (touches.isEmpty()) {
                return;
            }

            // No Rebug, todos os movimentos do ciclo eram processados antes da
            // bica agendada. Cada entrada sobrescrevia o pusher da anterior;
            // portanto, o ultimo contato valido era quem assumia a bola.
            winner = touches.get(touches.size() - 1);
        }

        if (winner == null || winner.entity.getRoom() != this.getRoom()) {
            return;
        }

        this.pusher = winner.entity;
        this.getItemData().setData(winner.lastStep ? 55 : 0);
        CometThreadManager.getInstance().executeSchedule(
                winner.kickTask,
                0,
                TimeUnit.MILLISECONDS
        );
    }

    private static final class PendingTouch {
        private final RoomEntity entity;
        private final boolean lastStep;
        private final BallonFootBall kickTask;

        private PendingTouch(RoomEntity entity, boolean lastStep, BallonFootBall kickTask) {
            this.entity = entity;
            this.lastStep = lastStep;
            this.kickTask = kickTask;
        }
    }

}
