USE [perspective]
GO
/****** Object:  Table [dbo].[user_followers]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_followers](
	[RelationshipID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[FollowerID] [bigint] NOT NULL,
	[Timestamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_followers] ADD  CONSTRAINT [DF_user_followers_RelationshipID]  DEFAULT (newsequentialid()) FOR [RelationshipID]
GO
ALTER TABLE [dbo].[user_followers]  WITH CHECK ADD  CONSTRAINT [FK_user_followers_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[user_followers] CHECK CONSTRAINT [FK_user_followers_users]
GO
ALTER TABLE [dbo].[user_followers]  WITH CHECK ADD  CONSTRAINT [FK_user_followers_users1] FOREIGN KEY([FollowerID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[user_followers] CHECK CONSTRAINT [FK_user_followers_users1]
GO
