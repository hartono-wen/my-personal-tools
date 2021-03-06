/****** Object:  StoredProcedure [dbo].[usp_DeleteDataFromAllTable]    Script Date: 11/3/2017 1:59:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteDataFromAllTable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteDataFromAllTable]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteDataFromAllTable]    Script Date: 11/3/2017 1:59:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteDataFromAllTable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DeleteDataFromAllTable] AS' 
END
GO
-- =============================================
-- Author:		Susan Sales Harkins
-- Create date: 2009-02-19
-- Description:	Taken from: http://www.devx.com/dbzone/Article/40967
-- =============================================
ALTER PROCEDURE  [dbo].[usp_DeleteDataFromAllTable]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
	EXEC sp_MSForEachTable 'ALTER TABLE ? DISABLE TRIGGER ALL'
	EXEC sp_MSForEachTable 'DELETE FROM ?'
	EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
	EXEC sp_MSForEachTable 'ALTER TABLE ? ENABLE TRIGGER ALL'
	EXEC sp_MSFOREACHTABLE 'SELECT * FROM ?'

END
GO
