USE [master]
GO
/****** Object:  Database [changeit]    Script Date: 15/06/2021 15:06:47 ******/
CREATE DATABASE [changeit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'changeit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'changeit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [changeit] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [changeit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [changeit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [changeit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [changeit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [changeit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [changeit] SET ARITHABORT OFF 
GO
ALTER DATABASE [changeit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [changeit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [changeit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [changeit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [changeit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [changeit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [changeit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [changeit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [changeit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [changeit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [changeit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [changeit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [changeit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [changeit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [changeit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [changeit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [changeit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [changeit] SET RECOVERY FULL 
GO
ALTER DATABASE [changeit] SET  MULTI_USER 
GO
ALTER DATABASE [changeit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [changeit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [changeit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [changeit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [changeit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [changeit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'changeit', N'ON'
GO
ALTER DATABASE [changeit] SET QUERY_STORE = OFF
GO
USE [changeit]
GO
/****** Object:  Table [dbo].[Aportes]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aportes](
	[aporteid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Aportes] PRIMARY KEY CLUSTERED 
(
	[aporteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppFuente]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppFuente](
	[appfuenteid] [int] IDENTITY(1,1) NOT NULL,
	[nombreappsource] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AppFuente] PRIMARY KEY CLUSTERED 
(
	[appfuenteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacoras]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacoras](
	[bitacoraid] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[userbitacora] [bigint] NOT NULL,
	[ip] [varchar](16) NOT NULL,
	[refid1] [bigint] NOT NULL,
	[refid2] [bigint] NULL,
	[oldvalue] [nvarchar](50) NULL,
	[newvalue] [nvarchar](50) NULL,
	[checksum] [varbinary](500) NOT NULL,
	[severidadbit] [int] NOT NULL,
	[entitybit] [int] NOT NULL,
	[appfuentebit] [int] NOT NULL,
	[logtypebit] [int] NOT NULL,
 CONSTRAINT [PK_Bitacoras] PRIMARY KEY CLUSTERED 
(
	[bitacoraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTypes](
	[EntityTypes] [int] IDENTITY(1,1) NOT NULL,
	[nombreentity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[EntityTypes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosPago]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosPago](
	[estadopagoid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosPago] PRIMARY KEY CLUSTERED 
(
	[estadopagoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitos](
	[habitoid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[imagen] [image] NULL,
	[descripcion] [varchar](100) NULL,
	[userid] [bigint] NOT NULL,
 CONSTRAINT [PK_Habitos] PRIMARY KEY CLUSTERED 
(
	[habitoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntentosDePago]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntentosDePago](
	[intentoid] [int] IDENTITY(1,1) NOT NULL,
	[monto] [money] NULL,
	[posttime] [datetime] NULL,
	[habito] [varchar](100) NULL,
	[referencenumber] [int] NULL,
	[checksum] [binary](50) NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_IntentosDePago] PRIMARY KEY CLUSTERED 
(
	[intentoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchants](
	[merchantid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[merchantid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[pagoid] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[currencysymbol] [nvarchar](30) NOT NULL,
	[errornumber] [bigint] NULL,
	[merchanttransnumber] [int] NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[referenceid] [bigint] NULL,
	[checksum] [varbinary](500) NOT NULL,
	[useridpago] [bigint] NOT NULL,
	[estadopagoidpay] [smallint] NOT NULL,
	[merchantidpay] [int] NOT NULL,
	[tipopagoidpay] [int] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[pagoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severidades]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severidades](
	[severidadid] [int] IDENTITY(1,1) NOT NULL,
	[nombreseveridad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Severidades] PRIMARY KEY CLUSTERED 
(
	[severidadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[tipopagoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[tipopagoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposBitacoras]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposBitacoras](
	[tipobitacoraid] [int] IDENTITY(1,1) NOT NULL,
	[nombretipobitacora] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposBitacoras] PRIMARY KEY CLUSTERED 
(
	[tipobitacoraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[ubicacionid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[poblacion] [float] NULL,
	[latitud] [decimal](10, 8) NULL,
	[longitud] [decimal](10, 8) NOT NULL,
	[radio] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Ubicaciones] PRIMARY KEY CLUSTERED 
(
	[ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UbicacionesDeUsuario]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionesDeUsuario](
	[ubicacionusuarioid] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[latitud] [decimal](10, 8) NULL,
	[longitud] [decimal](10, 8) NULL,
 CONSTRAINT [PK_UbicacionesDeUsuario] PRIMARY KEY CLUSTERED 
(
	[ubicacionusuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/06/2021 15:06:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[latitud] [decimal](10, 8) NULL,
	[longitud] [decimal](11, 8) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_AppFuente] FOREIGN KEY([appfuentebit])
REFERENCES [dbo].[AppFuente] ([appfuenteid])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_AppFuente]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_EntityTypes] FOREIGN KEY([entitybit])
REFERENCES [dbo].[EntityTypes] ([EntityTypes])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_EntityTypes]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_Severidades] FOREIGN KEY([severidadbit])
REFERENCES [dbo].[Severidades] ([severidadid])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_Severidades]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_TiposBitacoras] FOREIGN KEY([logtypebit])
REFERENCES [dbo].[TiposBitacoras] ([tipobitacoraid])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_TiposBitacoras]
GO
ALTER TABLE [dbo].[Habitos]  WITH CHECK ADD  CONSTRAINT [FK_Habitos_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Habitos] CHECK CONSTRAINT [FK_Habitos_Users]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_EstadosPago] FOREIGN KEY([estadopagoidpay])
REFERENCES [dbo].[EstadosPago] ([estadopagoid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_EstadosPago]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Merchants] FOREIGN KEY([merchantidpay])
REFERENCES [dbo].[Merchants] ([merchantid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Merchants]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_TipoPago] FOREIGN KEY([tipopagoidpay])
REFERENCES [dbo].[TipoPago] ([tipopagoid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_TipoPago]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Users] FOREIGN KEY([useridpago])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Users]
GO
USE [master]
GO
ALTER DATABASE [changeit] SET  READ_WRITE 
GO
