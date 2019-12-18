USE RBAC
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_AddUserInfo]
    @LoginName nvarchar(50),
	@LoginPassword nvarchar(100),
	@UserName nvarchar(10),
	@RocID char(10),
	@PhoneNumber nvarchar(15),
    @Email varchar(320),
	@OrgID int,
	@Title nvarchar(20),
	@ApplyReason nvarchar(100),
	@ApplyRemark nvarchar(100),    
	@IsBusiness bit,
	@CheckState int,
	@SystemPowerString int,
	@EnableState int,
	@CreatedUserID int,
	@ApplyDate datetime,
	@RoleIDs varchar(100),
	@FileInfoIDs  nvarchar(50)='',
	@Chk INT OUT
AS
BEGIN
		SET NOCOUNT ON;
	
		DECLARE @i int=0
		SET @Chk =1
		

		DECLARE @UserID INT
		SET @UserID = 0

		Begin Transaction MyTrans
    

		INSERT INTO [dbo].[User]
			   ([LoginName]
			   ,[LoginPassword]
			   ,[OrgID]
			   ,[UserName]
			   ,[EnableState]
			   ,[RocID]
			   ,[CheckState]
			   ,[LastLoginDate]
			   ,[IsBusiness]
			   ,[ApplyDate]
			   ,[SystemPowerString]
			   ,[CreatedDate]
			   ,[CreatedUserID])
		 VALUES
			   (@LoginName
			   ,@LoginPassword
			   ,@OrgID
			   ,@UserName
			   ,@EnableState
			   ,@RocID
			   ,@CheckState
			   ,null
			   ,@IsBusiness
			   ,@ApplyDate
			   ,@SystemPowerString
			    ,getdate()
			   ,@CreatedUserID)
			
			IF @@Error <> 0 or @@ROWCOUNT=0 
			BEGIN 
				SET @Chk = 0
			END
			ELSE 
			BEGIN

				select @UserID =scope_identity()


				INSERT INTO [dbo].[UserInfoData]
						   ([UserID]
						   ,[ApplyReason]
						   ,[ApplyRemark])
				VALUES
						   (@UserID
						   ,@ApplyReason
						   ,@ApplyRemark)

				IF @@Error <> 0 or @@ROWCOUNT=0 BEGIN SET @Chk = 0  END



				INSERT INTO [dbo].[UserInfo]
					   ([UserID]
					   ,[Sex]
					   ,[Email]
					   ,[PhoneNumber]
					   ,[Title])
				 VALUES
					   (@UserID
					   ,1
					   ,@Email
					   ,@PhoneNumber
					   ,@Title)

				IF @@Error <> 0 or @@ROWCOUNT=0 BEGIN SET @Chk = 0 END


				if(@RoleIDs!='')
				BEGIN
						Declare @tmpSplitTable Table 
					    (
					    	sno int,
							data nvarchar(100)
						)	

						Declare @tmpSplitTableCount int=0

						insert into  @tmpSplitTable  select * from dbo.fn_slip_str(@RoleIDs,',')
						  
						SELECT @tmpSplitTableCount=COUNT(1) from @tmpSplitTable

						

						WHILE (@i < @tmpSplitTableCount)  BEGIN

							Declare @RoleID int =0

							Select @RoleID=data from @tmpSplitTable 
							order by sno OFFSET @i ROWS FETCH NEXT 1 ROWS ONLY

							INSERT INTO [dbo].[U_UserRole]
								   ([UserID]
								   ,[RoleID])
							 VALUES
								   (@UserID
								   ,@RoleID)
							IF @@Error <> 0 or @@ROWCOUNT=0 BEGIN SET @Chk = 0 break END
							SET @i = @i+1
						END
				END


					IF @FileInfoIDs <>'' 
					BEGIN


						  Declare @FileCount int=0
				   
						  select @FileCount=count(1) from fn_slip_str(@FileInfoIDs,',')

						  IF @FileCount >0 
						  BEGIN
							SET @i=0
							Declare @innerFileInfoID int=0

							WHILE (@i < @FileCount) 
							BEGIN
						 
								  select  @innerFileInfoID = data from fn_slip_str(@FileInfoIDs,',')  
								  order by sno OFFSET @i ROWS FETCH NEXT 1 ROWS ONLY

									INSERT INTO [dbo].[U_User_x_FileInfo]
									   ([UserID]
									   ,[FileInfoID])
										VALUES
									   (@UserID,@innerFileInfoID)

									IF @@Error <> 0 or @@ROWCOUNT=0 BEGIN SET @Chk = 0 break END

									SET @i=@i+1
						   
							END
						 END
					END
			END

		IF @Chk = 0 BEGIN 
			Rollback Transaction MyTrans 
		END
		ELSE BEGIN
			Commit Transaction MyTrans
		END
		
		
			

END

