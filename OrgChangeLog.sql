USE RBAC
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrgChangeLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgencyCode] [varchar](10) NOT NULL,
	[OrgAgencyName] [nvarchar](20) NOT NULL,
	[BusinessState] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[OrgID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrgChangeLog] ADD  DEFAULT ('') FOR [AgencyCode]
GO

ALTER TABLE [dbo].[OrgChangeLog] ADD  DEFAULT ('') FOR [OrgAgencyName]
GO

ALTER TABLE [dbo].[OrgChangeLog] ADD  DEFAULT ((0)) FOR [BusinessState]
GO

ALTER TABLE [dbo].[OrgChangeLog] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO

ALTER TABLE [dbo].[OrgChangeLog] ADD  DEFAULT ((0)) FOR [OrgID]
GO


