USE [master]
GO
/****** Object:  Database [MidTerm_4228]    Script Date: 28.10.2020 18:50:56 ******/
CREATE DATABASE [MidTerm_4228]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MidTerm_4228', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MidTerm_4228.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MidTerm_4228_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MidTerm_4228_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MidTerm_4228] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MidTerm_4228].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MidTerm_4228] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MidTerm_4228] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MidTerm_4228] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MidTerm_4228] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MidTerm_4228] SET ARITHABORT OFF 
GO
ALTER DATABASE [MidTerm_4228] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MidTerm_4228] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MidTerm_4228] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MidTerm_4228] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MidTerm_4228] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MidTerm_4228] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MidTerm_4228] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MidTerm_4228] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MidTerm_4228] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MidTerm_4228] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MidTerm_4228] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MidTerm_4228] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MidTerm_4228] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MidTerm_4228] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MidTerm_4228] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MidTerm_4228] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MidTerm_4228] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MidTerm_4228] SET RECOVERY FULL 
GO
ALTER DATABASE [MidTerm_4228] SET  MULTI_USER 
GO
ALTER DATABASE [MidTerm_4228] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MidTerm_4228] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MidTerm_4228] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MidTerm_4228] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MidTerm_4228] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MidTerm_4228', N'ON'
GO
ALTER DATABASE [MidTerm_4228] SET QUERY_STORE = OFF
GO
USE [MidTerm_4228]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[vehicle] [int] NOT NULL,
	[ScheduleId] [int] NULL,
	[fleet_Id] [int] NULL,
	[last_main] [datetime] NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[vehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[id] [int] NOT NULL,
	[BusVehicle] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[employ_Date] [datetime] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driverStat]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driverStat](
	[id_stat] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[opis] [text] NULL,
	[vreme] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[id] [int] NOT NULL,
	[fare] [int] NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteStop]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStop](
	[id] [int] NOT NULL,
	[RouteId] [int] NOT NULL,
	[StopId] [int] NOT NULL,
 CONSTRAINT [PK_RouteStop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id] [int] NOT NULL,
	[RouteId] [int] NULL,
	[departure] [datetime] NULL,
	[arrival] [datetime] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stop]    Script Date: 28.10.2020 18:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stop](
	[id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Terminus] [nvarchar](max) NULL,
 CONSTRAINT [PK_Stop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (2, 1, 1, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (3, 1, 1, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (4, 2, 2, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (5, 3, 3, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (6, 4, 4, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (7, 5, 5, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (8, 6, 6, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (9, 7, 14, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (10, 8, 4, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (11, 9, 5, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (12, 10, 52, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (13, 11, 52, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (14, 12, 4, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (15, 13, 4, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (17, 11, 58, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (18, 10, 8, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (19, 9, 1, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (20, 8, 42, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (21, 7, 25, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (22, 6, 252, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (23, 5, 52, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (24, 4, 5, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (25, 3, 452, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (26, 2, 2, NULL)
INSERT [dbo].[Bus] ([vehicle], [ScheduleId], [fleet_Id], [last_main]) VALUES (27, 1, 245, NULL)
GO
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (6, 2, N'Driver 19', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (7, 2, N'Driver 12', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (8, 3, N'Driver 13', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (10, 4, N'Driver 14', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (11, 5, N'Driver 15', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (12, 6, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (13, 7, N'Driver 15', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (14, 8, N'Driver 17', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (15, 9, N'Driver 6', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (16, 10, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (17, 11, N'Driver 14', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (18, 12, N'9', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (19, 13, N'Driver 10', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (20, 14, N'Driver 13', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (21, 15, N'Driver 1y', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (23, 14, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (24, 13, N'Driver 13', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (25, 12, N'Driver 14', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (26, 11, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (27, 10, N'Driver 17', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (28, 9, N'Driver 19', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (29, 8, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (30, 7, N'Driver 9', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (31, 6, N'Driver 1', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (32, 5, N'Driver 19', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (33, 4, N'Driver 16', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (34, 3, N'Driver 15', NULL)
INSERT [dbo].[Driver] ([id], [BusVehicle], [Name], [employ_Date]) VALUES (35, 2, N'Driver 17', NULL)
GO
INSERT [dbo].[Route] ([id], [fare]) VALUES (1, 10)
INSERT [dbo].[Route] ([id], [fare]) VALUES (2, 8)
INSERT [dbo].[Route] ([id], [fare]) VALUES (3, 7)
INSERT [dbo].[Route] ([id], [fare]) VALUES (4, 11)
INSERT [dbo].[Route] ([id], [fare]) VALUES (5, 10)
INSERT [dbo].[Route] ([id], [fare]) VALUES (6, 21)
INSERT [dbo].[Route] ([id], [fare]) VALUES (7, 12)
INSERT [dbo].[Route] ([id], [fare]) VALUES (8, 11)
INSERT [dbo].[Route] ([id], [fare]) VALUES (9, 3)
INSERT [dbo].[Route] ([id], [fare]) VALUES (10, 4)
INSERT [dbo].[Route] ([id], [fare]) VALUES (11, 5)
INSERT [dbo].[Route] ([id], [fare]) VALUES (12, 6)
INSERT [dbo].[Route] ([id], [fare]) VALUES (13, 6)
GO
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (1, 1, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (2, 1, 2)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (3, 1, 3)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (4, 2, 4)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (5, 2, 5)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (6, 2, 6)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (7, 3, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (8, 3, 7)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (9, 3, 8)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (10, 3, 9)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (11, 4, 10)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (12, 4, 11)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (14, 5, 11)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (15, 5, 10)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (17, 5, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (18, 5, 2)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (19, 6, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (20, 6, 6)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (21, 6, 7)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (23, 7, 11)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (24, 7, 3)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (25, 7, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (26, 7, 6)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (27, 8, 5)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (28, 8, 4)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (29, 8, 3)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (30, 9, 10)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (31, 9, 4)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (32, 9, 5)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (34, 10, 2)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (35, 10, 5)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (36, 10, 8)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (37, 11, 10)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (38, 11, 7)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (39, 11, 6)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (40, 11, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (41, 12, 1)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (42, 12, 4)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (43, 12, 7)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (44, 12, 9)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (45, 13, 11)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (46, 13, 5)
INSERT [dbo].[RouteStop] ([id], [RouteId], [StopId]) VALUES (47, 13, 9)
GO
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (1, 1, CAST(N'2015-10-26T10:00:00.000' AS DateTime), CAST(N'2015-10-26T13:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (2, 2, CAST(N'2015-10-26T10:30:00.000' AS DateTime), CAST(N'2015-10-26T13:30:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (3, 3, CAST(N'2015-10-26T11:00:00.000' AS DateTime), CAST(N'2015-10-26T14:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (4, 4, CAST(N'2015-10-27T11:00:00.000' AS DateTime), CAST(N'2015-10-27T14:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (5, 5, CAST(N'2015-10-27T10:30:00.000' AS DateTime), CAST(N'2015-10-27T13:30:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (6, 6, CAST(N'2015-10-27T10:00:00.000' AS DateTime), CAST(N'2015-10-27T13:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (7, 7, CAST(N'2015-10-28T11:00:00.000' AS DateTime), CAST(N'2015-10-28T14:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (8, 8, CAST(N'2015-10-28T10:00:00.000' AS DateTime), CAST(N'2015-10-28T13:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (9, 9, CAST(N'2015-10-28T10:30:00.000' AS DateTime), CAST(N'2015-10-28T13:30:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (10, 10, CAST(N'2015-10-29T10:30:00.000' AS DateTime), CAST(N'2015-10-29T13:30:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (11, 11, CAST(N'2015-10-29T10:00:00.000' AS DateTime), CAST(N'2015-10-29T13:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (12, 12, CAST(N'2015-10-29T11:00:00.000' AS DateTime), CAST(N'2015-10-29T14:00:00.000' AS DateTime))
INSERT [dbo].[Schedule] ([id], [RouteId], [departure], [arrival]) VALUES (13, 13, CAST(N'2015-10-30T10:30:00.000' AS DateTime), CAST(N'2015-10-30T13:30:00.000' AS DateTime))
GO
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (1, N'Stop1', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (2, N'Stop2', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (3, N'Stop3', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (4, N'stop4', N'1')
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (5, N'stop5', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (6, N'stop6', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (7, N'stop7', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (8, N'stop8', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (9, N'stop9', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (10, N'stop10', NULL)
INSERT [dbo].[Stop] ([id], [Name], [Terminus]) VALUES (11, N'stop0', N'1')
GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([id])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Schedule]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([id])
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Route]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Stop] FOREIGN KEY([StopId])
REFERENCES [dbo].[Stop] ([id])
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Stop]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Route] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Route] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Route]
GO
USE [master]
GO
ALTER DATABASE [MidTerm_4228] SET  READ_WRITE 
GO
