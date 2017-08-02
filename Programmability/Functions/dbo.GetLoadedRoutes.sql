SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLoadedRoutes] 
  (
	  @trackDate datetime,
    @fleettype int
  )
RETURNS TABLE  AS RETURN(
SELECT
  rl.fleet_id,
  CONVERT(varchar, rl.date_event, 104)
  AS trackdate,
  rl.lodaded_data
FROM ReadLog rl
WHERE CONVERT(varchar, rl.date_event, 104) = CONVERT(varchar, @trackDate, 104)--'02.06.2014'
AND rl.fleet_type = @fleettype
)
GO