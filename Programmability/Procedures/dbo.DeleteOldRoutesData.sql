SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		Dmitry Gordienko
-- Create date: 9/09/2012
-- Description:	Удаление сохраненных треков старше одного текущей даты
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOldRoutesData]
	 --Дата старше которой все будет удалено
	@dateFrom  DateTime
AS
BEGIN
	SET NOCOUNT ON;
	delete from loaded_data where DateEvent > @dateFrom
END
GO