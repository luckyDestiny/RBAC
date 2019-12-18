USE RBAC
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
	[RoleCateID] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreatedUserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[RoleDescription] [nvarchar](30) NULL,
	[RoleLevel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ('') FOR [RoleName]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [RoleCateID]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [OrderNumber]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [IsEnabled]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [CreatedUserID]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ('') FOR [RoleDescription]
GO

ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [RoleLevel]
GO


