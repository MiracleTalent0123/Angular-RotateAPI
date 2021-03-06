USE [perspective]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[PostID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[TopicID] [bigint] NULL,
	[Tone] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[ParentPostID] [uniqueidentifier] NULL,
	[Body] [ntext] NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_PostID]  DEFAULT (newsequentialid()) FOR [PostID]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_posts] FOREIGN KEY([ParentPostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_posts]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_topics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[topics] ([TopicID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_topics]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_users]
GO
