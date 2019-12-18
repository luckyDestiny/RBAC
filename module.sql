USE RBAC
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](30) NOT NULL,
	[PageUrl] [nvarchar](200) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[IsShow] [bit] NOT NULL,
	[PID] [int] NOT NULL,
	[ModuleCateID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ('') FOR [ModuleName]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ('') FOR [PageUrl]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [OrderNumber]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [IsShow]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [PID]
GO

ALTER TABLE [dbo].[Module] ADD  DEFAULT ((0)) FOR [ModuleCateID]
GO


