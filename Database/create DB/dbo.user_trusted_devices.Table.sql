USE [perspective]
GO
/****** Object:  Table [dbo].[user_trusted_devices]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_trusted_devices](
	[DeviceID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Device] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_user_trusted_devices] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[user_trusted_devices]  WITH CHECK ADD  CONSTRAINT [FK_user_trusted_devices_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[user_trusted_devices] CHECK CONSTRAINT [FK_user_trusted_devices_users]
GO
