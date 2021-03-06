USE [perspective]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[UserID] [bigint] NOT NULL,
	[ProfilePic] [nvarchar](255) NOT NULL,
	[BannerPic] [nvarchar](50) NOT NULL,
	[Bio] [ntext] NOT NULL,
 CONSTRAINT [PK_profiles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[profiles]  WITH CHECK ADD  CONSTRAINT [FK_profiles_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profiles] CHECK CONSTRAINT [FK_profiles_users]
GO
