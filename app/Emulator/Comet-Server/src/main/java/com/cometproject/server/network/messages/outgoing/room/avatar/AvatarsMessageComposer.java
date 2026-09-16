package com.cometproject.server.network.messages.outgoing.room.avatar;

import com.cometproject.api.networking.messages.IComposer;
import com.cometproject.server.game.rooms.objects.entities.RoomEntity;
import com.cometproject.server.game.rooms.objects.entities.types.PlayerEntity;
import com.cometproject.server.game.rooms.types.Room;
import com.cometproject.server.protocol.headers.Composers;
import com.cometproject.server.protocol.messages.MessageComposer;
import com.google.common.collect.Lists;

import java.util.List;


public AvatarsMessageComposer(final Room room) {
    this.entities = Lists.newArrayList();

    System.out.println("=== AVATARS SNAPSHOT ROOM " + room.getId() + " ===");

    for (final RoomEntity entity : room.getEntities().getAllEntities().values()) {

        System.out.println(
                "Entity id=" + entity.getId()
                + " visible=" + entity.isVisible()
                + " type=" + entity.getClass().getSimpleName()
        );

        if (entity.isVisible()) {
            if (entity instanceof PlayerEntity) {
                PlayerEntity playerEntity = (PlayerEntity) entity;

                if (playerEntity.getPlayer() == null) {
                    System.out.println("IGNORADO: Player null, entity=" + entity.getId());
                    continue;
                }

                System.out.println(
                        "PLAYER: " +
                        playerEntity.getPlayer().getData().getUsername()
                );
            }

            this.entities.add(entity);
        }
    }

    System.out.println("TOTAL ENVIADO: " + this.entities.size());
    System.out.println("==============================");

    this.singleEntity = null;
}

    public AvatarsMessageComposer(RoomEntity entity) {
        this.singleEntity = entity;
        this.entities = null;
    }

    public AvatarsMessageComposer(List<RoomEntity> entities) {
        this.singleEntity = null;
        this.entities = entities;
    }

    @Override
    public short getId() {
        return Composers.UsersMessageComposer;
    }

    @Override
    public void compose(IComposer msg) {
        if (this.singleEntity != null) {
            msg.writeInt(1);

            this.singleEntity.compose(msg);
        } else {
            msg.writeInt(this.entities.size());

            for (RoomEntity entity : this.entities) {
                entity.compose(msg);
            }
        }
    }

