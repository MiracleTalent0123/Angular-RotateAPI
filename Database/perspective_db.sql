/****** Object:  Database [dev-db]    Script Date: 9/4/2021 6:54:12 PM ******/
CREATE DATABASE [dev-db]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 150 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [dev-db] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [dev-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dev-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dev-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dev-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dev-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [dev-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dev-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dev-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dev-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dev-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dev-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dev-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dev-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dev-db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [dev-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dev-db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [dev-db] SET  MULTI_USER 
GO
ALTER DATABASE [dev-db] SET ENCRYPTION ON
GO
ALTER DATABASE [dev-db] SET QUERY_STORE = ON
GO
ALTER DATABASE [dev-db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[blocked]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blocked](
	[BlockedID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[BlockedUserID] [bigint] NOT NULL,
 CONSTRAINT [PK_blocked] PRIMARY KEY CLUSTERED 
(
	[BlockedID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drafts]    Script Date: 9/4/2021 6:54:12 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email_table]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_table](
	[EmailID] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Verification] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_email_table] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[follow_request]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[follow_request](
	[RequestID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[RequesterUserID] [bigint] NOT NULL,
 CONSTRAINT [PK_follow_request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[homepage_settings]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homepage_settings](
	[UserID] [bigint] NOT NULL,
	[DarkMode] [bit] NOT NULL,
	[Font] [nvarchar](50) NOT NULL,
	[ColorblindMode] [bit] NOT NULL,
	[AutoPlay] [bit] NOT NULL,
	[LanguageFilter] [bit] NOT NULL,
 CONSTRAINT [PK_homepage_settings] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interactions]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interactions](
	[InteractionID] [uniqueidentifier] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_interactions] PRIMARY KEY CLUSTERED 
(
	[InteractionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_attempts]    Script Date: 9/4/2021 6:54:12 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 9/4/2021 6:54:12 PM ******/
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
	[AlphaPostID] [uniqueidentifier] NULL,
	[Body] [ntext] NULL,
	[Timestamp] [datetime] NOT NULL,
	[Reviewed] [bit] NOT NULL,
	[BannerImage] [nvarchar](max) NULL,
	[Privated] [bit] NULL,
	[Edited] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[UserID] [bigint] NOT NULL,
	[ProfilePic] [nvarchar](255) NOT NULL,
	[BannerPic] [nvarchar](255) NULL,
	[Pronouns] [nvarchar](50) NULL,
	[Bio] [ntext] NULL,
	[Website] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_profiles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[survey]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[survey](
	[UserID] [bigint] NOT NULL,
	[ClimateChange] [int] NOT NULL,
	[BorderControl] [int] NOT NULL,
	[MilitaryViolence] [int] NOT NULL,
	[Infrastructure] [int] NOT NULL,
	[Abortion] [int] NOT NULL,
 CONSTRAINT [PK_survey] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[TopicID] [bigint] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_followers]    Script Date: 9/4/2021 6:54:12 PM ******/
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
/****** Object:  Table [dbo].[user_settings]    Script Date: 9/4/2021 6:54:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_settings](
	[UserID] [bigint] NOT NULL,
	[UserMentions] [bit] NOT NULL,
	[NewFollowers] [bit] NOT NULL,
	[NewLikes] [bit] NOT NULL,
	[NewComments] [bit] NOT NULL,
	[CommentReplies] [bit] NOT NULL,
	[PrivateConvoRequests] [bit] NOT NULL,
	[NewAwards] [bit] NOT NULL,
	[Privated] [bit] NOT NULL,
	[HideBipartisan] [bit] NOT NULL,
	[Premium] [bit] NOT NULL,
	[DMSettings] [int] NOT NULL,
 CONSTRAINT [PK_user_settings] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_topics]    Script Date: 9/4/2021 6:54:12 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_trusted_devices]    Script Date: 9/4/2021 6:54:12 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 9/4/2021 6:54:12 PM ******/
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
	[Private] [bit] NOT NULL,
	[EmailVerified] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[views]    Script Date: 9/4/2021 6:54:12 PM ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blocked] ADD  CONSTRAINT [DF_blocked_BlockedID]  DEFAULT (newsequentialid()) FOR [BlockedID]
GO
ALTER TABLE [dbo].[homepage_settings] ADD  CONSTRAINT [DF_homepage_settings_DarkMode]  DEFAULT ((1)) FOR [DarkMode]
GO
ALTER TABLE [dbo].[homepage_settings] ADD  CONSTRAINT [DF_homepage_settings_ColorblindMode]  DEFAULT ((0)) FOR [ColorblindMode]
GO
ALTER TABLE [dbo].[homepage_settings] ADD  CONSTRAINT [DF_homepage_settings_AutoPlay]  DEFAULT ((1)) FOR [AutoPlay]
GO
ALTER TABLE [dbo].[homepage_settings] ADD  CONSTRAINT [DF_homepage_settings_LanguageFilter]  DEFAULT ((0)) FOR [LanguageFilter]
GO
ALTER TABLE [dbo].[interactions] ADD  CONSTRAINT [DF_interactions_InteractionID]  DEFAULT (newsequentialid()) FOR [InteractionID]
GO
ALTER TABLE [dbo].[login_attempts] ADD  CONSTRAINT [DF_login_attempts_LoginID]  DEFAULT (newsequentialid()) FOR [LoginID]
GO
ALTER TABLE [dbo].[login_attempts] ADD  CONSTRAINT [DF_login_attempts_Timestamp]  DEFAULT (getdate()) FOR [TimestampLogin]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_PostID]  DEFAULT (newsequentialid()) FOR [PostID]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Reviewed]  DEFAULT ((0)) FOR [Reviewed]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Privated]  DEFAULT ((0)) FOR [Privated]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Edited]  DEFAULT ((0)) FOR [Edited]
GO
ALTER TABLE [dbo].[posts] ADD  CONSTRAINT [DF_posts_Delete]  DEFAULT ((0)) FOR [Delete]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_profiles_ProfilePic]  DEFAULT ('https://devblobstorageper.blob.core.windows.net/images/default-profile-icon-24.jpg') FOR [ProfilePic]
GO
ALTER TABLE [dbo].[user_followers] ADD  CONSTRAINT [DF_user_followers_RelationshipID]  DEFAULT (newsequentialid()) FOR [RelationshipID]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_UserMentions]  DEFAULT ((1)) FOR [UserMentions]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_NewFollowers]  DEFAULT ((1)) FOR [NewFollowers]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_NewLikes]  DEFAULT ((1)) FOR [NewLikes]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_NewComments]  DEFAULT ((1)) FOR [NewComments]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_CommentReplies]  DEFAULT ((1)) FOR [CommentReplies]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_PrivateConvoRequests]  DEFAULT ((1)) FOR [PrivateConvoRequests]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_NewAwards]  DEFAULT ((1)) FOR [NewAwards]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_Privated]  DEFAULT ((0)) FOR [Privated]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_HideBipartisan]  DEFAULT ((0)) FOR [HideBipartisan]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_Premium]  DEFAULT ((0)) FOR [Premium]
GO
ALTER TABLE [dbo].[user_settings] ADD  CONSTRAINT [DF_user_settings_DMSettings]  DEFAULT ((0)) FOR [DMSettings]
GO
ALTER TABLE [dbo].[user_topics] ADD  CONSTRAINT [DF_user-topics_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_AuthorizationLevel]  DEFAULT ((0)) FOR [AuthorizationLevel]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_Timestamp]  DEFAULT (getutcdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_Private]  DEFAULT ((0)) FOR [Private]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_EmailVerified]  DEFAULT ((0)) FOR [EmailVerified]
GO
ALTER TABLE [dbo].[views] ADD  CONSTRAINT [DF_views_ViewID]  DEFAULT (newsequentialid()) FOR [ViewID]
GO
ALTER TABLE [dbo].[views] ADD  CONSTRAINT [DF_views_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[blocked]  WITH CHECK ADD  CONSTRAINT [FK_blocked_users1] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[blocked] CHECK CONSTRAINT [FK_blocked_users1]
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
ALTER TABLE [dbo].[follow_request]  WITH CHECK ADD  CONSTRAINT [FK_follow_request_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[follow_request] CHECK CONSTRAINT [FK_follow_request_users]
GO
ALTER TABLE [dbo].[follow_request]  WITH CHECK ADD  CONSTRAINT [FK_follow_request_users1] FOREIGN KEY([RequesterUserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[follow_request] CHECK CONSTRAINT [FK_follow_request_users1]
GO
ALTER TABLE [dbo].[homepage_settings]  WITH CHECK ADD  CONSTRAINT [FK_homepage_settings_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[homepage_settings] CHECK CONSTRAINT [FK_homepage_settings_users]
GO
ALTER TABLE [dbo].[interactions]  WITH CHECK ADD  CONSTRAINT [FK_interactions_posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[interactions] CHECK CONSTRAINT [FK_interactions_posts]
GO
ALTER TABLE [dbo].[interactions]  WITH CHECK ADD  CONSTRAINT [FK_interactions_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[interactions] CHECK CONSTRAINT [FK_interactions_users]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_posts] FOREIGN KEY([ParentPostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_posts]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_posts1] FOREIGN KEY([AlphaPostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_posts1]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_posts2] FOREIGN KEY([PostID])
REFERENCES [dbo].[posts] ([PostID])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts_posts2]
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
ALTER TABLE [dbo].[profiles]  WITH CHECK ADD  CONSTRAINT [FK_profiles_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profiles] CHECK CONSTRAINT [FK_profiles_users]
GO
ALTER TABLE [dbo].[survey]  WITH CHECK ADD  CONSTRAINT [FK_survey_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[survey] CHECK CONSTRAINT [FK_survey_users]
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
ALTER TABLE [dbo].[user_settings]  WITH CHECK ADD  CONSTRAINT [FK_user_settings_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[user_settings] CHECK CONSTRAINT [FK_user_settings_users]
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
ALTER TABLE [dbo].[user_trusted_devices]  WITH CHECK ADD  CONSTRAINT [FK_user_trusted_devices_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_trusted_devices] CHECK CONSTRAINT [FK_user_trusted_devices_users]
GO
ALTER TABLE [dbo].[views]  WITH CHECK ADD  CONSTRAINT [FK_views_users] FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[views] CHECK CONSTRAINT [FK_views_users]
GO
ALTER DATABASE [dev-db] SET  READ_WRITE 
GO
