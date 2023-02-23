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
    [anime_series_description] varchar(2000),
    [anime_series_ongoing] bit,
    [anime_series_rating] decimal(5,2) DEFAULT 0
);
GO

CREATE TABLE [dbo].[anime_season]
(
    [anime_series_id] int NOT NULL,
    [anime_season_number] smallint NOT NULL,
    [anime_season_episodes] smallint NOT NULL,
    [anime_season_episode_duration(minutes)] tinyint NOT NULL,
    [anime_season_rating] tinyint NOT NULL,
    [anime_season_start_year] smallint NOT NULL
);
GO

CREATE TABLE [dbo].[anime_character] (
    [anime_character_id] int IDENTITY(1,1),
    [anime_character_name] varchar(200) NOT NULL,
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
    [character_in_season_id] int NOT NULL,
    
    CONSTRAINT impact_interval CHECK(hof_attributes_impact>=0 AND hof_attributes_impact<=100),
    CONSTRAINT purpose_fulfilled_interval CHECK(hof_attributes_purpose_fulfilled>=0 AND hof_attributes_purpose_fulfilled<=100),
    CONSTRAINT humour_interval CHECK(hof_attributes_humour>=0 AND hof_attributes_humour<=100),
    CONSTRAINT hairstyle_interval CHECK(hof_attributes_hairstyle>=0 AND hof_attributes_hairstyle<=100),
    CONSTRAINT lovelife_interval CHECK(hof_attributes_lovelife>=0 AND hof_attributes_lovelife<=100)
);
GO

ALTER TABLE anime_series
    ADD CONSTRAINT anime_series_id PRIMARY KEY (anime_series_id);
GO

ALTER TABLE anime_season
    ADD CONSTRAINT anime_season_id PRIMARY KEY (anime_series_id, anime_season_number);
GO

ALTER TABLE anime_character
    ADD CONSTRAINT anime_character_id PRIMARY KEY (anime_character_id);
GO

ALTER TABLE character_in_season
    ADD CONSTRAINT anime_character_season_id PRIMARY KEY (character_in_season_id),
    FOREIGN KEY (anime_character_id) REFERENCES anime_character(anime_character_id),
    FOREIGN KEY (anime_series_id, anime_season_number) REFERENCES anime_season(anime_series_id, anime_season_number);
GO

ALTER TABLE hof_attributes
    ADD CONSTRAINT hof_attributes_id PRIMARY KEY (hof_attributes_id),
    FOREIGN KEY (character_in_season_id) REFERENCES character_in_season(character_in_season_id)
GO
