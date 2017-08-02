SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BackupDatabase]	 
AS
BEGIN
SET NOCOUNT ON;
DECLARE @filename VARCHAR(255),
@backup_name VARCHAR(255);
SET @filename = CONCAT(N'D:\hermes\database\dump\', CONVERT(VARCHAR(10), GETDATE(), 112), '.bak');
SET @backup_name = CONCAT(N'hermes полная копия бд от ', CONVERT(VARCHAR(10), GETDATE(), 104));
PRINT @backup_name;
BACKUP DATABASE [hermes] TO DISK = @filename
WITH NOFORMAT, NOINIT, NAME = @backup_name,
SKIP, NOREWIND, NOUNLOAD, STATS = 10;
DELETE FROM ReadLog;
DELETE FROM loaded_data
WHERE id IN (SELECT
			id
		FROM loaded_data
		WHERE DateLast <= DATEADD(DAY, -14, GETDATE()));
DELETE from event_visits where date_event < DATEADD(DAY,-14,GETDATE()); 

DBCC SHRINKDATABASE (N'hermes');
END
GO