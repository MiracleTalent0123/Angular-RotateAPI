USE [perspective]
GO
/****** Object:  Table [dbo].[likes]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likes](
	[LikeID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[LikedPostID] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_likes] PRIMARY KEY CLUSTERED 
(
	[LikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[likes] ADD  CONSTRAINT [DF_likes_LikeID]  DEFAULT (newsequentialid()) FOR [LikeID]
GO
ALTER TABLE [dbo].[likes] ADD  CONSTRAINT [DF_likes_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD  CONSTRAINT [FK_likes_posts] FOREIGN KEY([LikedPostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[likes] CHECK CONSTRAINT [FK_likes_posts]
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD  CONSTRAINT [FK_likes_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[likes] CHECK CONSTRAINT [FK_likes_users]
GO
