SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Дмитрий Гордиенко>
-- Description:	<Процедура вставки записей о редактируемом треке>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEditedData]
	@jsonobject varchar, 
	@processed_track_id int = -1
AS
BEGIN
INSERT INTO edited_roures
           (processed_track_id
           ,jsonobject)
     VALUES
           (@processed_track_id, @jsonobject)
END
GO