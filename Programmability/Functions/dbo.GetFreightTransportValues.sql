SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetFreightTransportValues]( @dateBegin DateTime,@dateEnd DateTime)
RETURNS  TABLE AS
RETURN
(
SELECT DISTINCT p.Car_ID AS cid
FROM
	processed_tracks p
WHERE
	p.DateTrack BETWEEN @dateBegin AND @dateEnd
)
GO