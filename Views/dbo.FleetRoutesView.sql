SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[FleetRoutesView]
AS
  
  WITH resultView as (
  SELECT
    processed.ID,
    processed.Car_ID,
    processed.transport_type,
    CONVERT(DATE, (processed.DateTrack), 12) AS trackDate,
    processed.Dictance,
    tcontent.loaded_data,
    (SELECT dbo.GetLastEvent(Car_ID, 1))     AS lastDate
  FROM dbo.track_content tcontent
    INNER JOIN processed_tracks processed
      ON tcontent.processed_track = processed.ID
  WHERE
     processed.transport_type = 1
     AND CONVERT(DATE, (processed.DateTrack)) BETWEEN convert(DATE, DATEADD(YEAR ,-1,getdate())) and convert(DATE, GetDate()))
  -- and YEAR(CONVERT(DATE, (processed.DateTrack), 12)) <= year(getdate())

  SELECT * from resultView
GO