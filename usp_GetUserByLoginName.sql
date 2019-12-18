USE [RBAC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetUserByLoginName]
	@LoginName NVARCHAR(50)
AS
BEGIN
	 SET NOCOUNT ON;
	
	 SELECT a.[ID]
      ,[LoginName]
      ,b.ID as 'OrgID'
      ,[UserName]
	  ,OrgAgencyName as 'OrgName'  FROM [dbo].[User] as a 
	 left join O_Org as b on a.OrgID=b.ID 
     WHERE LoginName=@LoginName 
END

