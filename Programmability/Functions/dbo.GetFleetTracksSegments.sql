SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[GetFleetTracksSegments]
(
	@transport_id numeric(18,0),
	@route_date DateTime
)
RETURNS 
@resulttable TABLE 
(
	id int	
)
AS
BEGIN
	DECLARE @ptid int,@lid int, @key nvarchar(500)
	        set @ptid=(
SELECT pt.ID
FROM
	processed_tracks pt
WHERE
	pt.Car_ID = @transport_id
	AND pt.DateTrack = @route_date
	AND transport_type = 1)
	set @key = ( SELECT tc.loaded_data
				 FROM
					 track_content tc
				 WHERE
					 tc.processed_track = @ptid)
	declare _resultCursor cursor for select * from split(@key,'#')
					open _resultCursor;		  
					fetch  next from _resultCursor into @lid
					while @@fetch_status = 0
					begin
INSERT
INTO
	@resulttable
VALUES
	(@lid)
						fetch  next from _resultCursor into @lid
					end;
					close _resultCursor;
					deallocate  _resultCursor
	
	RETURN 
END

GO