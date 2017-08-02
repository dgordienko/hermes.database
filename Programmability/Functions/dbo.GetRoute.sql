SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetRoute] (@trackDate datetime,
@transportid numeric,
@fleettype int)
RETURNS TABLE
AS
  RETURN (
  SELECT
    rl.fleet_id,
    CONVERT(varchar, rl.date_event, 104)
    AS trackdate,
    rl.lodaded_data
  FROM ReadLog rl
  WHERE rl.fleet_type = @fleettype
  AND rl.fleet_id = @transportid
  AND CONVERT(varchar, rl.date_event, 104) = CONVERT(varchar, @trackDate, 104)
  )
GO