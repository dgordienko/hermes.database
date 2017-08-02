SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetLastEvent]
(	
	@transportid numeric(18,0),
	@transporttype int
)
RETURNS DateTime
AS
BEGIN
	
	DECLARE @Result DateTime;
	SELECT  @Result = (select max(DateEvent) from loaded_data where Car_ID = @transportid)
	RETURN @Result
END
GO