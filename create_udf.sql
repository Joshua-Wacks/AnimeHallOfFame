CREATE FUNCTION dbo.get_hof_rating (
    @cis_id int
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Average DECIMAL(5,2);
    SET @Average = (SELECT (hof_attributes_impact + hof_attributes_purpose_fulfilled + hof_attributes_humour + hof_attributes_hairstyle + hof_attributes_lovelife + hof_attributes_networth) / 7.0
                FROM hof_attributes
				WHERE character_in_season_id = @cis_id)
    RETURN @Average
END;