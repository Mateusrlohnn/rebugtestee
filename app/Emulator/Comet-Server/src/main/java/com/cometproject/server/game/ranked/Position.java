package com.cometproject.server.game.ranked;

/**
 * Positions of a 4x4 team. Every match needs two of each, one per team when the teams split evenly.
 */
public enum Position {
    GK("Goleiro"),
    ZAG("Zagueiro"),
    MID("Meia"),
    ATK("Atacante");

    private final String displayName;

    Position(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    /**
     * Reads a position code such as "GK", or null when it is empty or unknown.
     */
    public static Position fromCode(String code) {
        if (code == null) {
            return null;
        }

        for (final Position position : values()) {
            if (position.name().equalsIgnoreCase(code.trim())) {
                return position;
            }
        }

        return null;
    }
}
