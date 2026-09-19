package com.cometproject.server.network.messages.outgoing.ranked;

import com.cometproject.api.networking.messages.IComposer;
import com.cometproject.server.protocol.messages.MessageComposer;
import com.google.gson.JsonObject;

/**
 * Data for the :queue panel drawn by app/hotel-web/index.html. Nitro has no parser for this header and ignores it.
 */
public class RankedPanelMessageComposer extends MessageComposer {
    public static final short HEADER = 7700;

    private final JsonObject data;

    public RankedPanelMessageComposer(JsonObject data) {
        this.data = data;
    }

    @Override
    public short getId() {
        return HEADER;
    }

    @Override
    public void compose(IComposer msg) {
        msg.writeString(this.data.toString());
    }
}
