SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetTracksByDay] 
(		
	@trackDate DateTime, @carId numeric(18,0)	
)
RETURNS TABLE 
AS
RETURN 
(	
	select t.Car_ID,t.DateTrack,t.Dictance, t.transport_type from processed_tracks t WHERE DateTrack = @trackDate AND Car_ID = @carId
)
GO