SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- =============================================
CREATE PROCEDURE [dbo].[ResetProcessedTrack] 
	@transportId numeric(18,0),
	@transportType int,
	@trackDate DateTime,
	@distance float,
	@smoothInfo nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	declare @pid int
	set @pid =  [dbo].[GetProcessedTrack](@transportId,@trackDate,@transportType,@distance)
	update processed_tracks set Dictance = @distance where id = @pid
	--удалим все существующие записи с этим идентификатором
	delete from edit_info where processed_id = @pid
	--производится запись класса редактирования данных
	insert into edit_info (processed_id,smoothinfo,edittingdate) values (@pid,@smoothInfo,GETDATE())
	commit
END
GO