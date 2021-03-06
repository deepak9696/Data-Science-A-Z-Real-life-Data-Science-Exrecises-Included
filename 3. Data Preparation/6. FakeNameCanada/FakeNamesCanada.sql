USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_FakeNamesCanada]    Script Date: 23-06-2020 08:49:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_FakeNamesCanada]
-- =============================================
-- Author:	DEEPAK	
-- Create date: 20200621
-- Description:	RAW -> WRK
-- MOD DATE: 
-- =============================================

AS
BEGIN

    -- =============================================
	-- DROP TABLE
	-- =============================================
	IF OBJECT_ID('WRK_FakeNamesCanada') IS NOT NULL
	DROP TABLE [WRK_FakeNamesCanada]

	-- =============================================
	-- CREATE TABLE
	-- =============================================
	CREATE TABLE [WRK_FakeNamesCanada]
	(
	   [RowNumber] int identity(1,1)
	  ,[Number] varchar(100)
      ,[Gender] varchar(10)
      ,[GivenName] varchar(1000)
      ,[Surname] varchar(1000)
      ,[StreetAddress] varchar(1000)
      ,[City] varchar(1000)
      ,[ZipCode] varchar(7)
      ,[CountryFull] varchar(100)
      ,[Birthday] date
      ,[Balance] float
      ,[InterestRate] float
	  
	  )

	-- =============================================
	-- TRUNCATE TABLE
	-- =============================================
	TRUNCATE TABLE [WRK_FakeNamesCanada]

	-- =============================================
	-- INSERT INTO
	-- =============================================
	insert into [WRK_FakeNamesCanada]
	(
	   [Number]
      ,[Gender]
      ,[GivenName]
      ,[Surname]
      ,[StreetAddress]
      ,[City]
      ,[ZipCode]
      ,[CountryFull]
      ,[Birthday]
      ,[Balance]
      ,[InterestRate]
 
	)
	SELECT 
	   [Number]
      ,[Gender]
      ,[GivenName]
      ,[Surname]
      ,[StreetAddress]
      ,[City]
      ,[ZipCode]
      ,[CountryFull]
      ,[Birthday]
      ,[Balance]
      ,[InterestRate]
	  from [dbo].[RAW_FakeNamesCanada_20200621]
	  --FILTERS:
	  WHERE ISNUMERIC([Balance]) = 1 --10 ROWS EXCLUDED
	  AND LEN([ZipCode]) <= 7  --2 ROWS EXCLUDED
	  AND ISDATE([Birthday]) = 1 -- 1 ROWS EXCLUDED
	  --(199987 rows affected)
	  -- 199987+10+2+1=200000 VERIFIED

	-- =============================================
	-- ADDITIONAL EXCLUSIONS
	-- =============================================
	DELETE
	FROM [WRK_FakeNamesCanada]
	WHERE [ZIPCODE] NOT LIKE '___ ___'
	--(4 rows affected)

	DELETE
	FROM [WRK_FakeNamesCanada]
	WHERE [Birthday] > '2005-08-13'
	--(1 row affected)
	

END
