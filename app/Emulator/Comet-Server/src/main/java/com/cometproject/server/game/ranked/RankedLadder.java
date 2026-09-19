package com.cometproject.server.game.ranked;

import com.cometproject.server.storage.queries.ranked.RankedDao;

import java.time.Duration;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Decides who is Master, Grandmaster or Challenger among the players at the top.
 *
 * Challenger: the highest-scoring apex players, recalculated once a day; they keep the title until the next update.
 * Grandmaster: the next best players, recalculated after every match, so passing the last Grandmaster's points
 * takes their place right away.
 */
public class RankedLadder {
    public static final int CHALLENGER_SLOTS = 3;
    public static final int GRANDMASTER_SLOTS = 10;

    private static final ZoneId HOTEL_ZONE = ZoneId.of("America/Sao_Paulo");

    private static final RankedLadder instance = new RankedLadder();

    private final ScheduledExecutorService dailyTimer = Executors.newSingleThreadScheduledExecutor();

    private RankedLadder() {
        this.scheduleDailyUpdate();
    }

    public static RankedLadder getInstance() {
        return instance;
    }

    /**
     * Fills the Grandmaster slots with the best apex players who are not Challenger.
     */
    public synchronized void refreshGrandmasters() {
        int grandmasters = 0;

        for (final RankedDao.ApexStanding standing : RankedDao.getApexStandings()) {
            if (standing.getTier() == RankedTier.CHALLENGER) {
                continue;
            }

            final RankedTier tier = grandmasters++ < GRANDMASTER_SLOTS ? RankedTier.GRANDMASTER : RankedTier.MASTER;
            this.updateTier(standing, tier);
        }
    }

    /**
     * Daily update: the best apex players become Challenger, then the Grandmaster slots are filled again.
     */
    public synchronized void refreshChallengers() {
        final List<RankedDao.ApexStanding> standings = RankedDao.getApexStandings();
        int position = 0;

        for (final RankedDao.ApexStanding standing : standings) {
            final RankedTier tier;

            if (position < CHALLENGER_SLOTS) {
                tier = RankedTier.CHALLENGER;
            } else if (position < CHALLENGER_SLOTS + GRANDMASTER_SLOTS) {
                tier = RankedTier.GRANDMASTER;
            } else {
                tier = RankedTier.MASTER;
            }

            this.updateTier(standing, tier);
            position++;
        }
    }

    private void updateTier(RankedDao.ApexStanding standing, RankedTier tier) {
        if (standing.getTier() != tier) {
            RankedDao.setApexTier(standing.getPlayerId(), tier);
        }
    }

    private void scheduleDailyUpdate() {
        final ZonedDateTime now = ZonedDateTime.now(HOTEL_ZONE);
        final ZonedDateTime midnight = now.toLocalDate().plusDays(1).atStartOfDay(HOTEL_ZONE);

        this.dailyTimer.scheduleAtFixedRate(this::refreshChallengers,
                Duration.between(now, midnight).getSeconds(), TimeUnit.DAYS.toSeconds(1), TimeUnit.SECONDS);
    }
}
