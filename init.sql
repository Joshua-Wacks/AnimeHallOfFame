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

CREATE TABLE [dbo].[anime_series] (
    [anime_series_id] int IDENTITY(1,1) NOT NULL,
    [anime_series_name] varchar(120),
    [anime_series_description] varchar(8000),
    [anime_series_ongoing] bit,
)
GO

CREATE TABLE [dbo].[anime_season]
(
  [anime_series_id] int NOT NULL,
  [anime_season_number] smallint NOT NULL,
  [anime_season_episodes] smallint NOT NULL,
  [anime_season_episode_duration] time(0) NOT NULL,
  [anime_season_rating] decimal(3,1) NOT NULL,
  [anime_season_start_date] date NOT NULL,
);
GO

CREATE TABLE [dbo].[anime_character] (
    [anime_character_id] int IDENTITY(1,1),
    [anime_character_name] varchar(50) NOT NULL,
    [anime_character_birthyear] smallint NOT NULL
);
GO

CREATE TABLE [dbo].[character_in_season] (
	[character_in_season_id] int IDENTITY(1,1) NOT NULL,
	[anime_character_id] int NOT NULL,
	[anime_series_id] int NOT NULL, 
	[anime_season_number] smallint NOT NULL,
);
GO

CREATE TABLE [dbo].[hof_attributes] (
    [hof_attributes_id] int IDENTITY(1,1) NOT NULL,
    [hof_attributes_impact] tinyint NOT NULL,
    [hof_attributes_purpose_fulfilled] tinyint NOT NULL,
    [hof_attributes_humour] tinyint NOT NULL,
    [hof_attributes_hairstyle] tinyint NOT NULL,
    [hof_attributes_lovelife] tinyint NOT NULL,
    [hof_attributes_networth] int NOT NULL,
    [hof_attributes_hof_average] decimal(5,2) NULL,
    
    CONSTRAINT impact_interval CHECK(hof_attributes_impact>=-100 AND hof_attributes_impact<=100),
    CONSTRAINT purpose_fulfilled_interval CHECK(hof_attributes_purpose_fulfilled>=-100 AND hof_attributes_purpose_fulfilled<=100),
    CONSTRAINT humour_interval CHECK(hof_attributes_humour>=-100 AND hof_attributes_humour<=100),
    CONSTRAINT hairstyle_interval CHECK(hof_attributes_hairstyle>=-100 AND hof_attributes_hairstyle<=100),
    CONSTRAINT lovelife_interval CHECK(hof_attributes_lovelife>=-100 AND hof_attributes_lovelife<=100),
    CONSTRAINT networth_interval CHECK(hof_attributes_networth>=-100 AND hof_attributes_networth<=100),
-- Unsure of constraint for hof_attributes_hof_average
    CONSTRAINT positive_money CHECK(hof_attributes_net_worth>=0)
)
;
GO

ALTER TABLE anime_series
    ADD CONSTRAINT anime_series_id PRIMARY KEY (anime_series_id)
;
GO

ALTER TABLE anime_season
    ADD CONSTRAINT anime_season_id PRIMARY KEY (anime_series_id, anime_season_number)
;
GO

ALTER TABLE anime_character
    ADD CONSTRAINT anime_character_id PRIMARY KEY (anime_character_id)
;
GO

ALTER TABLE character_in_season
    ADD CONSTRAINT anime_character_season_id PRIMARY KEY (cis_id),
    FOREIGN KEY (character_id) REFERENCES anime_character(character_id),
    FOREIGN KEY (anime_series_id, season_number) REFERENCES AnimeSeason(anime_series_id, season_number)
;
GO

ALTER TABLE hof_attributes
    ADD CONSTRAINT hof_attributes_id PRIMARY KEY (hof_attributes_id)
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

