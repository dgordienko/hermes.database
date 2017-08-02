SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetTransportCollection]
(	
	
	
	
)
RETURNS TABLE 
AS
RETURN 
(
	
	SELECT distinct p.Car_ID FROM processed_tracks p 
)
GO