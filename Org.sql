USE RBAC
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Org](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrgAgencyName] [nvarchar](50) NOT NULL,
	[AgencyState] [int] NOT NULL,
	[AgencyCounty] [int] NOT NULL,
	[AgencyTown] [int] NOT NULL,
	[AgencyVillage] [int] NOT NULL,
	[AgencyAddress] [nvarchar](30) NOT NULL,
	[AgencyPhoneNumber] [nvarchar](15) NOT NULL,
	[BusinessState] [int] NOT NULL,
	[AgencyCode] [varchar](10) NOT NULL,
	[OrgID] [int] NOT NULL,
	[DepartmentIDs] [nvarchar](50) NOT NULL,
	[OrgCateID] [int] NOT NULL,
	[PID] [int] NOT NULL,
	[OrgLevel] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[DepartmentOther] [nvarchar](10) NOT NULL,
	[ReportingType] [int] NOT NULL,
	[IsSimpleFlu] [bit] NOT NULL,
	[InoculationSchedule] [nvarchar](50) NOT NULL,
	[OrgAgencyEnName] [varchar](20) NOT NULL,
	[OrgAgencyShortName] [nvarchar](10) NOT NULL,
	[PhoneAreaCode] [varchar](5) NOT NULL,
	[AgencyCate] [int] NOT NULL,
	[LogicDel] [bit] NOT NULL,
 CONSTRAINT [PK__Org__3214EC275CABEB81] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgAgency__4C6B5938]  DEFAULT ('') FOR [OrgAgencyName]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencySta__4D5F7D71]  DEFAULT ((0)) FOR [AgencyState]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyCou__4E53A1AA]  DEFAULT ((0)) FOR [AgencyCounty]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyTow__4F47C5E3]  DEFAULT ((0)) FOR [AgencyTown]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyVil__503BEA1C]  DEFAULT ((0)) FOR [AgencyVillage]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyAdd__51300E55]  DEFAULT ('') FOR [AgencyAddress]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyPho__5224328E]  DEFAULT ('') FOR [AgencyPhoneNumber]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__BusinessS__531856C7]  DEFAULT ((0)) FOR [BusinessState]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__AgencyCod__540C7B00]  DEFAULT ('') FOR [AgencyCode]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgID__55009F39]  DEFAULT ((0)) FOR [OrgID]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Departmen__55F4C372]  DEFAULT ((50)) FOR [DepartmentIDs]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgCate__56E8E7AB]  DEFAULT ((0)) FOR [OrgCateID]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__PID__7849DB76]  DEFAULT ((0)) FOR [PID]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgLevel__793DFFAF]  DEFAULT ((0)) FOR [OrgLevel]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrderNumb__11158940]  DEFAULT ((0)) FOR [OrderNumber]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Departmen__1B9317B3]  DEFAULT ('') FOR [DepartmentOther]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Reporting__1C873BEC]  DEFAULT ((0)) FOR [ReportingType]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IsSimpleF__1D7B6025]  DEFAULT ((0)) FOR [IsSimpleFlu]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Inoculati__3DE82FB7]  DEFAULT ('') FOR [InoculationSchedule]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgAgency__57A801BA]  DEFAULT ('') FOR [OrgAgencyEnName]
GO

ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__OrgAgency__589C25F3]  DEFAULT ('') FOR [OrgAgencyShortName]
GO

ALTER TABLE [dbo].[Org] ADD  DEFAULT ('') FOR [PhoneAreaCode]
GO

ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [AgencyCate]
GO

ALTER TABLE [dbo].[Org] ADD  DEFAULT ((0)) FOR [LogicDel]
GO


