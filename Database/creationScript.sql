USE [carpool]
GO

IF EXISTS(SELECT * from sys.tables WHERE name='joins_joi')   
    DROP TABLE joins_joi;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='message_mes')   
    DROP TABLE message_mes;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='is_friend_ifr')   
    DROP TABLE is_friend_ifr;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='user_usr')   
    DROP TABLE user_usr;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='trip_tri')   
    DROP TABLE trip_tri;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='address_add')   
    DROP TABLE address_add;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='city_cit')   
    DROP TABLE city_cit;  
GO
IF EXISTS(SELECT * from sys.tables WHERE name='country_cou')   
    DROP TABLE country_cou;  
GO
/****** Object:  Table [dbo].[address_add]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[city_cit]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[country_cou]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[is_friend_ifr]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[joins_joi]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[message_mes]    Script Date: 12/02/2018 17:27:23 ******/
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
/****** Object:  Table [dbo].[trip_tri]    Script Date: 12/02/2018 17:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip_tri](
	[tri_id] [int] IDENTITY(1,1) NOT NULL,
	[tri_number_of_places] [int] NOT NULL,
	[tri_price] [numeric](5, 2) NOT NULL,
	[tri_is_routine] [bit] NULL,
	[tri_period] [numeric](3, 2) NOT NULL,
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
/****** Object:  Table [dbo].[user_usr]    Script Date: 12/02/2018 17:27:24 ******/
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
	[usr_add_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usr_user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
