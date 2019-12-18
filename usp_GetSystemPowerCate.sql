USE [RBAC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetSystemPowerCate]

AS
BEGIN
	 SET NOCOUNT ON;

	 SELECT [SystemPowerCateName],[SystemPowerCateIndex]
     FROM [NIIS_User].[dbo].[SystemPowerCate]

    
END

