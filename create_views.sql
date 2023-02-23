USE AnimeHallOfFame;
GO

DROP VIEW IF EXISTS RankedHOF;
GO

CREATE VIEW RankedHOF
AS
    SELECT c.anime_character_name AS character, ser.anime_series_name AS anime, seas.anime_season_number AS season, dbo.get_hof_rating(b.character_in_season_id) AS rating
	FROM anime_character AS c
    JOIN [character_in_season] AS b
    ON c.anime_character_id = b.anime_character_id
    JOIN [anime_season] AS seas
    ON b.anime_series_id = seas.anime_series_id
	AND b.anime_season_number = seas.anime_season_number
    JOIN [anime_series] AS ser
    ON seas.anime_series_id = ser.anime_series_id
	JOIN [hof_attributes] AS hof
	ON b.character_in_season_id = hof.character_in_season_id