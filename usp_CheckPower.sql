USE [RBAC]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_CheckPower]
	@UserID INT=0,
	@PageUrl NVARCHAR(200)='',
	@FunctionIndex INT=0,
	@ModuleCateID INT=0,
	@HasPower BIT=0  OUT
AS
BEGIN
	SET NOCOUNT ON

	SET @HasPower = 0


	IF(@UserID = 1)
		BEGIN
			SET @HasPower = 1
			return
		END
    ELSE
	BEGIN
	    
		DECLARE @rmcount INT
		SELECT @rmcount=count(1) FROM dbo.UserRole ur,dbo.RoleModule rm,dbo.Module m  WITH (NOLOCK)
		WHERE ur.UserID=@userid 
			and ur.RoleID=rm.RoleID 
			and m.id=rm.ModuleID and m.ModuleCateID = @ModuleCateID
			and CHARINDEX(m.PageUrl,@PageUrl)>0 
			and (SUBSTRING(Reverse(dbo.ConvertToBase(rm.PowerString, 2)),@FunctionIndex,1)='1' ) 
		IF (@rmcount>0)
		BEGIN
			SET @HasPower = 1
			RETURN 
		END
	END
END



