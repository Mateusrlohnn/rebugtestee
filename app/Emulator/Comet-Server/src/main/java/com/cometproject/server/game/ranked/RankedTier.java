package com.cometproject.server.game.ranked;

public enum RankedTier {
    BRONZE("Bronze", true),
    SILVER("Prata", true),
    GOLD("Ouro", true),
    PLATINUM("Platina", true),
    EMERALD("Esmeralda", true),
    DIAMOND("Diamante", true),
    MASTER("Mestre", false),
    GRANDMASTER("Grão-Mestre", false),
    CHALLENGER("Desafiante", false);

    private final String displayName;
    private final boolean hasDivisions;

    RankedTier(String displayName, boolean hasDivisions) {
        this.displayName = displayName;
        this.hasDivisions = hasDivisions;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public boolean hasDivisions() {
        return this.hasDivisions;
    }

    public static RankedTier fromId(int id) {
        final RankedTier[] tiers = values();

        if (id < 0 || id >= tiers.length) {
            return BRONZE;
        }

        return tiers[id];
    }
}
