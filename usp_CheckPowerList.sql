USE [RBAC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CheckPowerList]
	@UserID INT=0,
	@PageUrls NVARCHAR(500)='',
	@FunctionIndexs VARCHAR(100)='',
	@ModuleCateID INT=0
AS
BEGIN
	SET NOCOUNT ON

		Declare @HasPowerTable Table
		(
			HasPower bit
		)	

		Declare @IDStringTable1 Table 
		(
			sno int,
			data nvarchar(100)
		)	
		
		Declare @IDStringTableCount1 int =0
		insert into  @IDStringTable1  select * from fn_slip_str(@PageUrls,',')

		SELECT @IDStringTableCount1=COUNT(1) from @IDStringTable1

		Declare @IDStringTable2 Table 
		(
			sno int,
			data nvarchar(100)
		)	
		
		Declare @IDStringTableCount2 int =0
		insert into  @IDStringTable2  select * from fn_slip_str(@FunctionIndexs,',')

		SELECT @IDStringTableCount2=COUNT(1) from @IDStringTable2

		DECLARE @i int=0
		DECLARE @PageUrl nvarchar(100) 
		DECLARE @FunctionIndex int

		SET @i = 0
		While(@i< @IDStringTableCount1)
		BEGIN
				DECLARE	@return_value int,
						@HasPower bit

				select  @PageUrl = data  from @IDStringTable1 where sno=@i+1
				select  @FunctionIndex = convert(int,data)  from @IDStringTable2 where sno=@i+1

				EXEC	@return_value = [dbo].[usp_CheckPower]
						@UserID = @UserID,
						@PageUrl = @PageUrl,
						@FunctionIndex = @FunctionIndex,
						@ModuleCateID = @ModuleCateID,
						@HasPower = @HasPower OUTPUT
				
				insert into @HasPowerTable
				values(@HasPower)

				SET @i = @i+1
		END

		Select * from  @HasPowerTable
END



