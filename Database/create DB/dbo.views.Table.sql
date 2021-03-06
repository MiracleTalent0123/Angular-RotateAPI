USE [perspective]
GO
/****** Object:  Table [dbo].[views]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[views](
	[ViewID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ViewedPostID] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_views] PRIMARY KEY CLUSTERED 
(
	[ViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[views] ADD  CONSTRAINT [DF_views_ViewID]  DEFAULT (newsequentialid()) FOR [ViewID]
GO
ALTER TABLE [dbo].[views] ADD  CONSTRAINT [DF_views_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[views]  WITH CHECK ADD  CONSTRAINT [FK_views_posts] FOREIGN KEY([ViewedPostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[views] CHECK CONSTRAINT [FK_views_posts]
GO
ALTER TABLE [dbo].[views]  WITH CHECK ADD  CONSTRAINT [FK_views_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[views] CHECK CONSTRAINT [FK_views_users]
GO
