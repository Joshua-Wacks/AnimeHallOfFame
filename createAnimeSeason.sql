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
GO

CREATE VIEW dbo.AnimeSeasonView
AS
SELECT anime_id, season_number, episodes, episode_duration, rating, year_released, episodes * episode_duration AS total_duration
FROM dbo.AnimeSeason;
GO

CREATE PROCEDURE dbo.InsertAnimeSeason
  @anime_id INT,
  @season_number INT,
  @episodes INT,
  @episode_duration TIME(0),
  @rating DECIMAL(3,1),
  @year_released INT
AS
BEGIN
  INSERT INTO dbo.AnimeSeason (anime_id, season_number, episodes, episode_duration, rating, year_released)
  VALUES (@anime_id, @season_number, @episodes, @episode_duration, @rating, @year_released);
END;
GO

CREATE FUNCTION dbo.GetAverageRating
(
  @anime_id INT
)
RETURNS DECIMAL(3,1)
AS
BEGIN
  DECLARE @average_rating DECIMAL(3,1);
  
  SELECT @average_rating = AVG(rating)
  FROM dbo.AnimeSeason
  WHERE anime_id = @anime_id;
  
  RETURN @average_rating;
END;
GO

INSERT INTO dbo.AnimeSeason (season_number, episodes, episode_duration, rating, year_released)
VALUES 
  (1, 12, '00:24:00', 8.5, 2019),
  (2, 12, '00:24:00', 9.1, 2020),
  (1, 24, '00:23:00', 8.8, 2018),
  (2, 24, '00:23:00', 9.0, 2019),
  (1, 13, '00:25:00', 8.6, 2021);
GO

EXEC dbo.InsertAnimeSeason 1, 10, '00:22:00', 8.0, 2022;
GO

SELECT dbo.GetAverageRating(1);
GO
