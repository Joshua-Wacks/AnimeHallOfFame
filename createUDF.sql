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
