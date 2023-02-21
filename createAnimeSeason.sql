USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS AnimeSeason;
GO

CREATE TABLE anime_season
(
  anime_series_id int IDENTITY(1,1) NOT NULL,
  anime_season_numberr int NOT NULL,
  anime_season_episodes int NOT NULL,
  anime_season_episode_duration time(0) NOT NULL,
  anime_season_rating decimal(3,1) NOT NULL,
  anime_season_start_date int NOT NULL
);
