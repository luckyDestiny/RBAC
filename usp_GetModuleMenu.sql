USE [RBAC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetModuleMenu]
(
	@UserID INT,
	@ModuleCateID INT
)
As 
BEGIN
	SET NOCOUNT ON
    DECLARE @RoleID INT
	SET @RoleID = 0

 

	IF(@UserID=1)
		SELECT ID,ModuleName,PageUrl,PID FROM dbo.Module WITH (NOLOCK)
		WHERE IsShow=1 and ModuleCateID=@ModuleCateID ORDER BY  PID,OrderNumber,ID
	ELSE
		SELECT * FROM dbo.Module WITH (NOLOCK)
		WHERE IsShow=1 and ModuleCateID=@ModuleCateID and (
		
			ID in (
					SELECT ModuleID FROM dbo.RoleModule WITH (NOLOCK) WHERE 
					(
						RoleID IN (SELECT RoleID FROM dbo.UserRole WHERE UserID=@UserID) 
					
					)
		
					and Right(dbo.ConvertToBase(PowerString, 2),1)='1' 
				  )
		)ORDER BY  PID,OrderNumber,ID
END

