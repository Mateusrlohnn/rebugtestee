package com.cometproject.server.game.ranked;

import java.util.Comparator;

public class RankedProfile {
    public static final int DEFAULT_MMR = 1000;
    public static final int LOWEST_DIVISION = 4;

    /**
     * Best player first: higher tier, better division (I before IV), more PDL, then higher MMR.
     */
    public static final Comparator<RankedProfile> BEST_FIRST = Comparator
            .comparingInt((RankedProfile profile) -> profile.getTier().ordinal()).reversed()
            .thenComparingInt(RankedProfile::getDivision)
            .thenComparing(Comparator.comparingInt(RankedProfile::getLeaguePoints).reversed())
            .thenComparing(Comparator.comparingInt(RankedProfile::getMmr).reversed());

    private static final String[] DIVISION_NAMES = {"", "I", "II", "III", "IV"};

    private final int playerId;
    private final String username;
    private final RankedTier tier;
    private final int division;
    private final int leaguePoints;
    private final int mmr;
    private final int wins;
    private final int losses;
    private final int draws;

    public RankedProfile(int playerId, String username, RankedTier tier, int division, int leaguePoints, int mmr, int wins, int losses, int draws) {
        this.playerId = playerId;
        this.username = username;
        this.tier = tier;
        this.division = tier.hasDivisions() ? Math.max(1, Math.min(LOWEST_DIVISION, division)) : 0;
        this.leaguePoints = leaguePoints;
        this.mmr = mmr;
        this.wins = wins;
        this.losses = losses;
        this.draws = draws;
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
