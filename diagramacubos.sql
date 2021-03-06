USE [master]
GO
/****** Object:  Database [changeitcubes]    Script Date: 28/6/2021 02:03:03 ******/
CREATE DATABASE [changeitcubes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'changeitcubes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeitcubes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'changeitcubes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeitcubes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [changeitcubes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [changeitcubes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [changeitcubes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [changeitcubes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [changeitcubes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [changeitcubes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [changeitcubes] SET ARITHABORT OFF 
GO
ALTER DATABASE [changeitcubes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [changeitcubes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [changeitcubes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [changeitcubes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [changeitcubes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [changeitcubes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [changeitcubes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [changeitcubes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [changeitcubes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [changeitcubes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [changeitcubes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [changeitcubes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [changeitcubes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [changeitcubes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [changeitcubes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [changeitcubes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [changeitcubes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [changeitcubes] SET RECOVERY FULL 
GO
ALTER DATABASE [changeitcubes] SET  MULTI_USER 
GO
ALTER DATABASE [changeitcubes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [changeitcubes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [changeitcubes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [changeitcubes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [changeitcubes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [changeitcubes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'changeitcubes', N'ON'
GO
ALTER DATABASE [changeitcubes] SET QUERY_STORE = OFF
GO
USE [changeitcubes]
GO
/****** Object:  User [sa2]    Script Date: 28/6/2021 02:03:05 ******/
CREATE USER [sa2] FOR LOGIN [sa2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[campañas]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campañas](
	[campañaid] [int] IDENTITY(1,1) NOT NULL,
	[campaña] [varchar](255) NULL,
 CONSTRAINT [PK_campañas] PRIMARY KEY CLUSTERED 
(
	[campañaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[ciudadid] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](255) NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[ciudadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fechas]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fechas](
	[fechaid] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[dia] [int] NULL,
	[mes] [int] NULL,
	[año] [int] NULL,
 CONSTRAINT [PK_fechas] PRIMARY KEY CLUSTERED 
(
	[fechaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[restauranteid] [int] NULL,
	[campañaid] [int] NULL,
	[monto] [int] NULL,
	[fechaid] [int] NULL,
	[views] [int] NULL,
	[shares] [int] NULL,
	[ciudadid] [int] NULL,
 CONSTRAINT [PK_info] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurantes]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurantes](
	[restauranteid] [int] IDENTITY(1,1) NOT NULL,
	[restaurante] [varchar](255) NULL,
 CONSTRAINT [PK_restaurantes] PRIMARY KEY CLUSTERED 
(
	[restauranteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_campañas] FOREIGN KEY([campañaid])
REFERENCES [dbo].[campañas] ([campañaid])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_campañas]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_ciudades] FOREIGN KEY([ciudadid])
REFERENCES [dbo].[ciudades] ([ciudadid])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_ciudades]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_fechas] FOREIGN KEY([fechaid])
REFERENCES [dbo].[fechas] ([fechaid])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_fechas]
GO
ALTER TABLE [dbo].[info]  WITH CHECK ADD  CONSTRAINT [FK_info_restaurantes] FOREIGN KEY([restauranteid])
REFERENCES [dbo].[restaurantes] ([restauranteid])
GO
ALTER TABLE [dbo].[info] CHECK CONSTRAINT [FK_info_restaurantes]
GO
/****** Object:  StoredProcedure [dbo].[insertions]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertions]
AS
insert into restaurantes(restaurante)
VALUES 
('Dairy Queen'),
('Checkers'),
('Five Guys'),
('Burger King'),
('El Pollo Loco'),
('Chipotle Mexican Grill'),
('SUBWAY'),
('Pizza Hut'),
('Taco Bell'),
('Chicken Express'),
('Pizza Hut'),
('Arby´s')
insert into ciudades(ciudad)
VALUES 
('Detroit'),
('Grand Rapidis'),
('Oregon'),
('Columbia'),
('Compton'),
('Chatsworth'),
('Campbellsville'),
('Defiance'),
('Utica'),
('Paris'),
('Columbia'),
('Columbia')
insert into campañas(campaña)
VALUES 
('valentines day'),
('sport and food'),
('sport and food'),
('christmas'),
('christmas'),
('valentines day'),
('halloween'),
('halloween'),
('halloween'),
('sports and food'),
('back to school'),
('kids day')
insert into fechas(fecha,dia,mes,año)
VALUES 
('2021-05-11 23:00:04',11,05,2021),
('2021-06-12 12:05:00',6,12,2021),
('2021-06-20 08:12:00',20,6,2021),
('2020-12-24 13:10:09',24,12,2020),
('2020-12-24 13:10:09',24,12,2020),
('2021-02-14 09:10:10',14,2,2021),
('2020-10-31 16:08:26',31,10,2020),
('2020-10-31 09:00:20',31,10,2020),
('2020-09-26 11:04:45',26,9,2020),
('2020-09-30 17:05:27',30,9,2020),
('2021-02-01 14:10:22',1,2,2021)
insert into info(restauranteid,campañaid,monto,fechaid,views,shares,ciudadid)
VALUES 
(1,1,300,1,500,15,1),
(2,2,500,2,900,40,2),
(3,3,1000,3,1200,50,3),
(4,4,1000,4,2500,45,4),
(5,5,250,5,300,8,5),
(6,6,900,6,1200,50,6),
(7,7,1200,7,2400,69,7),
(8,8,4000,8,3000,40,8),
(9,9,9000,9,10000,89,9),
(10,10,500,10,500,20,10),
(11,11,900,11,1000,29,11),
(12,12,2000,12,1000,99,12)
GO
/****** Object:  StoredProcedure [dbo].[insetions]    Script Date: 28/6/2021 02:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insetions]
AS
insert into restaurantes(restaurante)
VALUES 
('Dairy Queen'),
('Checkers'),
('Five Guys'),
('Burger King'),
('El Pollo Loco'),
('Chipotle Mexican Grill'),
('SUBWAY'),
('Pizza Hut'),
('Taco Bell'),
('Chicken Express'),
('Pizza Hut'),
('Arby´s')
insert into ciudades(ciudad)
VALUES 
('Detroit'),
('Grand Rapidis'),
('Oregon'),
('Columbia'),
('Compton'),
('Chatsworth'),
('Campbellsville'),
('Defiance'),
('Utica'),
('Paris'),
('Columbia'),
('Columbia')
insert into campañas(campaña)
VALUES 
('valentines day'),
('sport and food'),
('sport and food'),
('christmas'),
('christmas'),
('valentines day'),
('halloween'),
('halloween'),
('halloween'),
('sports and food'),
('back to school'),
('kids day')
insert into fechas(fecha,dia,mes,año)
VALUES 
('2021-05-11 23:00:04',11,05,2021),
('2021-06-12 12:05:00',6,12,2021),
('2021-06-20 08:12:00',20,6,2021),
('2020-12-24 13:10:09',24,12,2020),
('2020-12-24 13:10:09',24,12,2020),
('2021-02-14 09:10:10',14,2,2021),
('2020-10-31 16:08:26',31,10,2020),
('2020-10-31 09:00:20',31,10,2020),
('2020-09-26 11:04:45',26,9,2020),
('2020-09-30 17:05:27',30,9,2020),
('2021-02-01 14:10:22',1,2,2021)
insert into info(monto,views,shares)
VALUES 
(300,500,15),
(500,900,40),
(1000,1200,50),
(1000,2500,45),
(250,300,8),
(900,1200,50),
(1200,2400,69),
(4000,3000,40),
(9000,10000,89),
(500,500,20),
(900,1000,29),
(2000,1000,99)
GO
USE [master]
GO
ALTER DATABASE [changeitcubes] SET  READ_WRITE 
GO
