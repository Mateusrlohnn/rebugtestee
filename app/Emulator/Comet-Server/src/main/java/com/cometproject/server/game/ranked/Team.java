package com.cometproject.server.game.ranked;

public enum Team {
    BLUE("Azul"),
    RED("Vermelho");

    private final String displayName;

    Team(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return this.displayName;
    }
}
