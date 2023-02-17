USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS AnimeSeries;
GO


CREATE TABLE AnimeSeries (
    series_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name varchar(120),
    description varchar(8000),
    start_date date,
    ongoing bit,
    rating tinyint
)