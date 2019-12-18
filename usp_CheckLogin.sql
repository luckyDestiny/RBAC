USE [RBAC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_CheckLogin]
	@LoginName NVARCHAR(50),
	@LoginPassword NVARCHAR(100), 
	@FunctionIndex INT=0,
	@UserCount INT OUT
AS
BEGIN
	 SET NOCOUNT ON;
	 SELECT @UserCount = COUNT(1) FROM [dbo].[User] WITH (NOLOCK)
	 WHERE LoginName=@LoginName and LoginPassword=@LoginPassword 
	 and ( SUBSTRING(dbo.ConvertToBase(SystemPowerString, 2),@FunctionIndex,1)='1' )
	 and EnableState=1
    
END

