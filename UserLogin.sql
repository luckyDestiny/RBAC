USE RBAC
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserLogin](
	[UserID] [int] NOT NULL,
	[LoginIP] [varchar](40) NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[LogoutDate] [datetime] NULL,
	[SystemPowerCateID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT ('') FOR [LoginIP]
GO

ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (getdate()) FOR [LoginDate]
GO

ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT ((0)) FOR [SystemPowerCateID]
GO


