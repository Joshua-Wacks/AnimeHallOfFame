CREATE TABLE dbo.CharacterInSeries (
	cis_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	character_id int NOT NULL,
	anime_id int NOT NULL,
	season_number int NOT NULL,
);
GO

ALTER TABLE dbo.CharacterInSeries
	ADD CONSTRAINT [FK_Character_CIS] FOREIGN KEY (character_id) 
			REFERENCES dbo.AnimeCharacter (character_id),
		CONSTRAINT [FK_Anime_CIS] FOREIGN KEY (anime_id, season_number)
			REFERENCES dbo.AnimeSeason (anime_id, season_number)
;
GO