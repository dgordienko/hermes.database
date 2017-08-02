SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		Dmitry Gordienko
-- Description:	Обновление данных при редактированиии трека
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProcessedTrack]
@transportId numeric(18,0),
@transportType int,
@trackDate DateTime,
@distance float,
@editInfo nvarchar(max),
@smoothInfo nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	declare @pid int
	set @pid =  [dbo].[GetProcessedTrack](@transportId,@trackDate,@transportType,@distance)
	update processed_tracks set Dictance = @distance where id = @pid
	--delete from edit_info where processed_id = @pid
	--insert into edit_info (processed_id,editinfo,smoothinfo,edittingdate) values (@pid,@editInfo,@smoothInfo,GETDATE())
	commit
END
GO