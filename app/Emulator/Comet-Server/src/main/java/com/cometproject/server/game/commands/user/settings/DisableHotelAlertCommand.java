package com.cometproject.server.game.commands.user.settings;

import com.cometproject.server.config.Locale;
import com.cometproject.server.game.commands.ChatCommand;
import com.cometproject.server.game.players.types.PlayerSettings;
import com.cometproject.server.network.sessions.Session;
import com.cometproject.server.storage.queries.player.PlayerDao;

public class DisableHotelAlertCommand extends ChatCommand {
    @Override
    public void execute(Session client, String[] params) {
        final PlayerSettings playerSettings = client.getPlayer().getSettings();

        playerSettings.setDisableHotelAlert(!playerSettings.disableHotelAlert());

        final String msg = playerSettings.disableHotelAlert() ? "desativados" : "ativados";
        sendNotif(Locale.getOrDefault("command.disablehotelalert." + msg, String.format("Alertas do hotel agora estão %s.", msg)), client);
        PlayerDao.updateHotelAlerts(playerSettings.disableHotelAlert(), client.getPlayer().getId());
    }

    @Override
    public String getPermission() {
        return "disablehotelalert_command";
    }

    @Override
    public String getParameter() {
        return "";
    }

    @Override
    public String getDescription() {
        return Locale.getOrDefault("command.disablehotelalert.description", "Ativa ou desativa alertas do hotel.");
    }
}
