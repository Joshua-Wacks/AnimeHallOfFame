CREATE DATABASE AnimeHallOfFame;

DECLARE @PiWithNoDecimal DECIMAL(6,0) = 3.14159
DECLARE @Piupto5Decimal DECIMAL(6,5) = 3.141
DECLARE @Piupto1Decimal DECIMAL(3,1) = 3.14159
SELECT @PiWithNoDecimal AS PiWithNoDecimal, @Piupto5Decimal AS Piupto5Decimal, @Piupto1Decimal AS Piupto1Decimal