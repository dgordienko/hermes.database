SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLoadedData] (@date datetime, @car_id numeric(18, 0))
RETURNS @result TABLE (
  value int
)
AS
BEGIN

  DECLARE @s nvarchar(500),
          @loadeddata int;
  DECLARE @ResultVar nvarchar(500),
          @processedTrack int
  SET @processedTrack = (SELECT
    t.id
  FROM processed_tracks t
  WHERE t.Car_ID = @car_id
  AND t.DateTrack = @date)
  SET @ResultVar = (SELECT
    t.loaded_data
  FROM track_content t
  WHERE t.processed_track = @processedTrack)

  DECLARE _loadeddata CURSOR FOR (SELECT
    CAST(value AS int) AS loaded_data_id
  FROM split(@ResultVar, '#'))
  OPEN _loadeddata
  FETCH NEXT FROM _loadeddata INTO @loadeddata;
  WHILE @@fetch_status = 0
  BEGIN
    INSERT INTO @result
      VALUES (@loadeddata)
    FETCH NEXT FROM _loadeddata INTO @loadeddata;
  END
  CLOSE _loadeddata;
  DEALLOCATE _loadeddata;
  RETURN
END
GO