USE AnimeHallOfFame;
GO

DROP PROCEDURE IF EXISTS anime_series_insert
DROP PROCEDURE IF EXISTS anime_season_insert
DROP PROCEDURE IF EXISTS anime_character_insert
DROP PROCEDURE IF EXISTS character_in_season_insert
DROP PROCEDURE IF EXISTS hof_attributes_insert

GO

CREATE PROCEDURE anime_series_insert (
  @name varchar(120),
  @description varchar(2000),
  @ongoing bit)

AS

BEGIN
  INSERT INTO anime_series (
    anime_series_name,
    anime_series_description,
    anime_series_ongoing)
  VALUES (
    @name,
    @description,
    @ongoing)
END
GO

CREATE PROCEDURE anime_season_insert (
  @anime_series_id int,
  @number smallint,
  @episodes smallint,
  @duration tinyint,
  @rating tinyint,
  @start_year smallint)
AS

BEGIN
  INSERT INTO anime_season (
    anime_series_id,
    anime_season_number,
    anime_season_episodes,
    anime_season_episode_duration_minutes,
    anime_season_rating,
    anime_season_start_year)
  VALUES (
    @anime_series_id,
    @number,
    @episodes,
    @duration,
    @rating,
    @start_year)
END
GO

CREATE PROCEDURE anime_character_insert (
  @name varchar(200),
  @birthyear smallint)
AS

BEGIN
  INSERT INTO anime_character (
    anime_character_name,
    anime_character_birthyear)
  VALUES (
    @name,
    @birthyear)
END
GO

CREATE PROCEDURE character_in_season_insert (
  @anime_character_id int,
  @anime_series_id int, 
  @anime_season_number smallint)
AS

BEGIN
  INSERT INTO character_in_season (
    anime_character_id,
    anime_series_id, 
    anime_season_number)
  VALUES (
    @anime_character_id,
    @anime_series_id, 
    @anime_season_number)
END
GO

CREATE PROCEDURE hof_attributes_insert (
  @id int,
  @impact tinyint,
  @purpose_fulfilled tinyint,
  @humour tinyint,
  @hairstyle tinyint,
  @lovelife tinyint,
  @networth int)
AS

BEGIN
  INSERT INTO hof_attributes(
    character_in_season_id,
    hof_attributes_impact,
    hof_attributes_purpose_fulfilled,
    hof_attributes_humour,
    hof_attributes_hairstyle,
    hof_attributes_lovelife,
    hof_attributes_networth)
  VALUES (
    @id,
    @impact,
    @purpose_fulfilled,
    @humour,
    @hairstyle,
    @lovelife,
    @networth)
END
GO