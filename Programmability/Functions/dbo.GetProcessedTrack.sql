SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetProcessedTrack]
(
	-- Add the parameters for the function here
	@transportId numeric(18,0), -- Идентификатор транспортного средства
	@trackDate DateTime, -- дата трека
	@transportType int, --тип транспортного средства
	@distance float --пройденная дистанция

)
RETURNS int --идентификатор записи в таблице processed_tracks
AS
BEGIN
	DECLARE @result int;
	declare	@pid int;	
	set @pid = (
	     select id from processed_tracks t 
	     where t.Car_ID = @transportId and t.transport_type = @transportType and t.DateTrack = @trackDate)
		 set @result = @pid
	RETURN @result

END
GO