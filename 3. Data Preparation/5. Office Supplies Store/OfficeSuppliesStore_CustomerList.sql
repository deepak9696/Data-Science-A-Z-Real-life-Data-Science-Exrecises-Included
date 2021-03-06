USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_CustomerList]    Script Date: 23-06-2020 08:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_CustomerList]
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
	IF OBJECT_ID('WRK_CustomerList') IS NOT NULL
	DROP TABLE [WRK_CustomerList]

	-- =============================================
	-- CREATE TABLE
	-- =============================================
	CREATE TABLE [WRK_CustomerList]
	(
	   [RowNumber] int identity(1,1)
	  ,[Customer ID] varchar(100)
      ,[City] varchar(1000)
      ,[ZipCode] varchar(5)
      ,[Gender] varchar(1)
      ,[Age] float
	  )

	-- =============================================
	-- TRUNCATE TABLE
	-- =============================================
	TRUNCATE TABLE [WRK_CustomerList]

	-- =============================================
	-- INSERT INTO
	-- =============================================
	insert into [WRK_CustomerList]
	(
	   [Customer ID]
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
	)
	SELECT 
	   RIGHT('0000000'+[Customer ID],7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
	  from [P12-CustomerList]
	  --(43 rows affected)

END
