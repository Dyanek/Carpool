USE [carpool]
GO
/****** Object:  Table [dbo].[address_add]    Script Date: 22/03/2018 11:35:41 ******/
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
/****** Object:  Table [dbo].[city_cit]    Script Date: 22/03/2018 11:35:42 ******/
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
/****** Object:  Table [dbo].[country_cou]    Script Date: 22/03/2018 11:35:42 ******/
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
/****** Object:  Table [dbo].[is_friend_ifr]    Script Date: 22/03/2018 11:35:42 ******/
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
/****** Object:  Table [dbo].[joins_joi]    Script Date: 22/03/2018 11:35:42 ******/
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
/****** Object:  Table [dbo].[message_mes]    Script Date: 22/03/2018 11:35:42 ******/
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
/****** Object:  Table [dbo].[trip_tri]    Script Date: 22/03/2018 11:35:42 ******/
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
	[tri_usr_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_usr]    Script Date: 22/03/2018 11:35:42 ******/
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
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2003, N'35 starrie street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2004, N'25 road of the Tourte', N'Morisson''s', N'PA13BE', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2005, N'35 starrie street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2006, N'35 starrie street', NULL, N'PA12AP', NULL, NULL, 2009)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2007, N'85 Hogwart street', NULL, N'GL11LG', NULL, NULL, 2)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2008, N'35 starrie street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2009, N'38 Hogwart street', NULL, N'GL12LG', NULL, NULL, 2)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2010, N'25 bladi avenue', NULL, N'LO55OL', NULL, NULL, 5)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2011, N'15 gada street', NULL, N'74000', NULL, NULL, 10)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2012, N'12 dnbb stroot', NULL, N'PB33BG', NULL, NULL, 3)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2013, N'25 road of the infinity', N'3rd bat', N'75012', NULL, NULL, 4)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2014, N'1 rue de la pagole', NULL, N'74000', NULL, NULL, 10)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2016, N'39 route de la mouette', NULL, N'73000', NULL, NULL, 2011)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2017, N'9 street of the line', N'3rd floor', N'GL2 5PG', NULL, NULL, 2)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2018, N'08 Laca street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2019, N'08 Laca street', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2020, N'aze', NULL, N'aze', NULL, NULL, 1009)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2021, N'9 road street', N'3rd Building', N'PG11GP', NULL, NULL, 2012)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2022, N'9 locacoa avenue', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2023, N'9 road street', NULL, N'PG11GP', NULL, NULL, 2012)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2024, N'2 street of the try', NULL, N'PA12AP', NULL, NULL, 1)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2025, N'85 Hogwart street', NULL, N'GL12LG', NULL, NULL, 2)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2026, N'Road of the jackky', N'2nd floor', N'GL33UP', NULL, NULL, 2)
INSERT [dbo].[address_add] ([add_id], [add_address_line_1], [add_address_line_2], [add_postal_code], [add_latitude], [add_longitude], [add_cit_id]) VALUES (2027, N'85 Hogwart street', NULL, N'GL12LG', NULL, NULL, 1)
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
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (2009, N'Paisley', 1)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (2011, N'Chambéry', 2)
INSERT [dbo].[city_cit] ([cit_id], [cit_name], [cit_cou_id]) VALUES (2012, N'Manchester', 1)
SET IDENTITY_INSERT [dbo].[city_cit] OFF
SET IDENTITY_INSERT [dbo].[country_cou] ON 

INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (1, N'United-Kingdom')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (2, N'France')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (3, N'Germany')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (4, N'Belgium')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (5, N'Italy')
INSERT [dbo].[country_cou] ([cou_id], [cou_name]) VALUES (6, N'Spain')
SET IDENTITY_INSERT [dbo].[country_cou] OFF
SET IDENTITY_INSERT [dbo].[joins_joi] ON 

INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (3, CAST(N'2018-03-10T14:59:21.9000694' AS DateTime2), 1, 4)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (4, CAST(N'2018-03-10T15:00:04.0312862' AS DateTime2), 1, 5)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (5, CAST(N'2018-03-10T15:01:00.5196113' AS DateTime2), 2, 6)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (6, CAST(N'2018-03-10T15:01:36.1188784' AS DateTime2), 2, 7)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (17, CAST(N'2018-03-15T14:03:44.0041300' AS DateTime2), 1, 9)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (18, CAST(N'2018-03-15T14:04:07.3129764' AS DateTime2), 2, 9)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (26, CAST(N'2018-03-19T12:05:55.9019856' AS DateTime2), 2004, 5)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (27, CAST(N'2018-03-19T12:06:31.9123711' AS DateTime2), 2, 5)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (28, CAST(N'2018-03-19T12:19:25.4573614' AS DateTime2), 1, 13)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (31, CAST(N'2018-03-19T12:26:10.3160180' AS DateTime2), 2005, 14)
INSERT [dbo].[joins_joi] ([joi_id], [joi_date], [joi_usr_id], [joi_tri_id]) VALUES (32, CAST(N'2018-03-19T12:26:20.2661237' AS DateTime2), 1, 14)
SET IDENTITY_INSERT [dbo].[joins_joi] OFF
SET IDENTITY_INSERT [dbo].[trip_tri] ON 

INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (4, 4, CAST(2.25 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-04-05T16:00:00.0000000' AS DateTime2), CAST(N'2018-04-05T15:00:00.0000000' AS DateTime2), 120, 2002, 1)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (5, 3, CAST(5.00 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-04-05T16:00:00.0000000' AS DateTime2), CAST(N'2018-04-05T15:00:00.0000000' AS DateTime2), 120, 2009, 1)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (6, 5, CAST(4.45 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-04-05T16:00:00.0000000' AS DateTime2), CAST(N'2018-04-05T15:00:00.0000000' AS DateTime2), 35, 2010, 2)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (7, 4, CAST(2.00 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-03-16T15:15:00.0000000' AS DateTime2), CAST(N'2018-04-05T15:00:00.0000000' AS DateTime2), 60, 2011, 2)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (9, 4, CAST(5.75 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-03-20T20:00:00.0000000' AS DateTime2), CAST(N'2018-03-20T15:00:00.0000000' AS DateTime2), 180, 2013, 1)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (13, 2, CAST(2.25 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-03-23T15:00:00.0000000' AS DateTime2), CAST(N'2018-03-23T14:00:00.0000000' AS DateTime2), 60, 2024, 1)
INSERT [dbo].[trip_tri] ([tri_id], [tri_number_of_places], [tri_price], [tri_is_routine], [tri_period], [tri_beginning], [tri_closing], [tri_duration], [tri_add_id], [tri_usr_id]) VALUES (14, 2, CAST(2.25 AS Numeric(5, 2)), 0, NULL, CAST(N'2018-03-30T15:00:00.0000000' AS DateTime2), CAST(N'2018-03-30T14:30:00.0000000' AS DateTime2), 120, 2026, 2005)
SET IDENTITY_INSERT [dbo].[trip_tri] OFF
SET IDENTITY_INSERT [dbo].[user_usr] ON 

INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1, N'Dyanek', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Nath', N'Omnes', N'nath@gmail.com', N'9876543210', 2016)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2, N'Dyanek2', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Bob', N'Razovski', N'bobrazo@gmail.com', N'01234567890', 5)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1002, N'TryConnect', N'38768b2dcdfcf8c79a207cb61154fa7b8a1ac2d369b04e6ca54c6bd0d10653fc', N'AZe', N'aze', N'tyConnect@gmail.com', N'aze', 1002)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1003, N'ConnectionTry2', N'c741c53870292f2ee92a85aec89cea97c6c8ffd2e5c17e1eaf980e148eee7063', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2@gmail.com', N'ConnectionTry2', 1003)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (1004, N'ConnectionTry3', N'8a6ede1c752f8237fa5510937f71d1355b4ed379ea1318e48b167d4beb559bd3', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2', N'ConnectionTry2', 1003)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2002, N'TestUser', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Bobby', N'Miller', N'bobby.miller@gmail.com', N'0123456789', 2017)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2003, N'Dyanek3', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'aze', N'aze', N'aze', N'aze', 1002)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2004, N'ILikeTrains', N'b221bf17bde0cc7ab86c92e8a707b126a7d8ba0dbc6d582ef02bcad8f9394ef5', N'Boba', N'Boboo', N'boboo@gmail.com', N'0123456789', 2023)
INSERT [dbo].[user_usr] ([usr_id], [usr_user_name], [usr_password], [usr_first_name], [usr_last_name], [usr_email], [usr_phone_number], [usr_add_id]) VALUES (2005, N'TestUser3', N'31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66', N'Bobby', N'Razo', N'bobby@gmail.com', N'012345967', 2027)
SET IDENTITY_INSERT [dbo].[user_usr] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user_usr__98BFCA3A3D1A1AC7]    Script Date: 22/03/2018 11:35:42 ******/
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
ALTER TABLE [dbo].[trip_tri]  WITH CHECK ADD  CONSTRAINT [fk_trip_user] FOREIGN KEY([tri_usr_id])
REFERENCES [dbo].[user_usr] ([usr_id])
GO
ALTER TABLE [dbo].[trip_tri] CHECK CONSTRAINT [fk_trip_user]
GO
ALTER TABLE [dbo].[user_usr]  WITH CHECK ADD  CONSTRAINT [fk_user_address] FOREIGN KEY([usr_add_id])
REFERENCES [dbo].[address_add] ([add_id])
GO
ALTER TABLE [dbo].[user_usr] CHECK CONSTRAINT [fk_user_address]
GO
