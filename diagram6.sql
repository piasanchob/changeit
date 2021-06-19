USE [master]
GO
/****** Object:  Database [changeit]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Ads]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[adid] [bigint] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[vistas] [bigint] NOT NULL,
	[titulo] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[tag] [nvarchar](100) NOT NULL,
	[habitopatrocinado] [bigint] NULL,
	[entidad] [tinyint] NOT NULL,
	[entidadreferenceid] [bigint] NOT NULL,
	[deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aportes]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aportes](
	[aporteid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NOT NULL,
	[cantidad] [decimal](15, 3) NOT NULL,
	[habitoid] [nchar](10) NULL,
 CONSTRAINT [PK_Aportes] PRIMARY KEY CLUSTERED 
(
	[aporteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppFuente]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Bitacoras]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Empresas]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresas](
	[empresaid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[correo] [nvarchar](100) NOT NULL,
	[URL] [nvarchar](128) NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[empresaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad](
	[entidadid] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Entidad] PRIMARY KEY CLUSTERED 
(
	[entidadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[EstadosPago]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Habitos]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitos](
	[habitoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[imagen] [nvarchar](128) NOT NULL,
	[deleted] [bit] NOT NULL,
	[fechainicio] [datetime] NULL,
	[fechafinal] [datetime] NULL,
	[tipohabito] [smallint] NOT NULL,
 CONSTRAINT [PK_Habitos] PRIMARY KEY CLUSTERED 
(
	[habitoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitosAplicados]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitosAplicados](
	[habitoaplicadoid] [bigint] IDENTITY(1,1) NOT NULL,
	[usuario] [bigint] NOT NULL,
	[habito] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
 CONSTRAINT [PK_HabitosAplicados] PRIMARY KEY CLUSTERED 
(
	[habitoaplicadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitosPatrocinados]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitosPatrocinados](
	[habitopromocionadoid] [bigint] IDENTITY(1,1) NOT NULL,
	[habitoid] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[checksum] [varbinary](300) NOT NULL,
	[radio] [smallint] NOT NULL,
	[entidad] [tinyint] NOT NULL,
	[entidadreferenceid] [bigint] NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_HabitosPatrocinados] PRIMARY KEY CLUSTERED 
(
	[habitopromocionadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntentosDePago]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Merchants]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[MontosHabitos]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MontosHabitos](
	[montoid] [bigint] IDENTITY(1,1) NOT NULL,
	[monto] [money] NOT NULL,
	[entidad] [tinyint] NOT NULL,
	[entidadreference] [bigint] NOT NULL,
	[habitopatrocinadoid] [nchar](10) NULL,
 CONSTRAINT [PK_MontosHabitos] PRIMARY KEY CLUSTERED 
(
	[montoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 18/06/2021 21:50:34 ******/
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
	[entidadreference] [bigint] NOT NULL,
	[estadopagoidpay] [smallint] NOT NULL,
	[merchantidpay] [int] NOT NULL,
	[tipopagoidpay] [int] NOT NULL,
	[entidad] [tinyint] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[pagoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[publicacionid] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severidades]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[TipoHabitos]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHabitos](
	[tipoid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[medida] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TipoHabitos] PRIMARY KEY CLUSTERED 
(
	[tipoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[TiposBitacoras]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[UbicacionesDeUsuario]    Script Date: 18/06/2021 21:50:34 ******/
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
/****** Object:  Table [dbo].[UbicacionesPorHabitos]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionesPorHabitos](
	[ubicacionid] [int] IDENTITY(1,1) NOT NULL,
	[habitoid] [int] NOT NULL,
	[longitud] [decimal](9, 6) NOT NULL,
	[latitud] [decimal](8, 6) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UbicacionesPorHabitos] PRIMARY KEY CLUSTERED 
(
	[ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UbicacionesPorUsuario]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionesPorUsuario](
	[ubicacionid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[longitud] [decimal](9, 6) NOT NULL,
	[latitud] [decimal](8, 6) NOT NULL,
	[usuario] [bigint] NOT NULL,
	[actual] [bit] NOT NULL,
 CONSTRAINT [PK_UbicacionesPorUsuario] PRIMARY KEY CLUSTERED 
(
	[ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/06/2021 21:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[latitud] [decimal](10, 8) NOT NULL,
	[longitud] [decimal](11, 8) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Empresas] FOREIGN KEY([entidadreferenceid])
REFERENCES [dbo].[Empresas] ([empresaid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Empresas]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_HabitosPatrocinados] FOREIGN KEY([habitopatrocinado])
REFERENCES [dbo].[HabitosPatrocinados] ([habitopromocionadoid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_HabitosPatrocinados]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Users] FOREIGN KEY([entidadreferenceid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Users]
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
ALTER TABLE [dbo].[Habitos]  WITH CHECK ADD  CONSTRAINT [FK_Habitos_TipoHabitos] FOREIGN KEY([tipohabito])
REFERENCES [dbo].[TipoHabitos] ([tipoid])
GO
ALTER TABLE [dbo].[Habitos] CHECK CONSTRAINT [FK_Habitos_TipoHabitos]
GO
ALTER TABLE [dbo].[HabitosAplicados]  WITH CHECK ADD  CONSTRAINT [FK_HabitosAplicados_Habitos] FOREIGN KEY([habito])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[HabitosAplicados] CHECK CONSTRAINT [FK_HabitosAplicados_Habitos]
GO
ALTER TABLE [dbo].[HabitosAplicados]  WITH CHECK ADD  CONSTRAINT [FK_HabitosAplicados_Users] FOREIGN KEY([usuario])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[HabitosAplicados] CHECK CONSTRAINT [FK_HabitosAplicados_Users]
GO
ALTER TABLE [dbo].[HabitosPatrocinados]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPatrocinados_Entidad] FOREIGN KEY([entidad])
REFERENCES [dbo].[Entidad] ([entidadid])
GO
ALTER TABLE [dbo].[HabitosPatrocinados] CHECK CONSTRAINT [FK_HabitosPatrocinados_Entidad]
GO
ALTER TABLE [dbo].[HabitosPatrocinados]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPatrocinados_Habitos] FOREIGN KEY([habitoid])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[HabitosPatrocinados] CHECK CONSTRAINT [FK_HabitosPatrocinados_Habitos]
GO
ALTER TABLE [dbo].[MontosHabitos]  WITH CHECK ADD  CONSTRAINT [FK_MontosHabitos_Entidad] FOREIGN KEY([entidad])
REFERENCES [dbo].[Entidad] ([entidadid])
GO
ALTER TABLE [dbo].[MontosHabitos] CHECK CONSTRAINT [FK_MontosHabitos_Entidad]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Empresas] FOREIGN KEY([entidadreference])
REFERENCES [dbo].[Empresas] ([empresaid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Empresas]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Entidad] FOREIGN KEY([entidad])
REFERENCES [dbo].[Entidad] ([entidadid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Entidad]
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
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Users1] FOREIGN KEY([entidadreference])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Users1]
GO
ALTER TABLE [dbo].[UbicacionesPorHabitos]  WITH CHECK ADD  CONSTRAINT [FK_UbicacionesPorHabitos_Habitos] FOREIGN KEY([habitoid])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[UbicacionesPorHabitos] CHECK CONSTRAINT [FK_UbicacionesPorHabitos_Habitos]
GO
ALTER TABLE [dbo].[UbicacionesPorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_UbicacionesPorUsuario_Users] FOREIGN KEY([usuario])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[UbicacionesPorUsuario] CHECK CONSTRAINT [FK_UbicacionesPorUsuario_Users]
GO
USE [master]
GO
ALTER DATABASE [changeit] SET  READ_WRITE 
GO
