SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[GetTransportType]
(
	
	@transport_id float
)
RETURNS int
AS
BEGIN
	
	DECLARE @result int
	set @result  = (select top(1) t.transport_type from processed_tracks t WHERE t.car_id = @transport_id)
	
	
	RETURN @result

END
GO