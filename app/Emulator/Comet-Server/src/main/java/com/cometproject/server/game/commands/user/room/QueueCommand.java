package com.cometproject.server.game.commands.user.room;

import com.cometproject.server.config.Locale;
import com.cometproject.server.game.commands.ChatCommand;
import com.cometproject.server.game.ranked.RankedQueueManager;
import com.cometproject.server.network.sessions.Session;

/**
 * Opens the ranked queue panel. Everything else (join, leave, ranking, rules) happens inside it.
 */
public class QueueCommand extends ChatCommand {
    @Override
    public void execute(Session client, String[] params) {
        RankedQueueManager.getInstance().handleAction(client, "open");
    }

    @Override
    public String getPermission() {
        return "queue_command";
    }

    @Override
    public String getParameter() {
        return "";
    }

    @Override
    public String getDescription() {
        return Locale.getOrDefault("command.queue.description", "Abre o painel da fila ranqueada 4x4");
    }

    @Override
    public boolean isAsync() {
        return true;
    }
}
