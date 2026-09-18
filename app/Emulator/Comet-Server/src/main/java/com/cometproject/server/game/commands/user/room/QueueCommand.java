package com.cometproject.server.game.commands.user.room;

import com.cometproject.server.config.Locale;
import com.cometproject.server.game.commands.ChatCommand;
import com.cometproject.server.game.ranked.RankedProfile;
import com.cometproject.server.game.ranked.RankedQueue;
import com.cometproject.server.game.ranked.RankedQueueManager;
import com.cometproject.server.game.rooms.types.Room;
import com.cometproject.server.network.sessions.Session;
import com.cometproject.server.storage.queries.ranked.RankedDao;

import java.util.List;

public class QueueCommand extends ChatCommand {
    private static final int RANKING_SIZE = 10;

    @Override
    public void execute(Session client, String[] params) {
        if (client.getPlayer().getEntity() == null || client.getPlayer().getEntity().getRoom() == null) {
            return;
        }

        final Room room = client.getPlayer().getEntity().getRoom();
        final int playerId = client.getPlayer().getId();
        final String username = client.getPlayer().getData().getUsername();

        final String action = params.length > 0 ? params[0].toLowerCase() : "";

        switch (action) {
            case "entrar":
            case "join":
                if (!RankedQueueManager.getInstance().join(room, playerId, username)) {
                    sendWhisper("Você já está na fila deste quarto.", client);
                }
                break;

            case "sair":
            case "leave":
                if (!RankedQueueManager.getInstance().leave(room, playerId, username)) {
                    sendWhisper("Você não está na fila deste quarto.", client);
                }
                break;

            case "elo":
                final RankedProfile profile = RankedDao.getOrCreateProfile(playerId);

                if (profile != null) {
                    sendWhisper("Seu elo: " + profile.getEloDisplay() + " (" + profile.getRecordDisplay() + ").", client);
                }
                break;

            case "ranking":
                sendAlert(this.buildRanking(), client);
                break;

            case "":
                sendAlert(this.buildStatus(room), client);
                break;

            default:
                sendWhisper("Use :queue, :queue entrar, :queue sair, :queue elo ou :queue ranking.", client);
                break;
        }
    }

    private String buildStatus(Room room) {
        final List<RankedQueue.Entry> entries = RankedQueueManager.getInstance().getQueue(room.getId()).getEntries();
        final long now = System.currentTimeMillis();

        final StringBuilder status = new StringBuilder("Fila ranqueada 4x4 (" + entries.size() + "/" + RankedQueueManager.MATCH_SIZE + ")\n\n");

        if (entries.isEmpty()) {
            status.append("Ninguém na fila.\n");
        }

        int position = 1;

        for (final RankedQueue.Entry entry : entries) {
            final RankedProfile profile = RankedDao.getOrCreateProfile(entry.getPlayerId());

            status.append(position++).append(". ").append(entry.getUsername());

            if (profile != null) {
                status.append(" - ").append(profile.getEloDisplay());
            }

            status.append(" (").append(formatWait(now - entry.getJoinedAt())).append(")\n");
        }

        status.append("\nUse :queue entrar ou :queue sair.");
        return status.toString();
    }

    private String buildRanking() {
        final List<RankedProfile> profiles = RankedDao.getTopProfiles(RANKING_SIZE);
        final StringBuilder ranking = new StringBuilder("Ranking global da fila\n\n");

        if (profiles.isEmpty()) {
            ranking.append("Ninguém jogou ainda.");
        }

        int position = 1;

        for (final RankedProfile profile : profiles) {
            ranking.append(position++).append(". ").append(profile.getUsername())
                    .append(" - ").append(profile.getEloDisplay())
                    .append(" (").append(profile.getRecordDisplay()).append(")\n");
        }

        return ranking.toString();
    }

    private static String formatWait(long millis) {
        final long seconds = millis / 1000;
        return String.format("%d:%02d", seconds / 60, seconds % 60);
    }

    @Override
    public String getPermission() {
        return "queue_command";
    }

    @Override
    public String getParameter() {
        return "[entrar|sair|elo|ranking]";
    }

    @Override
    public String getDescription() {
        return Locale.getOrDefault("command.queue.description", "Fila ranqueada 4x4 de futebol");
    }

    @Override
    public boolean isAsync() {
        return true;
    }
}
