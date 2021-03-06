USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_TransactionalData]    Script Date: 23-06-2020 08:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_TransactionalData]
-- =============================================
-- Author:		Deepak
-- Create date: 20200620
-- Description:	RAW -> WRK
-- MOD DATE: 
-- =============================================

AS
BEGIN

    -- =============================================
	-- DROP TABLE
	-- =============================================
	IF OBJECT_ID('WRK_TransactionalData') IS NOT NULL
	DROP TABLE [WRK_TransactionalData]

	-- =============================================
	-- CREATE TABLE
	-- =============================================
	CREATE TABLE [WRK_TransactionalData]
	(
	   [RowNumber] int identity(1,1)
	  ,[Order ID] varchar(100)
      ,[Order Date] date
      ,[Customer ID] varchar(100)
      ,[Region] varchar(1)
      ,[Rep] varchar(100)
      ,[Item] Varchar(1000)
      ,[Units] int
      ,[Unit Price] float
	  
	  )

	-- =============================================
	-- TRUNCATE TABLE
	-- =============================================
	TRUNCATE TABLE [WRK_TransactionalData]

	-- =============================================
	-- INSERT INTO
	-- =============================================
	insert into [WRK_TransactionalData]
	(
	   [Order ID]
      ,[Order Date]
      ,[Customer ID]
      ,[Region]
      ,[Rep]
      ,[Item]
      ,[Units]
      ,[Unit Price]
	)
	SELECT 
	  [Order ID]
      ,CONVERT(DATE,[Order Date],20)
      ,[Customer ID]
      ,[Region]
      ,[Rep]
      ,[Item]
      ,CAST([Units] AS INT)
      ,CAST([Unit Price] AS FLOAT)
	  from [P12-TransactionalData]
	  --(43 rows affected)

END
