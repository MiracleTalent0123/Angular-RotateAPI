USE [perspective]
GO
/****** Object:  Table [dbo].[user_topics]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_topics](
	[UserTopicID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[FollowedTopicID] [bigint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_user-topics] PRIMARY KEY CLUSTERED 
(
	[UserTopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_topics] ADD  CONSTRAINT [DF_user-topics_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[user_topics]  WITH CHECK ADD  CONSTRAINT [FK_user-topics_topics] FOREIGN KEY([FollowedTopicID])
REFERENCES [dbo].[topics] ([TopicID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_topics] CHECK CONSTRAINT [FK_user-topics_topics]
GO
ALTER TABLE [dbo].[user_topics]  WITH CHECK ADD  CONSTRAINT [FK_user-topics_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[user_topics] CHECK CONSTRAINT [FK_user-topics_users]
GO
