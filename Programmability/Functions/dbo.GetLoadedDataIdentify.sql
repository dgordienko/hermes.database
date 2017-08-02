SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLoadedDataIdentify]
(
	@date DateTime,@id numeric(18,0)
)
RETURNS int
AS
BEGIN
	DECLARE @ResultVar int, @res int
			DECLARE @s nvarchar(500), 
		@loadeddata int;
		DECLARE @r nvarchar(500), 
		@processedTrack int
	set @processedTrack=(
SELECT t.ID
FROM
	processed_tracks t
WHERE
	t.Car_ID = @id
	AND t.DateTrack = @date)
 set @res  = (
SELECT t.loaded_data
FROM
	track_content t
WHERE
	t.processed_track = @processedTrack)

SELECT @ResultVar = @res
	RETURN @ResultVar
	
END
GO