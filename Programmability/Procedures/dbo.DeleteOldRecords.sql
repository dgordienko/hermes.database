SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteOldRecords]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @d datetime
	set @d = DATEADD(week,-3,GETDATE());
	delete from ReadLog where date_event < @d;
	delete  from loaded_data where loaded_data.ID in (select id from loaded_data where  DateEvent < @d);
	delete from edit_info where edit_info.edittingdate  <@d;
	--delete from event_visits where event_visits.date_event < @d;
END
GO