SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLoadedDataKey] 
(
	@d DateTime, 
	@id numeric(18,0)
)
RETURNS nvarchar(500)
AS
BEGIN
	DECLARE @ResultVar nvarchar(500), @processedTrack int
	set @processedTrack=(
SELECT t.ID
FROM
	processed_tracks t
WHERE
	t.Car_ID = @id
	AND t.DateTrack = @d)
 set @ResultVar  = (
SELECT t.loaded_data
FROM
	track_content t
WHERE
	t.processed_track = @processedTrack)

	RETURN @ResultVar

END
GO