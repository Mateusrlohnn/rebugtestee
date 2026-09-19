package com.cometproject.server.game.ranked;

public class RankedProfile {
    public static final int DEFAULT_MMR = 1000;
    public static final int LOWEST_DIVISION = 4;

    private static final String[] DIVISION_NAMES = {"", "I", "II", "III", "IV"};

    private final int playerId;
    private final String username;
    private final String figure;
    private final RankedTier tier;
    private final int division;
    private final int leaguePoints;
    private final int mmr;
    private final int wins;
    private final int losses;
    private final int draws;
    private final Position primary;
    private final Position secondary;
    private final boolean autofillProtected;

    public RankedProfile(int playerId, String username, String figure, RankedTier tier, int division, int leaguePoints, int mmr,
                         int wins, int losses, int draws, Position primary, Position secondary, boolean autofillProtected) {
        this.playerId = playerId;
        this.username = username;
        this.figure = figure;
        this.tier = tier;
        this.division = tier.hasDivisions() ? Math.max(1, Math.min(LOWEST_DIVISION, division)) : 0;
        this.leaguePoints = leaguePoints;
        this.mmr = mmr;
        this.wins = wins;
        this.losses = losses;
        this.draws = draws;
        this.primary = primary;
        this.secondary = secondary;
        this.autofillProtected = autofillProtected;
    }

    public boolean hasPositions() {
        return this.primary != null && this.secondary != null;
    }

    public int getMatchesPlayed() {
        return this.wins + this.losses + this.draws;
    }

    public Position getPrimary() {
        return this.primary;
    }

    public Position getSecondary() {
        return this.secondary;
    }

    public boolean isAutofillProtected() {
        return this.autofillProtected;
    }

    public String getEloDisplay() {
        if (this.tier.hasDivisions()) {
            return this.tier.getDisplayName() + " " + DIVISION_NAMES[this.division] + " - " + this.leaguePoints + " PDL";
        }

        return this.tier.getDisplayName() + " - " + this.leaguePoints + " PDL";
    }

    public String getDivisionName() {
        return DIVISION_NAMES[this.division];
    }

    public int getWinRate() {
        final int games = this.wins + this.losses + this.draws;
        return games == 0 ? 0 : Math.round(this.wins * 100f / games);
    }

    public String getRecordDisplay() {
        return this.wins + "V " + this.losses + "D " + this.draws + "E";
    }

    public int getPlayerId() {
        return this.playerId;
    }

    public String getUsername() {
        return this.username;
    }

    public String getFigure() {
        return this.figure;
    }

    public RankedTier getTier() {
        return this.tier;
    }

    public int getDivision() {
        return this.division;
    }

    public int getLeaguePoints() {
        return this.leaguePoints;
    }

    public int getMmr() {
        return this.mmr;
    }

    public int getWins() {
        return this.wins;
    }

    public int getLosses() {
        return this.losses;
    }

    public int getDraws() {
        return this.draws;
    }
}
