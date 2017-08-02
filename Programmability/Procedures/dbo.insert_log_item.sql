SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		Дмитрий Гордиенко
-- Create date: <Create Date,,>
-- Description: вставка занчений лога чтения приборов
-- =============================================
CREATE PROCEDURE [dbo].[insert_log_item]
           @fleet_type int, -- тип транспортного средства
           @fleet_id numeric(18,0), -- идентификатор траснпорта
           @date_event datetime, -- дата события
           @lodaded_data int  -- идентификатор считанных данных трека
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[ReadLog]
           (
           [fleet_type]
           ,[fleet_id]
           ,[date_event]
           ,[lodaded_data])
     VALUES
           (
			@fleet_type
           ,@fleet_id
           ,@date_event
           ,@lodaded_data)
END
GO