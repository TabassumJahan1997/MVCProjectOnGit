USE [master]
GO
/****** Object:  Database [MasterDetail_AircraftDb]    Script Date: 2/8/2023 10:53:27 PM ******/
CREATE DATABASE [MasterDetail_AircraftDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterDetail_AircraftDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MasterDetail_AircraftDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterDetail_AircraftDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MasterDetail_AircraftDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterDetail_AircraftDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET RECOVERY FULL 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET  MULTI_USER 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MasterDetail_AircraftDb', N'ON'
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET QUERY_STORE = OFF
GO
USE [MasterDetail_AircraftDb]
GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 2/8/2023 10:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[AircraftId] [int] IDENTITY(1,1) NOT NULL,
	[AircraftName] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[Available] [bit] NOT NULL,
	[AircraftTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AircraftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AircraftEntry]    Script Date: 2/8/2023 10:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AircraftEntry](
	[AircraftEntryId] [int] IDENTITY(1,1) NOT NULL,
	[ModelNo] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](200) NULL,
	[NoOfEngine] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AircraftEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AircraftType]    Script Date: 2/8/2023 10:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AircraftType](
	[AircraftTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AircraftTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntryAircrafts]    Script Date: 2/8/2023 10:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryAircrafts](
	[EntryAircraftsId] [int] IDENTITY(1,1) NOT NULL,
	[AircraftEntryId] [int] NOT NULL,
	[AircraftId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AircraftEntryId] ASC,
	[AircraftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aircraft] ON 

INSERT [dbo].[Aircraft] ([AircraftId], [AircraftName], [Price], [Available], [AircraftTypeId]) VALUES (1, N'Mig-29', 20000000.0000, 1, 1)
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftName], [Price], [Available], [AircraftTypeId]) VALUES (2, N'L-452', 25000000.0000, 1, 2)
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftName], [Price], [Available], [AircraftTypeId]) VALUES (3, N'F-540', 60200000.0000, 1, 2)
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftName], [Price], [Available], [AircraftTypeId]) VALUES (4, N'M-745', 50000000.0000, 0, 1)
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftName], [Price], [Available], [AircraftTypeId]) VALUES (5, N'L-90', 74000000.0000, 0, 1)
SET IDENTITY_INSERT [dbo].[Aircraft] OFF
GO
SET IDENTITY_INSERT [dbo].[AircraftEntry] ON 

INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (1, N'j-20', N'191e0f1d-1e49-40dc-9ef0-f48a4a218623.jpeg', 2, CAST(N'2020-02-02' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (2, N'AUTONOV', N'c75fbf50-9b61-4d11-96db-91859d3f7fb5.jpeg', 3, CAST(N'2021-02-03' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (3, N'L40', N'6b92b566-ea71-4f9f-ae67-76cd336b8ee3.jpeg', 2, CAST(N'2021-12-12' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (4, N'FIREFIGHTER', N'374bce3d-e61f-46c5-a394-f7f409396497.jpeg', 3, CAST(N'2021-12-11' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (5, N'FIREFIGHTER', N'7927d4be-d2e1-4af5-b383-1e749ac24c08.jpeg', 3, CAST(N'2021-12-11' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (6, N'AREAL-09', N'b2cfd4c1-f4e3-48f0-993f-5a16ded91ad4.jpeg', 4, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[AircraftEntry] ([AircraftEntryId], [ModelNo], [ImagePath], [NoOfEngine], [ProductionDate]) VALUES (7, N'AR_209', N'1b0b3c96-9d01-44be-b5f7-771fd5e2a5a5.jpeg', 2, CAST(N'2022-01-03' AS Date))
SET IDENTITY_INSERT [dbo].[AircraftEntry] OFF
GO
SET IDENTITY_INSERT [dbo].[AircraftType] ON 

INSERT [dbo].[AircraftType] ([AircraftTypeId], [TypeName]) VALUES (1, N'Combat Aircraft')
INSERT [dbo].[AircraftType] ([AircraftTypeId], [TypeName]) VALUES (2, N'Transport Aircraft')
INSERT [dbo].[AircraftType] ([AircraftTypeId], [TypeName]) VALUES (3, N'Trainer Aircraft')
SET IDENTITY_INSERT [dbo].[AircraftType] OFF
GO
SET IDENTITY_INSERT [dbo].[EntryAircrafts] ON 

INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (1, 1, 1)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (2, 2, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (3, 3, 1)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (4, 3, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (5, 4, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (7, 4, 3)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (9, 4, 4)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (6, 5, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (8, 5, 3)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (10, 5, 4)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (11, 6, 1)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (12, 6, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (13, 6, 3)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (14, 7, 1)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (15, 7, 2)
INSERT [dbo].[EntryAircrafts] ([EntryAircraftsId], [AircraftEntryId], [AircraftId]) VALUES (16, 7, 5)
SET IDENTITY_INSERT [dbo].[EntryAircrafts] OFF
GO
ALTER TABLE [dbo].[Aircraft]  WITH CHECK ADD FOREIGN KEY([AircraftTypeId])
REFERENCES [dbo].[AircraftType] ([AircraftTypeId])
GO
ALTER TABLE [dbo].[EntryAircrafts]  WITH CHECK ADD FOREIGN KEY([AircraftEntryId])
REFERENCES [dbo].[AircraftEntry] ([AircraftEntryId])
GO
ALTER TABLE [dbo].[EntryAircrafts]  WITH CHECK ADD FOREIGN KEY([AircraftId])
REFERENCES [dbo].[Aircraft] ([AircraftId])
GO
USE [master]
GO
ALTER DATABASE [MasterDetail_AircraftDb] SET  READ_WRITE 
GO
