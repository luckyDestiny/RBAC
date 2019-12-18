USE RBAC
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserInfoData](
	[UserID] [int] NOT NULL,
	[ApplyReason] [nvarchar](100) NOT NULL,
	[ApplyRemark] [nvarchar](100) NOT NULL,
	[CheckDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserInfoData] ADD  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[UserInfoData] ADD  DEFAULT ('') FOR [ApplyReason]
GO

ALTER TABLE [dbo].[UserInfoData] ADD  DEFAULT ('') FOR [ApplyRemark]
GO

ALTER TABLE [dbo].[UserInfoData] ADD  DEFAULT ('') FOR [CheckDescription]
GO


