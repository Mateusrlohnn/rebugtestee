package com.cometproject.server.network.messages.incoming.ranked;

import com.cometproject.server.game.ranked.RankedQueueManager;
import com.cometproject.server.network.messages.incoming.Event;
import com.cometproject.server.network.sessions.Session;
import com.cometproject.server.protocol.messages.MessageEvent;

/**
 * Button clicks from the :queue panel in app/hotel-web/index.html.
 */
public class RankedPanelMessageEvent implements Event {
    public static final short HEADER = 7701;

    @Override
    public void handle(Session client, MessageEvent msg) {
        if (client.getPlayer() == null) {
            return;
        }

        final String action = msg.readString();

        if (client.getPlayer().antiSpam(getClass().getName() + action, 0.5)) {
            return;
        }

        RankedQueueManager.getInstance().handleAction(client, action);
    }
}
