USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS AnimeSeason;
GO

CREATE VIEW dbo.AnimeSeasonView
AS
SELECT anime_id, season_number, episodes, episode_duration, rating, year_released, episodes * episode_duration AS total_duration
FROM dbo.AnimeSeason;
GO
