SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLoadedDataFromDate] (@beginDate datetime, -- начальная дата  	  
@delimeter nvarchar(1)--разделитель
)
RETURNS @table TABLE (
  id int NOT NULL
)
AS
BEGIN
  DECLARE @loadeddatakey nvarchar(500);
  DECLARE _loadedDataKeys CURSOR FOR (SELECT DISTINCT
    loaded_data
  FROM track_content
  WHERE processed_track IN (SELECT
    t.id
  FROM processed_tracks t
  WHERE t.DateTrack <= @beginDate))
  OPEN _loadedDataKeys
  FETCH NEXT FROM _loadedDataKeys INTO @loadeddatakey;
  WHILE @@fetch_status = 0
  BEGIN
    DECLARE @pos int = CHARINDEX(@delimeter, @loadeddatakey)
    DECLARE @id nvarchar(10);
    WHILE (@pos != 0)
    BEGIN
      SET @id = SUBSTRING(@loadeddatakey, 1, @pos - 1);
      INSERT INTO @table (id)
        VALUES (CAST(@id AS int))
      SET @loadeddatakey = SUBSTRING(@loadeddatakey, @pos + 1, LEN(@loadeddatakey))
      SET @pos = CHARINDEX(@delimeter, @loadeddatakey)
    END
    FETCH NEXT FROM _loadedDataKeys INTO @loadeddatakey;
  END
  CLOSE _loadedDataKeys;
  DEALLOCATE _loadedDataKeys;
  RETURN
END
GO