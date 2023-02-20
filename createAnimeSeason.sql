USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS AnimeSeason;
GO

CREATE TABLE dbo.AnimeSeason
(
  anime_id INT IDENTITY(1,1) NOT NULL,
  season_number INT NOT NULL,
  episodes INT NOT NULL,
  episode_duration TIME(0) NOT NULL,
  rating DECIMAL(3,1) NOT NULL,
  year_released INT NOT NULL,
  CONSTRAINT PK_AnimeSeason PRIMARY KEY (anime_id, season_number)
);
