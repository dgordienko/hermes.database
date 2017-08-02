﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [tSQLt].[Private_GetCursorForRunAll]
  @TestClassCursor CURSOR VARYING OUTPUT
AS
BEGIN
  SET @TestClassCursor = CURSOR LOCAL FAST_FORWARD FOR
   SELECT Name
     FROM tSQLt.TestClasses;

  OPEN @TestClassCursor;
END;
GO