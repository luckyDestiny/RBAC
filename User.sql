USE RBAC
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](30) NOT NULL,
	[LoginPassword] [nvarchar](100) NOT NULL,
	[OrgID] [int] NOT NULL,
	[UserName] [nvarchar](10) NULL,
	[EnableState] [int] NOT NULL,
	[RocID] [char](10) NOT NULL,
	[CheckState] [int] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[IsBusiness] [bit] NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[SystemPowerString] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ('') FOR [LoginName]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ('') FOR [LoginPassword]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [OrgID]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ('') FOR [UserName]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [EnableState]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ('') FOR [RocID]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [CheckState]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsBusiness]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [ApplyDate]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [SystemPowerString]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [CreatedUserID]
GO


