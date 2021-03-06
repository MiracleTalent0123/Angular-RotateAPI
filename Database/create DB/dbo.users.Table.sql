USE [dev-db]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](70) NOT NULL,
	[DisplayName] [nvarchar](70) NOT NULL,
	[PhoneNumber] [nchar](11) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Hash] [nvarchar](255) NOT NULL,
	[AuthorizationLevel] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_AuthorizationLevel]  DEFAULT ((0)) FOR [AuthorizationLevel]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_Timestamp]  DEFAULT (getutcdate()) FOR [Timestamp]
GO
