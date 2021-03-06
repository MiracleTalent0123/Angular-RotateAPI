USE [perspective]
GO
/****** Object:  Table [dbo].[drafts]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drafts](
	[UserID] [bigint] NOT NULL,
	[DraftID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[TopicID] [bigint] NULL,
	[Tone] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[ParentPostID] [uniqueidentifier] NULL,
	[Body] [ntext] NOT NULL,
 CONSTRAINT [PK_drafts] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[DraftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[drafts]  WITH CHECK ADD  CONSTRAINT [FK_drafts_posts] FOREIGN KEY([ParentPostID])
REFERENCES [dbo].[posts] ([PostID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[drafts] CHECK CONSTRAINT [FK_drafts_posts]
GO
ALTER TABLE [dbo].[drafts]  WITH CHECK ADD  CONSTRAINT [FK_drafts_topics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[topics] ([TopicID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[drafts] CHECK CONSTRAINT [FK_drafts_topics]
GO
ALTER TABLE [dbo].[drafts]  WITH CHECK ADD  CONSTRAINT [FK_drafts_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[drafts] CHECK CONSTRAINT [FK_drafts_users]
GO
