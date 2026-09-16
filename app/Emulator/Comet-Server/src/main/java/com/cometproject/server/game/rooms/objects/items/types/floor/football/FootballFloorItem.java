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
                normalizeRotation(entity.getBodyRotation()),
                normalizeRotation(entity.getPreviousBodyRotation()),
                new BallonFootBall(this, entity, lastStep)
        );

        synchronized (this.contestLock) {
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

            winner = this.chooseWinner(touches);
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

    private PendingTouch chooseWinner(List<PendingTouch> touches) {
        final Integer nitroOwnerEntityId = this.getRoom().getFutnitroPriorityEntityId();
        RoomEntity owner = nitroOwnerEntityId == null
                ? null
                : this.getRoom().getEntities().getEntity(nitroOwnerEntityId);

        if (owner == null) {
            this.clearNitroOwner();
            owner = null;
        }

        if (owner == null) {
            final PendingTouch firstOwner = this.strongestTouch(touches);
            this.acquireNitro(firstOwner.entity);
            return firstOwner;
        }

        PendingTouch ownerTouch = null;
        final List<PendingTouch> challengers = new ArrayList<>();

        for (final PendingTouch touch : touches) {
            if (touch.entity.getId() == owner.getId()) {
                ownerTouch = touch;
            } else {
                challengers.add(touch);
            }
        }

        if (challengers.isEmpty()) {
            return ownerTouch;
        }

        // A troca de prioridade e calculada pelos passos e angulos do avatar no
        // quarto. Aqui apenas aplicamos essa prioridade sem alterar a fisica da
        // bola Rebug.
        return ownerTouch != null ? ownerTouch : this.strongestTouch(challengers);
    }

    private PendingTouch strongestTouch(List<PendingTouch> touches) {
        PendingTouch strongest = touches.get(0);
        int strongestPoints = this.previewAttackPoints(strongest);

        for (int i = 1; i < touches.size(); i++) {
            final PendingTouch candidate = touches.get(i);
            final int candidatePoints = this.previewAttackPoints(candidate);

            if (candidatePoints > strongestPoints ||
                    (candidatePoints == strongestPoints && candidate.entity.getId() < strongest.entity.getId())) {
                strongest = candidate;
                strongestPoints = candidatePoints;
            }
        }

        return strongest;
    }

    private int previewAttackPoints(PendingTouch touch) {
        return this.baseAttackPoints(touch, turnDifference(touch.previousRotation, touch.rotation));
    }

    private int baseAttackPoints(PendingTouch touch, int turn) {
        if (turn == 4) {
            return 8;
        }

        int points = (touch.rotation % 2 != 0) ? 32 : 18;

        switch (turn) {
            case 1 -> points += 8;
            case 2 -> points += 18;
            case 3 -> points += 12;
            default -> {
            }
        }

        return points;
    }

    private void acquireNitro(RoomEntity entity) {
        this.getRoom().setFutnitroPriorityEntityId(entity.getId());
    }

    private void clearNitroOwner() {
        this.getRoom().setFutnitroPriorityEntityId(null);
    }

    private static int normalizeRotation(int rotation) {
        return Math.floorMod(rotation, 8);
    }

    private static int turnDifference(int previousRotation, int rotation) {
        final int difference = Math.abs(normalizeRotation(rotation) - normalizeRotation(previousRotation));
        return Math.min(difference, 8 - difference);
    }

    private static final class PendingTouch {
        private final RoomEntity entity;
        private final boolean lastStep;
        private final int rotation;
        private final int previousRotation;
        private final BallonFootBall kickTask;

        private PendingTouch(RoomEntity entity, boolean lastStep, int rotation, int previousRotation,
                             BallonFootBall kickTask) {
            this.entity = entity;
            this.lastStep = lastStep;
            this.rotation = rotation;
            this.previousRotation = previousRotation;
            this.kickTask = kickTask;
        }
    }

}
