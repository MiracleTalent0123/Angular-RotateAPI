
/****** Object:  Table [dbo].[login_attempts]    Script Date: 8/5/2021 2:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_attempts](
	[LoginID] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](70) NOT NULL,
	[TimestampLogin] [datetime] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Successful] [bit] NOT NULL,
	[Device] [nvarchar](max) NULL,
 CONSTRAINT [PK_login_attempts] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[login_attempts] ADD  CONSTRAINT [DF_login_attempts_LoginID]  DEFAULT (newsequentialid()) FOR [LoginID]
GO
ALTER TABLE [dbo].[login_attempts] ADD  CONSTRAINT [DF_login_attempts_Timestamp]  DEFAULT (getdate()) FOR [TimestampLogin]
GO
