-- Normalizes the  column values to be in the range of 1 and 100,and computes its average/mean

CREATE PROCEDURE dbo.AverageRating
AS
BEGIN
  DECLARE @max_rating DECIMAL(3,1);
  DECLARE @min_rating DECIMAL(3,1);

  SELECT @max_rating = MAX(rating)
  FROM dbo.anime_season;

  SELECT @min_rating = MIN(rating)
  FROM dbo.anime_season;

  UPDATE dbo.anime_season
  SET rating = AVG(((rating- @min_rating) / (@max_rating - @min_rating)) * 100);
END;
