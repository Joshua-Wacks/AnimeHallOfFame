USE master;
GO

DROP DATABASE IF EXISTS AnimeHallOfFame;
GO

CREATE DATABASE AnimeHallOfFame;
GO

USE AnimeHallOfFame;
GO

SET NOCOUNT ON;
GO

CREATE TABLE anime_series (
    anime_series_id int IDENTITY(1,1) NOT NULL,
    anime_series_name varchar(120),
    anime_series_description varchar(8000),
    anime_series_start_date date,
    ongoing bit,
    rating tinyint
)
GO

CREATE TABLE [dbo].[AnimeSeason]
(
  [anime_series_id] INT NOT NULL,
  [season_number] INT NOT NULL,
  [Episodes] INT NOT NULL,
  [EpisodeDuration] TIME(0) NOT NULL,
  [Rating] DECIMAL(3,1) NOT NULL,
  [YearReleased] INT NOT NULL,
);
GO

CREATE TABLE anime_character (
    character_id int IDENTITY(1,1),
    character_name varchar(50) NOT NULL,
    character_birthyear smallint NOT NULL,
    fk_to_bridge_entity int NOT NULL
);
GO

CREATE TABLE dbo.CharacterInSeason (
	cis_id int IDENTITY(1,1)  NOT NULL,
	character_id int NOT NULL,
	anime_series_id int NOT NULL, 
	season_number int NOT NULL,
);
GO

CREATE TABLE HOFAttributes (
    cis_id INT NOT NULL,
    impact INT NOT NULL,
    purposeFulfilled INT NOT NULL,
    humourValue INT NOT NULL,
    hairStyle INT NOT NULL,
    loveLife INT NOT NULL,
    monetaryValue DECIMAL(16,2) NOT NULL,
    HOFValue DECIMAL(5,2) NULL,

    
    
    CONSTRAINT impactInterval CHECK(impact>=-100 AND impact<=100),
    CONSTRAINT purposeFulfilledInterval CHECK(purposeFulfilled>=-100 AND purposeFulfilled<=100),
    CONSTRAINT humourValuetInterval CHECK(humourValue>=-100 AND humourValue<=100),
    CONSTRAINT hairStyleInterval CHECK(hairStyle>=-100 AND hairStyle<=100),
    CONSTRAINT loveLifeInterval CHECK(loveLife>=-100 AND loveLife<=100),
    CONSTRAINT monetaryValueInterval CHECK(monetaryValue>=-100 AND monetaryValue<=100),
-- Unsure of constraint for HOFValue
    CONSTRAINT positive_money CHECK(monetaryValue>=0)
)
;
GO

ALTER TABLE anime_series
    ADD CONSTRAINT anime_series_id PRIMARY KEY (anime_series_id)
;
GO

ALTER TABLE AnimeSeason
    ADD CONSTRAINT anime_season_id PRIMARY KEY (anime_series_id, season_number)
;
GO

ALTER TABLE anime_character
    ADD CONSTRAINT anime_character_id PRIMARY KEY (character_id)
;
GO

ALTER TABLE CharacterInSeason
    ADD CONSTRAINT anime_character_season_id PRIMARY KEY (cis_id),
    FOREIGN KEY (character_id) REFERENCES anime_character(character_id),
    FOREIGN KEY (anime_series_id, season_number) REFERENCES AnimeSeason(anime_series_id, season_number)
;
GO

ALTER TABLE HOFAttributes
    ADD CONSTRAINT HOFAttributes_id PRIMARY KEY (cis_id)
;
GO

-- ALTER TABLE dbo.CharacterInSeason
-- 	ADD CONSTRAINT [FK_Character_CIS] FOREIGN KEY (character_id) 
-- 			REFERENCES dbo.AnimeCharacter (character_id),
-- 		CONSTRAINT [FK_Anime_CIS] FOREIGN KEY (anime_id, season_number)
-- 			REFERENCES dbo.AnimeSeason (anime_id, season_number)
-- ;
-- GO

--  CONSTRAINT [PK_AnimeSeason] PRIMARY KEY ([AnimeId], [SeasonNumber])
-- Add PK to CharacterInSeries
-- Add checks to all tables

