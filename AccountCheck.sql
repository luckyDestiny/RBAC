USE RBAC
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountCheck](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckYear] [int] NOT NULL,
	[CheckOrgID] [int] NOT NULL,
	[CheckNumber] [int] NOT NULL,
	[BeContinue] [int] NOT NULL,
	[BeBreak] [int] NOT NULL,
	[BeUnconfirmed] [int] NOT NULL,
	[ApplyUserID] [int] NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[CreatedUserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CheckProgress] [int] NOT NULL,
	[YearSeason] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [CheckYear]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [CheckOrgID]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [CheckNumber]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [BeContinue]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [BeBreak]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [BeUnconfirmed]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [ApplyUserID]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT (getdate()) FOR [ApplyDate]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [CreatedUserID]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [CheckProgress]
GO

ALTER TABLE [dbo].[AccountCheck] ADD  DEFAULT ((0)) FOR [YearSeason]
GO


