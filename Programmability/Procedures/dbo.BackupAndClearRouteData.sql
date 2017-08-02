SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		d.gordienko@gmail.com
-- Create date: 2.11.2015
-- Description:	Создание дампа БД и очиска сохраненных маршрутов автотранспорта
-- =============================================
CREATE PROCEDURE [dbo].[BackupAndClearRouteData]	 
	
AS
BEGIN  
	 declare @beckupFolder nvarchar(1024),@fileName nvarchar(300), --путь к папке хранения дампов
	 @dayCount int = 21
SET @beckupFolder = N'D:\hermes\database\dump\';
SET @fileName = CONCAT(@beckupFolder, 'hermes_dump_' + CONVERT(VARCHAR, CONVERT(BIGINT, GETDATE())) + '.bak');
BACKUP DATABASE [hermes] TO DISK = @fileName WITH NOFORMAT, NOINIT, NAME = N'hermes-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
--удаление устаревших данных по мршрутам автотраспорта
DECLARE @d DATETIME
SET @d = DATEADD(DAY, -@dayCount, GETDATE());
DELETE FROM ReadLog
WHERE date_event < @d;
DELETE FROM loaded_data
WHERE loaded_data.ID IN (SELECT
			id
		FROM loaded_data
		WHERE DateEvent < @d);
DELETE FROM edit_info
WHERE edit_info.edittingdate < @d;
--DELETE FROM event_visits
--WHERE event_visits.date_event < @d;
END
GO