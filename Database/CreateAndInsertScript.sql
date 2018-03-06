USE [carpool]
GO
ALTER TABLE [dbo].[user_usr] DROP CONSTRAINT [fk_user_address]
GO
ALTER TABLE [dbo].[trip_tri] DROP CONSTRAINT [fk_trip_address]
GO
ALTER TABLE [dbo].[message_mes] DROP CONSTRAINT [fr_message_user_receiver]
GO
ALTER TABLE [dbo].[message_mes] DROP CONSTRAINT [fk_message_user_sender]
GO
ALTER TABLE [dbo].[joins_joi] DROP CONSTRAINT [fk_joins_user]
GO
ALTER TABLE [dbo].[joins_joi] DROP CONSTRAINT [fk_joins_trip]
GO
ALTER TABLE [dbo].[is_friend_ifr] DROP CONSTRAINT [fk_is_friend_user_to]
GO
ALTER TABLE [dbo].[is_friend_ifr] DROP CONSTRAINT [fk_is_friend_user_from]
GO
ALTER TABLE [dbo].[city_cit] DROP CONSTRAINT [fk_city_country]
GO
ALTER TABLE [dbo].[address_add] DROP CONSTRAINT [fk_address_city]
GO
/****** Object:  Index [UQ__user_usr__98BFCA3A3D1A1AC7]    Script Date: 06/03/2018 22:24:23 ******/
ALTER TABLE [dbo].[user_usr] DROP CONSTRAINT [UQ__user_usr__98BFCA3A3D1A1AC7]
GO
/****** Object:  Table [dbo].[user_usr]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[user_usr]
GO
/****** Object:  Table [dbo].[trip_tri]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[trip_tri]
GO
/****** Object:  Table [dbo].[message_mes]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[message_mes]
GO
/****** Object:  Table [dbo].[joins_joi]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[joins_joi]
GO
/****** Object:  Table [dbo].[is_friend_ifr]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[is_friend_ifr]
GO
/****** Object:  Table [dbo].[country_cou]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[country_cou]
GO
/****** Object:  Table [dbo].[city_cit]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[city_cit]
GO
/****** Object:  Table [dbo].[address_add]    Script Date: 06/03/2018 22:24:23 ******/
DROP TABLE [dbo].[address_add]
GO
USE [master]
GO
/****** Object:  Database [carpool]    Script Date: 06/03/2018 22:24:23 ******/
DROP DATABASE [carpool]
GO
/****** Object:  Database [carpool]    Script Date: 06/03/2018 22:24:23 ******/
CREATE DATABASE [carpool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'carpool', FILENAME = N'D:\Programmes\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\carpool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'carpool_log', FILENAME = N'D:\Programmes\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\carpool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [carpool] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [carpool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [carpool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [carpool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [carpool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [carpool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [carpool] SET ARITHABORT OFF 
GO
ALTER DATABASE [carpool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [carpool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [carpool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [carpool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [carpool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [carpool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [carpool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [carpool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [carpool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [carpool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [carpool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [carpool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [carpool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [carpool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [carpool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [carpool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [carpool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [carpool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [carpool] SET  MULTI_USER 
GO
ALTER DATABASE [carpool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [carpool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [carpool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [carpool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [carpool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [carpool] SET QUERY_STORE = OFF
GO
USE [carpool]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [carpool]
GO
/****** Object:  Table [dbo].[address_add]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address_add](
	[add_id] [int] IDENTITY(1,1) NOT NULL,
	[add_address_line_1] [varchar](250) NOT NULL,
	[add_address_line_2] [varchar](250) NULL,
	[add_postal_code] [varchar](20) NOT NULL,
	[add_latitude] [varchar](200) NULL,
	[add_longitude] [varchar](200) NULL,
	[add_cit_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city_cit]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city_cit](
	[cit_id] [int] IDENTITY(1,1) NOT NULL,
	[cit_name] [varchar](200) NOT NULL,
	[cit_cou_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country_cou]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_cou](
	[cou_id] [int] IDENTITY(1,1) NOT NULL,
	[cou_name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is_friend_ifr]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is_friend_ifr](
	[ifr_id] [int] IDENTITY(1,1) NOT NULL,
	[ifr_from_usr_id] [int] NOT NULL,
	[ifr_to_usr_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ifr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[joins_joi]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[joins_joi](
	[joi_id] [int] IDENTITY(1,1) NOT NULL,
	[joi_date] [datetime2](7) NOT NULL,
	[joi_usr_id] [int] NOT NULL,
	[joi_tri_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[joi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message_mes]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_mes](
	[mes_id] [int] IDENTITY(1,1) NOT NULL,
	[mes_subject] [varchar](200) NOT NULL,
	[mes_content] [varchar](1000) NOT NULL,
	[mes_is_answer] [bit] NOT NULL,
	[mes_sender_usr_id] [int] NOT NULL,
	[mes_receiver_usr_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip_tri]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_tri](
	[tri_id] [int] IDENTITY(1,1) NOT NULL,
	[tri_number_of_places] [int] NOT NULL,
	[tri_price] [numeric](5, 2) NOT NULL,
	[tri_is_routine] [bit] NOT NULL,
	[tri_period] [numeric](3, 2) NULL,
	[tri_beginning] [datetime2](7) NOT NULL,
	[tri_closing] [datetime2](7) NOT NULL,
	[tri_duration] [int] NOT NULL,
	[tri_add_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_usr]    Script Date: 06/03/2018 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_usr](
	[usr_id] [int] IDENTITY(1,1) NOT NULL,
	[usr_user_name] [varchar](100) NOT NULL,
	[usr_password] [varchar](100) NOT NULL,
	[usr_first_name] [varchar](100) NOT NULL,
	[usr_last_name] [varchar](100) NOT NULL,
	[usr_email] [varchar](100) NOT NULL,
	[usr_phone_number] [varchar](20) NOT NULL,
	[usr_add_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address_add] ON 

INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (1, N'35 Storie street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2, N'37 Storie street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (3, N'aze', NULL, N'aze', NULL, NULL, 10)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (4, N'35 Storie street', N'31L6', N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (5, N'131 Gregory street', NULL, N'PA22PA', NULL, NULL, 11)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (1002, N'aze', NULL, N'aze', NULL, NULL, 1009)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (1003, N'ConnectionTry2', NULL, N'ConnectionTry2', NULL, NULL, 1010)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2002, N'35 starrie street', NULL, N'PA12AP', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[address_add] OFF
SET IDENTITY_INSERT [dbo].[city_cit] ON 

INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (1, N'Paisley', 1)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (2, N'Glasgow', 1)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (3, N'London', 1)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (4, N'Paris', 2)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (5, N'Berlin', 3)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (6, N'Bruxelles', 4)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (7, N'Roma', 5)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (8, N'Madrid', 2)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (10, N'Annecy', 2)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (11, N'Manchester', 5)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (1009, N'aze', 1)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (1010, N'ConnectionTry2', 1)
SET IDENTITY_INSERT [dbo].[city_cit] OFF
SET IDENTITY_INSERT [dbo].[country_cou] ON 

INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (1, N'United-Kingdom')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (2, N'France')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (3, N'Germany')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (4, N'Belgium')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (5, N'Italy')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (6, N'Spain')
SET IDENTITY_INSERT [dbo].[country_cou] OFF
SET IDENTITY_INSERT [dbo].[user_usr] ON 

INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1, N'Dyanek', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Nath', N'Omnes', N'nath@gmail.com', N'0033541254', 4)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2, N'Dyanek2', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Nathanaël', N'Omnes', N'nath2@gmail.com', N'01234567890', 5)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1002, N'TryConnect', N'38768b2dcdfcf8c79a207cb61154fa7b8a1ac2d369b04e6ca54c6bd0d10653fc', N'AZe', N'aze', N'tyConnect@gmail.com', N'aze', 1002)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1003, N'ConnectionTry2', N'c741c53870292f2ee92a85aec89cea97c6c8ffd2e5c17e1eaf980e148eee7063', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2@gmail.com', N'ConnectionTry2', 1003)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1004, N'ConnectionTry3', N'8a6ede1c752f8237fa5510937f71d1355b4ed379ea1318e48b167d4beb559bd3', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2', 1003)
SET IDENTITY_INSERT [dbo].[user_usr] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user_usr__98BFCA3A3D1A1AC7]    Script Date: 06/03/2018 22:24:24 ******/
ALTER TABLE [dbo].[user_usr] ADD UNIQUE NONCLUSTERED 
(
	[usr_user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address_add]  WITH CHECK ADD  CONSTRAINT [fk_address_city] FOREIGN KEY([add_cit_id])
REFERENCES [dbo].[city_cit] ([cit_id])
GO
ALTER TABLE [dbo].[address_add] CHECK CONSTRAINT [fk_address_city]
GO
ALTER TABLE [dbo].[city_cit]  WITH CHECK ADD  CONSTRAINT [fk_city_country] FOREIGN KEY([cit_cou_id])
REFERENCES [dbo].[country_cou] ([cou_id])
GO
ALTER TABLE [dbo].[city_cit] CHECK CONSTRAINT [fk_city_country]
GO
ALTER TABLE [dbo].[is_friend_ifr]  WITH CHECK ADD  CONSTRAINT [fk_is_friend_user_from] FOREIGN KEY([ifr_from_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[is_friend_ifr] CHECK CONSTRAINT [fk_is_friend_user_from]
GO
ALTER TABLE [dbo].[is_friend_ifr]  WITH CHECK ADD  CONSTRAINT [fk_is_friend_user_to] FOREIGN KEY([ifr_to_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[is_friend_ifr] CHECK CONSTRAINT [fk_is_friend_user_to]
GO
ALTER TABLE [dbo].[joins_joi]  WITH CHECK ADD  CONSTRAINT [fk_joins_trip] FOREIGN KEY([joi_tri_id])
REFERENCES [dbo].[trip_tri] ([tri_id])
GO
ALTER TABLE [dbo].[joins_joi] CHECK CONSTRAINT [fk_joins_trip]
GO
ALTER TABLE [dbo].[joins_joi]  WITH CHECK ADD  CONSTRAINT [fk_joins_user] FOREIGN KEY([joi_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[joins_joi] CHECK CONSTRAINT [fk_joins_user]
GO
ALTER TABLE [dbo].[message_mes]  WITH CHECK ADD  CONSTRAINT [fk_message_user_sender] FOREIGN KEY([mes_sender_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[message_mes] CHECK CONSTRAINT [fk_message_user_sender]
GO
ALTER TABLE [dbo].[message_mes]  WITH CHECK ADD  CONSTRAINT [fr_message_user_receiver] FOREIGN KEY([mes_receiver_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[message_mes] CHECK CONSTRAINT [fr_message_user_receiver]
GO
ALTER TABLE [dbo].[trip_tri]  WITH CHECK ADD  CONSTRAINT [fk_trip_address] FOREIGN KEY([tri_add_id])
REFERENCES [dbo].[address_add] ([add_id])
GO
ALTER TABLE [dbo].[trip_tri] CHECK CONSTRAINT [fk_trip_address]
GO
ALTER TABLE [dbo].[user_usr]  WITH CHECK ADD  CONSTRAINT [fk_user_address] FOREIGN KEY([usr_add_id])
REFERENCES [dbo].[address_add] ([add_id])
GO
ALTER TABLE [dbo].[user_usr] CHECK CONSTRAINT [fk_user_address]
GO
USE [master]
GO
ALTER DATABASE [carpool] SET  READ_WRITE 
GO
