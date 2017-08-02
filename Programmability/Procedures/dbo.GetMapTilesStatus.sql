SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetMapTilesStatus] 

AS
BEGIN
	SET NOCOUNT ON;
DBCC UPDATEUSAGE (0)
create table #t(name varchar(255), row varchar(255), reserved varchar(255), data varchar(255), inxex_size varchar(255), unused varchar(255))
insert into #t
exec sp_msforeachtable N'exec sp_spaceused ''?''' 
select * from #t order by CONVERT(bigint,REPLACE(data,' KB','')) DESC
drop table #t	
END
GO