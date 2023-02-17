USE AnimeHallOfFame;
GO

DROP TABLE IF EXISTS HOFAttributes;
GO

CREATE TABLE HOFAttributes (
    cis_id INT,
    impact INT NOT NULL,
    purposeFulfilled INT NOT NULL,
    humourValue INT NOT NULL,
    hairStyle INT NOT NULL,
    loveLife INT NOT NULL,
    monetaryValue DECIMAL(16,2) NOT NULL,
    HOFValue DECIMAL(5,2) NULL,

    CONSTRAINT HOFAttributes_PK PRIMARY KEY CLUSTERED  (cis_id),
    
    CONSTRAINT impactInterval CHECK(impact>=-100 AND impact<=100),
    CONSTRAINT purposeFulfilledInterval CHECK(purposeFulfilled>=-100 AND purposeFulfilled<=100),
    CONSTRAINT humourValuetInterval CHECK(humourValue>=-100 AND humourValue<=100),
    CONSTRAINT hairStyleInterval CHECK(hairStyle>=-100 AND hairStyle<=100),
    CONSTRAINT loveLifeInterval CHECK(loveLife>=-100 AND loveLife<=100),
    CONSTRAINT monetaryValueInterval CHECK(monetaryValue>=-100 AND monetaryValue<=100),
-- Unsure of constraint for HOFValue
    CONSTRAINT positive_money CHECK(monetaryValue>=0)
)