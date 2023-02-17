USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS anime_character;
GO

CREATE TABLE anime_character (
    character_id int IDENTITY(1,1),
    character_name varchar(50) NOT NULL,
    character_birthyear smallint NOT NULL,
    fk_to_bridge_entity int NOT NULL
);