-- Stored Procedures--
EXEC anime_series_insert @name='One Punch Man', @description='One PUUUUUUUUUUNCH!', @ongoing=1
EXEC anime_season_insert @anime_series_id=6, @number=1, @episodes=24, @duration=24, @rating=10, @start_year=2015

EXEC anime_character_insert @name='Saitama', @birthyear=1990
EXEC character_in_season_insert @anime_character_id=29, @anime_series_id=6, @anime_season_number=1
EXEC hof_attributes_insert @id=48, @impact=100, @purpose_fulfilled=100, @humour=0, @hairstyle=0, @lovelife=0, @networth=2

EXEC anime_character_insert @name='Mumen Rider', @birthyear=1990
EXEC character_in_season_insert @anime_character_id=30, @anime_series_id=6, @anime_season_number=1
EXEC hof_attributes_insert @id=49, @impact=100, @purpose_fulfilled=100, @humour=100, @hairstyle=100, @lovelife=50, @networth=20

--View and UDF--
SELECT * FROM RankedHOF
ORDER BY rating DESC