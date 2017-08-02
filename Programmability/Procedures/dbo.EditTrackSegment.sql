SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[EditTrackSegment]
@transportId numeric(18,0),
@transportType int,
@trackDate DateTime,
@editInfo nvarchar(max),
@smoothInfo nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	declare @pid int
	set @pid =  [dbo].[GetProcessedTrack](@transportId,@trackDate,@transportType,0)
	insert into edit_info (processed_id,editinfo,smoothinfo,edittingdate) values (@pid,@editInfo,@smoothInfo,GETDATE())
END
GO