package com.cometproject.server.storage.queries.ranked;

import com.cometproject.server.game.ranked.RankedProfile;
import com.cometproject.server.game.ranked.RankedTier;
import com.cometproject.server.storage.SqlHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RankedDao {
    private static final String PROFILE_COLUMNS = "p.id AS player_id, p.username, r.tier, r.division, r.league_points, r.mmr, r.wins, r.losses, r.draws";

    /**
     * Loads the player's global ranked profile, creating it with the starting elo on first access.
     */
    public static RankedProfile getOrCreateProfile(int playerId) {
        Connection sqlConnection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            sqlConnection = SqlHelper.getConnection();

            preparedStatement = SqlHelper.prepare("INSERT IGNORE INTO queue_ranking (player_id, tier, division, league_points, mmr) VALUES (?, ?, ?, 0, ?)", sqlConnection);
            preparedStatement.setInt(1, playerId);
            preparedStatement.setInt(2, RankedTier.BRONZE.ordinal());
            preparedStatement.setInt(3, RankedProfile.LOWEST_DIVISION);
            preparedStatement.setInt(4, RankedProfile.DEFAULT_MMR);
            preparedStatement.execute();
            SqlHelper.closeSilently(preparedStatement);

            preparedStatement = SqlHelper.prepare("SELECT " + PROFILE_COLUMNS + " FROM queue_ranking r INNER JOIN players p ON p.id = r.player_id WHERE r.player_id = ?", sqlConnection);
            preparedStatement.setInt(1, playerId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return readProfile(resultSet);
            }
        } catch (SQLException e) {
            SqlHelper.handleSqlException(e);
        } finally {
            SqlHelper.closeSilently(resultSet);
            SqlHelper.closeSilently(preparedStatement);
            SqlHelper.closeSilently(sqlConnection);
        }

        return null;
    }

    public static List<RankedProfile> getTopProfiles(int limit) {
        Connection sqlConnection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        final List<RankedProfile> profiles = new ArrayList<>();

        try {
            sqlConnection = SqlHelper.getConnection();

            preparedStatement = SqlHelper.prepare("SELECT " + PROFILE_COLUMNS + " FROM queue_ranking r INNER JOIN players p ON p.id = r.player_id " +
                    "ORDER BY r.tier DESC, r.division ASC, r.league_points DESC, r.mmr DESC, r.player_id ASC LIMIT ?", sqlConnection);
            preparedStatement.setInt(1, limit);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                profiles.add(readProfile(resultSet));
            }
        } catch (SQLException e) {
            SqlHelper.handleSqlException(e);
        } finally {
            SqlHelper.closeSilently(resultSet);
            SqlHelper.closeSilently(preparedStatement);
            SqlHelper.closeSilently(sqlConnection);
        }

        return profiles;
    }

    /**
     * Position of the profile in the global ranking, starting at 1. Ties are ordered like getTopProfiles.
     */
    public static int getPosition(RankedProfile profile) {
        Connection sqlConnection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            sqlConnection = SqlHelper.getConnection();

            preparedStatement = SqlHelper.prepare("SELECT COUNT(*) FROM queue_ranking WHERE tier > ? OR (tier = ? AND (division < ? " +
                    "OR (division = ? AND (league_points > ? OR (league_points = ? AND (mmr > ? OR (mmr = ? AND player_id < ?)))))))", sqlConnection);
            preparedStatement.setInt(1, profile.getTier().ordinal());
            preparedStatement.setInt(2, profile.getTier().ordinal());
            preparedStatement.setInt(3, profile.getDivision());
            preparedStatement.setInt(4, profile.getDivision());
            preparedStatement.setInt(5, profile.getLeaguePoints());
            preparedStatement.setInt(6, profile.getLeaguePoints());
            preparedStatement.setInt(7, profile.getMmr());
            preparedStatement.setInt(8, profile.getMmr());
            preparedStatement.setInt(9, profile.getPlayerId());
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) + 1;
            }
        } catch (SQLException e) {
            SqlHelper.handleSqlException(e);
        } finally {
            SqlHelper.closeSilently(resultSet);
            SqlHelper.closeSilently(preparedStatement);
            SqlHelper.closeSilently(sqlConnection);
        }

        return 0;
    }

    private static RankedProfile readProfile(ResultSet resultSet) throws SQLException {
        return new RankedProfile(
                resultSet.getInt("player_id"),
                resultSet.getString("username"),
                RankedTier.fromId(resultSet.getInt("tier")),
                resultSet.getInt("division"),
                resultSet.getInt("league_points"),
                resultSet.getInt("mmr"),
                resultSet.getInt("wins"),
                resultSet.getInt("losses"),
                resultSet.getInt("draws"));
    }
}
