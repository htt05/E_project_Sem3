USE [master]
GO
/****** Object:  Database [DB_EProject_Sem3]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE DATABASE [DB_EProject_Sem3]
GO
ALTER DATABASE [DB_EProject_Sem3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_EProject_Sem3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_EProject_Sem3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_EProject_Sem3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_EProject_Sem3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_EProject_Sem3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_EProject_Sem3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_EProject_Sem3] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DB_EProject_Sem3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_EProject_Sem3] SET  MULTI_USER 
GO
ALTER DATABASE [DB_EProject_Sem3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_EProject_Sem3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_EProject_Sem3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_EProject_Sem3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_EProject_Sem3] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_EProject_Sem3]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](300) NULL,
	[Balance] [float] NOT NULL,
	[RenewalDate] [datetime2](7) NULL,
	[CreationDate] [datetime2](7) NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cards]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
	[Image] [nvarchar](300) NULL,
	[CreationDate] [datetime2](7) NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[ParentCategory] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subcribes]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcribes](
	[SubcribeId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Content] [ntext] NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Subcribes] PRIMARY KEY CLUSTERED 
(
	[SubcribeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[TransactionDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DestinationEmail] [nvarchar](250) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_TransactionDetails] PRIMARY KEY CLUSTERED 
(
	[TransactionDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 1/7/2025 2:56:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](300) NULL,
	[CreationDate] [datetime2](7) NULL,
	[Success] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[CardId] [int] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241230071248_v2', N'8.0.11')
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Email], [Password], [Image], [Balance], [RenewalDate], [CreationDate], [Role]) VALUES (1, N'phong', N'admin1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL, 0, NULL, NULL, N'Disable')
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Email], [Password], [Image], [Balance], [RenewalDate], [CreationDate], [Role]) VALUES (2, N'Admin', N'Admin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'user.jpg', 0, NULL, CAST(N'2025-01-06 15:03:30.8658006' AS DateTime2), N'Admin')
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Email], [Password], [Image], [Balance], [RenewalDate], [CreationDate], [Role]) VALUES (3, N'user', N'user@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'user.jpg', 0, NULL, CAST(N'2025-01-06 15:36:04.1767299' AS DateTime2), N'User')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Cards] ON 

INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (1, N'Ambedkar Jayanti_1', 1, N'Amberkar_1 (1).png', CAST(N'2025-01-06 14:21:05.5228786' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (2, N'Ambedkar Jayanti_2', 1, N'01-work-anniversary.jpg', CAST(N'2025-01-06 14:26:12.0139309' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (3, N'Ambedkar Jayanti_3', 1, N'02-retirement.jpg', CAST(N'2025-01-06 14:26:27.8830889' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (4, N'Ambedkar Jayanti_4', 1, N'2ndOct_Long_1.jpg', CAST(N'2025-01-06 14:26:41.9575065' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (5, N'Ambedkar Jayanti_5', 1, N'2ndOct_Long_3.jpg', CAST(N'2025-01-06 14:26:51.1379372' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (6, N'Ambedkar Jayanti_6', 1, N'2ndOct_Long_4.jpg', CAST(N'2025-01-06 14:27:02.6019863' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (7, N'Ambedkar Jayanti_7', 1, N'2ndOct_Long_6.jpg', CAST(N'2025-01-06 14:27:12.1828910' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (8, N'Ambedkar Jayanti_8', 1, N'03-work-anniversary.jpg', CAST(N'2025-01-06 14:27:25.5005581' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (9, N'Ambedkar Jayanti_9', 1, N'04-retirement.jpg', CAST(N'2025-01-06 14:27:57.6920318' AS DateTime2), NULL, 2)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (10, N'Father''s Day_1', 1, N'05-work-anniversary.jpg', CAST(N'2025-01-06 14:49:04.8403171' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (11, N'Father''s Day_2', 1, N'06-retirement.jpg', CAST(N'2025-01-06 14:49:19.5142496' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (12, N'Father''s Day_3', 1, N'07-Christmas.jpg', CAST(N'2025-01-06 14:49:35.6802709' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (13, N'Father''s Day_4', 1, N'08-work-anniversary.jpg', CAST(N'2025-01-06 14:49:52.8474962' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (14, N'Father''s Day_5', 1, N'09-work-anniversary.jpg', CAST(N'2025-01-06 14:50:08.9792113' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (15, N'Father''s Day_6', 1, N'10-Christmas.jpg', CAST(N'2025-01-06 14:50:28.6910480' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (16, N'Father''s Day_7', 1, N'10-work-anniversary.jpg', CAST(N'2025-01-06 14:50:47.7036630' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (17, N'Diwali_1', 1, N'15_August-2021_eGreeting_01.jpg', CAST(N'2025-01-06 23:53:36.9168188' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (18, N'Diwali_2', 1, N'07-Christmas.jpg', CAST(N'2025-01-06 23:53:52.9355878' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (19, N'Diwali_3', 1, N'20200219_1039137.jpg', CAST(N'2025-01-06 23:54:07.6443415' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (20, N'Diwali_4', 1, N'20200413_1115365.jpg', CAST(N'2025-01-06 23:54:25.2344932' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (21, N'Diwali_5', 1, N'08-work-anniversary.jpg', CAST(N'2025-01-06 23:54:37.8649639' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (22, N'Diwali_6', 1, N'15_August-2021_eGreeting_02.jpg', CAST(N'2025-01-06 23:54:47.9335456' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (23, N'Diwali_7', 1, N'15Aug_Long_4.jpg', CAST(N'2025-01-06 23:55:02.7710357' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (24, N'Diwali_8', 1, N'15_August-2021_eGreeting_04.jpg', CAST(N'2025-01-06 23:55:27.2949614' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (25, N'Buddha Purnima_1', 1, N'20200129_1143420.gif', CAST(N'2025-01-06 23:56:57.5463642' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (26, N'Buddha Purnima_2', 1, N'20200405_0248441.jpg', CAST(N'2025-01-06 23:57:13.1207633' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (27, N'Buddha Purnima_3', 1, N'20200405_0248442.jpg', CAST(N'2025-01-06 23:57:28.3486123' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (28, N'Buddha Purnima_4', 1, N'20200405_0248443.jpg', CAST(N'2025-01-06 23:57:46.6935348' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (29, N'Buddha Purnima_5', 1, N'20200405_0248444.jpg', CAST(N'2025-01-06 23:57:58.0000000' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (30, N'Buddha Purnima_6', 1, N'20200405_0248446.jpg', CAST(N'2025-01-06 23:58:35.4535148' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (31, N'Buddha Purnima_7', 1, N'20200426_0721146.jpg', CAST(N'2025-01-06 23:59:11.6840466' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (32, N'Christmas_1', 1, N'07-Christmas.jpg', CAST(N'2025-01-06 23:59:30.5063840' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (33, N'Christmas_2', 1, N'10-Christmas.jpg', CAST(N'2025-01-06 23:59:49.8871486' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (34, N'Christmas_3', 1, N'20200305_0352113.jpg', CAST(N'2025-01-07 00:01:08.1342842' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (35, N'Christmas_4', 1, N'20200219_1034460.gif', CAST(N'2025-01-07 00:01:23.3989808' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (36, N'Christmas_5', 1, N'20200129_1114425.jpg', CAST(N'2025-01-07 00:01:38.7206029' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (37, N'Christmas_6', 1, N'20200219_1039136.jpg', CAST(N'2025-01-07 00:01:50.7289933' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (38, N'Christmas_7', 1, N'20200129_1113360.jpg', CAST(N'2025-01-07 00:02:06.1817890' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (39, N'Christmas_8', 1, N'20200129_1114426.gif', CAST(N'2025-01-07 00:03:47.2633730' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (40, N'Victoria Memorial Building', 1, N'20051004172422indiagate.jpg', CAST(N'2025-01-07 00:05:52.1364192' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (41, N'Somnath Temple', 1, N'20051005102430gatewayofindia.jpg', CAST(N'2025-01-07 00:06:12.7524536' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (42, N'Shore Temple', 1, N'20051005125002bahai.jpg', CAST(N'2025-01-07 00:06:33.9471298' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (43, N'Saint Philomenas Cathedral', 1, N'20051007142708bangalore.jpg', CAST(N'2025-01-07 00:06:54.3204944' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (44, N'Rumi Darwaza', 1, N'20051007151238tajmahal.jpg', CAST(N'2025-01-07 00:07:22.8839242' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (45, N'Dilwara Temple', 1, N'20051007152602jharokha.jpg', CAST(N'2025-01-07 00:07:44.2713579' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (46, N'Gol Gumbaz', 1, N'20061208102202eid1.jpg', CAST(N'2025-01-07 00:12:43.5065306' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (47, N'Charminar', 1, N'20061208102218eid2.jpg', CAST(N'2025-01-07 00:13:00.8048901' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (48, N'Theyyam', 1, N'1.jpg', CAST(N'2025-01-07 00:15:46.9446316' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (49, N'Odisi', 1, N'2.jpg', CAST(N'2025-01-07 00:16:00.1866590' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (50, N'Mohiniattam', 1, N'15Aug_Long_3.jpg', CAST(N'2025-01-07 00:16:11.0000000' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (51, N'Manipuri', 1, N'20200219_1033070.gif', CAST(N'2025-01-07 00:16:21.0000000' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (52, N'Lavni', 1, N'5.jpg', CAST(N'2025-01-07 00:16:35.9023496' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (53, N'Kathakali', 1, N'6.jpg', CAST(N'2025-01-07 00:16:47.3766918' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (54, N'Kathak', 1, N'08-work-anniversary.jpg', CAST(N'2025-01-07 00:16:57.0000000' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (55, N'Folk Dance', 1, N'8.jpg', CAST(N'2025-01-07 00:17:06.8564660' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (56, N'Delhi High Court', 1, N'1.jpg', CAST(N'2025-01-07 00:18:43.7696411' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (57, N'Delhi High Court_1', 1, N'2.jpg', CAST(N'2025-01-07 00:19:07.9312781' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (58, N'Delhi High Court_2', 1, N'20200219_1039137.jpg', CAST(N'2025-01-07 00:19:25.0000000' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (59, N'Delhi High Court_3', 1, N'2.jpg', CAST(N'2025-01-07 00:19:39.0963396' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (60, N'Electronics and IT', 1, N'4.jpg', CAST(N'2025-01-07 00:21:00.4052121' AS DateTime2), NULL, 14)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (61, N'Food Processing Industries', 1, N'5.jpg', CAST(N'2025-01-07 00:22:51.4495485' AS DateTime2), NULL, 15)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (62, N'Food Processing Industriess', 1, N'6.jpg', CAST(N'2025-01-07 00:23:06.4056595' AS DateTime2), NULL, 15)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (63, N'New Year_1', 1, N'20200129_1114426.gif', CAST(N'2025-01-07 00:24:10.0000000' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (64, N'New Year_2', 1, N'20200323_0102016.jpg', CAST(N'2025-01-07 00:24:20.0000000' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (65, N'New Yea3', 1, N'9.jpg', CAST(N'2025-01-07 00:24:30.3791665' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (66, N'Jharokha', 1, N'2ndOct_Long_7.jpg', CAST(N'2025-01-07 00:27:31.0000000' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (67, N'Rural house', 1, N'11.jpg', CAST(N'2025-01-07 00:27:44.6109261' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (68, N'Boat', 1, N'2ndOct_Long_4.jpg', CAST(N'2025-01-07 00:28:01.0000000' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (69, N'Sunset in village', 1, N'2ndOct_Long_2.jpg', CAST(N'2025-01-07 00:28:16.0000000' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (70, N'Vidhan Soudha, Bangalore', 1, N'14.jpg', CAST(N'2025-01-07 00:29:14.6676982' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (71, N'Lotus Temple', 1, N'15.jpg', CAST(N'2025-01-07 00:29:24.7391833' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (72, N'India Gate', 1, N'16.jpg', CAST(N'2025-01-07 00:29:35.4828553' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (73, N'Gateway of India', 1, N'17.jpg', CAST(N'2025-01-07 00:29:46.1611090' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (74, N'birthday-07', 1, N'1.jpg', CAST(N'2025-01-07 00:32:38.4959948' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (75, N'birthday-01', 1, N'2.jpg', CAST(N'2025-01-07 00:32:48.1230906' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (76, N'birthday-02', 1, N'3.gif', CAST(N'2025-01-07 00:32:57.2460515' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (77, N'birthday-03', 0, N'3.gif', CAST(N'2025-01-07 00:33:13.4376916' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (78, N'birthday-04', 1, N'10-Christmas.jpg', CAST(N'2025-01-07 00:33:47.0000000' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (79, N'birthday-05', 1, N'5.jpg', CAST(N'2025-01-07 00:33:56.5247566' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (80, N'birthday-06', 1, N'6.jpg', CAST(N'2025-01-07 00:34:05.5096010' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (81, N'birthday-08', 1, N'8.jpg', CAST(N'2025-01-07 00:34:14.7771004' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (82, N'Congratulations3', 1, N'9.jpg', CAST(N'2025-01-07 00:35:30.6441430' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (83, N'Congratulations2', 1, N'2ndOct_Long_6.jpg', CAST(N'2025-01-07 00:35:40.0000000' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (84, N'Congratulations1', 1, N'11.jpg', CAST(N'2025-01-07 00:35:48.6234032' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (85, N'Good_Governance_Day_1', 1, N'20200305_0352128.jpg', CAST(N'2025-01-07 13:25:56.7128259' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (86, N'Good_Governance_Day_2', 1, N'20200219_1039131.jpg', CAST(N'2025-01-07 13:26:16.5322131' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (87, N'Good_Governance_Day_4', 1, N'20200410_0950485.jpg', CAST(N'2025-01-07 13:26:38.9569180' AS DateTime2), NULL, 3)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (88, N'Good_Governance_Day_5', 1, N'20200409_1206435.jpg', CAST(N'2025-01-07 13:27:05.1595089' AS DateTime2), NULL, 7)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (89, N'Durga Puja 2', 1, N'20200305_0352128.jpg', CAST(N'2025-01-07 13:28:23.7234351' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (90, N'Durga Puja 7', 1, N'20200405_0248443.jpg', CAST(N'2025-01-07 13:29:05.6899808' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (91, N'Durga Puja 9', 1, N'20200413_1115368.jpg', CAST(N'2025-01-07 13:29:16.2328294' AS DateTime2), NULL, 6)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (92, N'Durga Puja 12', 1, N'20200219_1039135.jpg', CAST(N'2025-01-07 13:30:31.6116734' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (93, N'Durga Puja 71', 1, N'20200129_1114421.jpg', CAST(N'2025-01-07 13:30:45.5525598' AS DateTime2), NULL, 5)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (94, N'Durga Puja 122', 1, N'20200426_0721146.jpg', CAST(N'2025-01-07 13:31:10.0582912' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (95, N'Durga Puja 123', 1, N'20200410_0950473.jpg', CAST(N'2025-01-07 13:31:24.2495885' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (96, N'Durga Puja 112', 1, N'26Jan_Long_7.jpg', CAST(N'2025-01-07 13:31:40.0561024' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (97, N'Durga Puja 1222', 1, N'20200219_1039135.jpg', CAST(N'2025-01-07 13:31:54.3332215' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (98, N'Durga Puja 731', 1, N'20200219_1039131.jpg', CAST(N'2025-01-07 13:32:07.7815100' AS DateTime2), NULL, 19)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (99, N'Ambedkar Jayanti_1 ss', 1, N'20200129_1114421.jpg', CAST(N'2025-01-07 13:32:52.7047392' AS DateTime2), NULL, 18)
GO
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (100, N'Ambedkar Jayanti_1 ssss', 1, N'20200405_0248444.jpg', CAST(N'2025-01-07 13:33:03.5597432' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (101, N'Ambedkar Jayanti_122', 1, N'20200122_1209548.jpg', CAST(N'2025-01-07 13:33:14.2276645' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (102, N'Ambedkar Jayanti_123', 1, N'20200305_0352114.jpg', CAST(N'2025-01-07 13:33:25.7344823' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (103, N'Ambedkar Jayanti_145', 1, N'20200122_1209540.jpg', CAST(N'2025-01-07 13:33:50.8858647' AS DateTime2), NULL, 18)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (104, N'card 123', 1, N'20200409_1206447.jpg', CAST(N'2025-01-07 13:35:37.0568546' AS DateTime2), NULL, 12)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (105, N'Christmas_145', 1, N'20200219_1039136.jpg', CAST(N'2025-01-07 13:36:02.2281302' AS DateTime2), NULL, 11)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (106, N'Durga Puja 3', 1, N'20200426_0721132.jpg', CAST(N'2025-01-07 13:36:37.0797030' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (107, N'Durga Puja 111', 1, N'20200409_1206446.jpg', CAST(N'2025-01-07 13:37:15.7077125' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (108, N'Durga Puja 712', 1, N'20200523_1104308.jpg', CAST(N'2025-01-07 13:37:27.6723358' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (109, N'Durga Puja 72', 1, N'20200305_0352115.jpg', CAST(N'2025-01-07 13:37:42.6135138' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (110, N'Durga Puja 77', 1, N'20200305_0352111.jpg', CAST(N'2025-01-07 13:37:54.9068239' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (111, N'Durga Puja 7123', 1, N'20200505_1217070.jpg', CAST(N'2025-01-07 13:38:07.2120960' AS DateTime2), NULL, 16)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (112, N'Diwali_555', 1, N'20200426_0721131.jpg', CAST(N'2025-01-07 13:39:30.0431425' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (113, N'Diwali_721', 1, N'15_August-2021_eGreeting_05.jpg', CAST(N'2025-01-07 13:39:44.4126055' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (114, N'Durga Puja 7112', 1, N'01-work-anniversary.jpg', CAST(N'2025-01-07 13:39:55.2073856' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (115, N'Ambedkar Jayanti_121', 1, N'05-work-anniversary.jpg', CAST(N'2025-01-07 13:40:08.4915117' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (116, N'Electronics and IT 1', 1, N'26Jan_Long_2.jpg', CAST(N'2025-01-07 13:40:19.9334054' AS DateTime2), NULL, 13)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (117, N'Congratulations4', 1, N'20200323_0102017.jpg', CAST(N'2025-01-07 13:42:28.8154709' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (118, N'Congratulations5', 1, N'02-retirement.jpg', CAST(N'2025-01-07 13:42:41.4210988' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (119, N'Congratulations6', 1, N'02-work-anniversary.jpg', CAST(N'2025-01-07 13:42:49.6503964' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (120, N'Congratulations7', 1, N'2ndOct_Long_1.jpg', CAST(N'2025-01-07 13:42:59.1669232' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (121, N'Congratulations8', 1, N'2ndOct_Long_8.jpg', CAST(N'2025-01-07 13:43:18.0106855' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (122, N'Congratulations9', 1, N'10-work-anniversary.jpg', CAST(N'2025-01-07 13:43:28.7282891' AS DateTime2), NULL, 22)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (123, N'Birthday-1', 1, N'20200305_0352111.jpg', CAST(N'2025-01-07 13:44:27.3554395' AS DateTime2), NULL, 21)
INSERT [dbo].[Cards] ([CardId], [CardName], [Status], [Image], [CreationDate], [Description], [CategoryId]) VALUES (124, N'Birthday-2', 1, N'07-Christmas.jpg', CAST(N'2025-01-07 13:44:43.4727399' AS DateTime2), NULL, 21)
SET IDENTITY_INSERT [dbo].[Cards] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (2, N'Ambedkar Jayanti', 1, N'Celebration', CAST(N'2025-01-03 15:07:27.1135051' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (3, N'Father''s Day', 1, N'Celebration', CAST(N'2025-01-03 15:07:46.2574667' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (4, N'Gandhi Jayanti', 0, N'Celebration', CAST(N'2025-01-03 15:08:04.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (5, N'Buddha Purnima', 1, N'Festivals', CAST(N'2025-01-03 15:08:23.9939721' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (6, N'Christmas', 1, N'Festivals', CAST(N'2025-01-03 15:08:34.5891809' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (7, N'Diwali', 1, N'Festivals', CAST(N'2025-01-03 15:11:06.7268081' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (11, N'Monuments', 1, N'Heritage', CAST(N'2025-01-03 15:12:08.5673367' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (12, N'Music & Dance', 1, N'Heritage', CAST(N'2025-01-03 15:12:19.7830578' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (13, N'Delhi High Court', 1, N'Ministry', CAST(N'2025-01-03 15:12:44.3581915' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (14, N'Electronics & IT', 0, N'Ministry', CAST(N'2025-01-03 15:12:58.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (15, N'Food Processing Industries', 0, N'Ministry', CAST(N'2025-01-03 15:13:10.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (16, N'Telecommunications', 1, N'Ministry', CAST(N'2025-01-03 15:13:21.9894924' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (18, N'Cities/Countryside', 1, N'Glimpses of VietNam', CAST(N'2025-01-05 15:22:10.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (19, N'Modern India', 1, N'Glimpses of VietNam', CAST(N'2025-01-05 23:43:58.4656251' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (20, N'Nature', 0, N'Glimpses of VietNam', CAST(N'2025-01-05 23:44:10.0000000' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (21, N'Birthday', 1, N'MISCELLANEOUS', CAST(N'2025-01-05 23:44:44.5199606' AS DateTime2))
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Status], [ParentCategory], [CreationDate]) VALUES (22, N'Congratulations', 1, N'MISCELLANEOUS', CAST(N'2025-01-05 23:44:56.6037929' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (1, N'The colors and design of egreetings are very impressive.', CAST(N'2025-01-06 14:59:26.8411996' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (2, N'I''m very impressed with the speed of sending emails on egreetings, it''s fast and efficient.', CAST(N'2025-01-07 14:31:43.2353082' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (3, N'egreetings has a very user-friendly and convenient interface', CAST(N'2025-01-07 14:31:53.6549740' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (4, N'This website is truly a great choice for sending emails.', CAST(N'2025-01-07 14:32:43.2350960' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (5, N'egreetings helps me send emails quickly without any hassle.', CAST(N'2025-01-07 14:33:05.1207763' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (6, N'The interface of egreetings is attractive and very easy to use', CAST(N'2025-01-07 14:33:15.2399103' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (7, N'egreetings is really smooth and visually pleasing.', CAST(N'2025-01-07 14:33:25.3861164' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (8, N'I can''t believe sending emails on egreetings is that fast!', CAST(N'2025-01-07 14:33:36.0130642' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (9, N'The intuitive and easy-to-use interface of egreetings is very appealing', CAST(N'2025-01-07 14:34:00.9657214' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (10, N'I love how egreetings works, sending emails takes only seconds.', CAST(N'2025-01-07 14:34:25.6354292' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (11, N'Stunning graphics and the processing speed of egreetings makes me very satisfied', CAST(N'2025-01-07 14:34:54.9898412' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (12, N'egreetings works very efficiently, the interface is very appealing', CAST(N'2025-01-07 14:35:22.2814643' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (13, N'I love this site because sending emails is super fast.', CAST(N'2025-01-07 14:35:33.6461509' AS DateTime2), 3)
INSERT [dbo].[Feedbacks] ([FeedbackId], [Content], [CreationDate], [AccountId]) VALUES (14, N'egreetings is absolutely amazing! Beautiful and smooth interface.', CAST(N'2025-01-07 14:35:47.0759822' AS DateTime2), 3)
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (1, N'np25090410@gmail.com', 1, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (2, N'user@gmail.com', 2, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (3, N'user1@gmail.com', 3, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (4, N'user2@gmail.com', 4, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (5, N'user3@gmail.com', 4, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (6, N'user4@gmail.com', 4, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (7, N'user5@gmail.com', 5, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (8, N'user6@gmail.com', 5, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (9, N'user7@gmail.com', 5, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (10, N'user8@gmail.com', 5, 1)
INSERT [dbo].[TransactionDetails] ([TransactionDetailId], [DestinationEmail], [TransactionId], [Status]) VALUES (11, N'user9@gmail.com', 6, 1)
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (1, N'Amberkar_1 (1).png', CAST(N'2025-01-06 14:22:16.7695844' AS DateTime2), 1, 1, 1)
INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (2, N'20200410_0950485.jpg', CAST(N'2025-01-07 14:36:36.6783647' AS DateTime2), 1, 3, 87)
INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (3, N'20200409_1206435.jpg', CAST(N'2025-01-07 14:37:10.9655495' AS DateTime2), 1, 3, 88)
INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (4, N'26Jan_Long_7.jpg', CAST(N'2025-01-07 14:37:43.8993393' AS DateTime2), 1, 3, 96)
INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (5, N'20200219_1039131.jpg', CAST(N'2025-01-07 14:39:34.1857918' AS DateTime2), 1, 3, 98)
INSERT [dbo].[Transactions] ([TransactionId], [Image], [CreationDate], [Success], [AccountId], [CardId]) VALUES (6, N'20200219_1039131.jpg', CAST(N'2025-01-07 14:40:33.6970730' AS DateTime2), 1, 3, 98)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
/****** Object:  Index [IX_Cards_CategoryId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cards_CategoryId] ON [dbo].[Cards]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Feedbacks_AccountId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Feedbacks_AccountId] ON [dbo].[Feedbacks]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subcribes_AccountId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Subcribes_AccountId] ON [dbo].[Subcribes]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TransactionDetails_TransactionId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_TransactionDetails_TransactionId] ON [dbo].[TransactionDetails]
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_AccountId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_AccountId] ON [dbo].[Transactions]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_CardId]    Script Date: 1/7/2025 2:56:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_CardId] ON [dbo].[Transactions]
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Subcribes]  WITH CHECK ADD  CONSTRAINT [FK_Subcribes_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subcribes] CHECK CONSTRAINT [FK_Subcribes_Accounts_AccountId]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetails_Transactions_TransactionId] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transactions] ([TransactionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionDetails] CHECK CONSTRAINT [FK_TransactionDetails_Transactions_TransactionId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Cards_CardId] FOREIGN KEY([CardId])
REFERENCES [dbo].[Cards] ([CardId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Cards_CardId]
GO
USE [master]
GO
ALTER DATABASE [DB_EProject_Sem3] SET  READ_WRITE 
GO
