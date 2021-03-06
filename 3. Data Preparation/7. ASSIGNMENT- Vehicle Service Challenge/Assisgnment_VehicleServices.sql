USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_VehicleService]    Script Date: 23-06-2020 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_VehicleService]
-- =============================================
-- Author:	Deepak	
-- Create date: 20200622
-- Description:	RAW -> WRK
-- MOD DATE: 
-- =============================================

AS
BEGIN

    -- =============================================
	-- DROP TABLE
	-- =============================================
	IF OBJECT_ID('WRK_VehicleService') IS NOT NULL
	DROP TABLE [WRK_VehicleService]

	-- =============================================
	-- CREATE TABLE
	-- =============================================
	CREATE TABLE [WRK_VehicleService]
	(
	   [RowNumber] int identity(1,1)
	  ,[CustomerID] varchar(100)
      ,[CustomerSince] date
      ,[Vehicle] varchar(1000)
      ,[2014] float
      ,[2015] float
      ,[2016E] float

	  )

	-- =============================================
	-- TRUNCATE TABLE
	-- =============================================
	TRUNCATE TABLE [WRK_VehicleService]

	-- =============================================
	-- INSERT INTO
	-- =============================================
	insert into [WRK_VehicleService]
	(
	   [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
 
	)
	SELECT 
	  [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
	  from [RAW_20200622_VehicleService]
	  --EXCLUSIONS
	  where ISNUMERIC([2015]) = 1
	  or [2015] = ''
	  --(1048573 rows affected)

	  /*
	  EXCLUDED ROWS
	  select *
	  FROM [DSTRAINING].[dbo].[RAW_20200622_VehicleService]
      where ISNUMERIC([2015]) = 0
	  and [2015] <> ''
	  */

	  /*
	  --ADDITIONAL CHECKS
	  SELECT [CustomerID],COUNT(*)
	  FROM [WRK_VehicleService]
	  GROUP BY [CustomerID]
	  HAVING COUNT(*)>1

	  SELECT *
	  FROM [WRK_VehicleService]
	  WHERE [CustomerID] LIKE '3490750'

	  SELECT *
	  FROM [WRK_VehicleService]
	  WHERE [CustomerSince]<'1965-01-01'

	  SELECT MAX([2014])
	  FROM [WRK_VehicleService]

	  SELECT SUM([2016E])
	  FROM [WRK_VehicleService]
	  */

END
