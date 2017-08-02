SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		Дмитрий Гордиенко
-- Description:	Проверка существаований считанных данных данных
--- используется при приняии решения очиски  приборов после процедуру считывания данных
--- Результаты могут быть 0 и 1 
-- =============================================

CREATE FUNCTION [dbo].[IsReadCompleat]
(
           @fleet_type int, -- тип транспортного средства
           @fleet_id numeric(18,0), -- идентификатор траснпорта
           @date_event datetime -- дата события
)

RETURNS int
AS
BEGIN
	DECLARE @result int
	set @result = (SELECT count(*) from  ReadLog t 
				where t.date_event = @date_event 
				and t.fleet_type = @fleet_type 
				and t.fleet_id = @fleet_id)
	RETURN @result
END
GO