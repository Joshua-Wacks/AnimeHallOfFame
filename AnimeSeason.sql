
CREATE TABLE [dbo].[AnimeSeason]
(
  [AnimeId] INT NOT NULL,
  [SeasonNumber] INT NOT NULL,
  [Episodes] INT NOT NULL,
  [EpisodeDuration] TIME(0) NOT NULL,
  [Rating] DECIMAL(3,1) NOT NULL,
  [YearReleased] INT NOT NULL,
  CONSTRAINT [PK_AnimeSeason] PRIMARY KEY ([AnimeId], [SeasonNumber])
);

CREATE VIEW [dbo].[AnimeSeasonView]
AS
SELECT [AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased], [Episodes] * [EpisodeDuration] AS TotalDuration
FROM [dbo].[AnimeSeason];

CREATE PROCEDURE [dbo].[InsertAnimeSeason]
  @animeId INT,
  @seasonNumber INT,
  @episodes INT,
  @episodeDuration TIME(0),
  @rating DECIMAL(3,1),
  @yearReleased INT
AS
BEGIN
  INSERT INTO [dbo].[AnimeSeason] ([AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased])
  VALUES (@animeId, @seasonNumber, @episodes, @episodeDuration, @rating, @yearReleased);
END;

CREATE FUNCTION [dbo].[GetAverageRating]
(
  @animeId INT
)
RETURNS DECIMAL(3,1)
AS
BEGIN
  DECLARE @averageRating DECIMAL(3,1);
  
  SELECT @averageRating = AVG([Rating])
  FROM [dbo].[AnimeSeason]
  WHERE [AnimeId] = @animeId;
  
  RETURN @averageRating;
END;

-- Insert some sample data into the AnimeSeason table
INSERT INTO [dbo].[AnimeSeason] ([AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased])
VALUES (1, 1, 12, '00:24:00', 8.5, 2019);

INSERT INTO [dbo].[AnimeSeason] ([AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased])
VALUES (1, 2, 12, '00:24:00', 9.1, 2020);

INSERT INTO [dbo].[AnimeSeason] ([AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased])
VALUES (2, 1, 24, '00:23:00', 8.8, 2018);

INSERT INTO [dbo].[AnimeSeason] ([AnimeId], [SeasonNumber], [Episodes], [EpisodeDuration], [Rating], [YearReleased])
VALUES (2, 2, 24, '00:23:00', 9.0, 2019);

-- Call the stored procedure to insert a new row into the AnimeSeason table
EXEC [dbo].[InsertAnimeSeason] 3, 1, 13, '00:25:00', 8.6, 2021;

-- Call the user-defined function to get the average rating for an anime
SELECT [dbo].[GetAverageRating](1);
