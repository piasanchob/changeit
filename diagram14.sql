USE [master]
GO
/****** Object:  Database [changeit]    Script Date: 25/06/2021 15:25:33 ******/
CREATE DATABASE [changeit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'changeit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeit.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'changeit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\changeit_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[TipoHabitos]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  View [dbo].[VerTipoHabitosNombres]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerTipoHabitosNombres]
AS SELECT nombre FROM dbo.TipoHabitos;
GO
/****** Object:  Table [dbo].[TipoReaccion]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoReaccion](
	[tiporeaccionid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](128) NULL,
 CONSTRAINT [PK_TipoReaccion] PRIMARY KEY CLUSTERED 
(
	[tiporeaccionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerTipoReaccion]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerTipoReaccion]
AS SELECT nombre FROM dbo.Tiporeaccion;
GO
/****** Object:  Table [dbo].[RedesSociales]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedesSociales](
	[redessocialesid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
	[iconoURL] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RedesSociales] PRIMARY KEY CLUSTERED 
(
	[redessocialesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerRedesSociales]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerRedesSociales] 
AS SELECT * FROM RedesSociales;
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 25/06/2021 15:25:33 ******/
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
	[habito] [int] NULL,
	[entidad] [tinyint] NOT NULL,
	[entidadreferenceid] [bigint] NOT NULL,
	[deleted] [bit] NOT NULL,
	[monto] [money] NOT NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[adid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aportes]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aportes](
	[aporteid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NOT NULL,
	[habitoid] [int] NOT NULL,
 CONSTRAINT [PK_Aportes] PRIMARY KEY CLUSTERED 
(
	[aporteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AportesPorResumen]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AportesPorResumen](
	[aporte] [bigint] NOT NULL,
	[resumen] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AportesPorUsuario]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AportesPorUsuario](
	[aporte] [bigint] NOT NULL,
	[cantidad] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[aporteusuarioid] [bigint] IDENTITY(1,1) NOT NULL,
	[usuario] [bigint] NOT NULL,
 CONSTRAINT [PK_AportesPorUsuario] PRIMARY KEY CLUSTERED 
(
	[aporteusuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppFuente]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Bitacoras]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Empresas]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Entidad]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[EstadosPago]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Fast_Food_Restaurants]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fast_Food_Restaurants](
	[id] [varchar](max) NULL,
	[dateAdded] [varchar](max) NULL,
	[dateUpdated] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[categories] [varchar](max) NULL,
	[city] [varchar](max) NULL,
	[country] [varchar](max) NULL,
	[keys] [varchar](max) NULL,
	[latitude] [varchar](max) NULL,
	[longitude] [varchar](max) NULL,
	[name] [varchar](max) NULL,
	[postalCode] [varchar](max) NULL,
	[province] [varchar](max) NULL,
	[sourceURLs] [varchar](max) NULL,
	[websites] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitos](
	[habitoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[imagenURL] [nvarchar](128) NOT NULL,
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
/****** Object:  Table [dbo].[HabitosAplicados]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitosAplicados](
	[habitoaplicadoid] [bigint] IDENTITY(1,1) NOT NULL,
	[usuario] [bigint] NOT NULL,
	[habito] [int] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[localizacion] [geography] NOT NULL,
 CONSTRAINT [PK_HabitosAplicados] PRIMARY KEY CLUSTERED 
(
	[habitoaplicadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitosPatrocinados]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[HabitosPorResumenes]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitosPorResumenes](
	[habito] [bigint] NOT NULL,
	[resumen] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitosPorUbicacion]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitosPorUbicacion](
	[habito] [int] NOT NULL,
	[ubicacion] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntentosDePago]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Merchants]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[MontosHabitos]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Pagos]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Poblacion]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poblacion](
	[poblacionid] [bigint] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[ubicacion] [bigint] NOT NULL,
 CONSTRAINT [PK_Poblacion] PRIMARY KEY CLUSTERED 
(
	[poblacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[publicacionid] [bigint] IDENTITY(1,1) NOT NULL,
	[caption] [nvarchar](500) NULL,
	[URL] [nvarchar](128) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[updatepost] [bit] NOT NULL,
	[imagen] [image] NULL,
	[redsocial] [smallint] NOT NULL,
	[usuario] [bigint] NOT NULL,
	[resumen] [bigint] NOT NULL,
 CONSTRAINT [PK_Publicaciones] PRIMARY KEY CLUSTERED 
(
	[publicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reacciones]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reacciones](
	[reaccionid] [bigint] IDENTITY(1,1) NOT NULL,
	[userreference] [bigint] NOT NULL,
	[post] [bigint] NOT NULL,
	[tiporeaccion] [smallint] NOT NULL,
	[URL] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Reacciones] PRIMARY KEY CLUSTERED 
(
	[reaccionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resumenes]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resumenes](
	[resumenid] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[caption] [nvarchar](500) NOT NULL,
	[usuario] [bigint] NOT NULL,
 CONSTRAINT [PK_ResumenesHabitos] PRIMARY KEY CLUSTERED 
(
	[resumenid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severidades]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tagid] [bigint] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](50) NOT NULL,
	[tipotag] [smallint] NOT NULL,
	[referenceid] [bigint] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[tagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsPorAds]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsPorAds](
	[tag] [bigint] NOT NULL,
	[ad] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsPorPosts]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsPorPosts](
	[tag] [bigint] NOT NULL,
	[post] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[TiposBitacoras]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[TipoTag]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTag](
	[tipotagid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoTag] PRIMARY KEY CLUSTERED 
(
	[tipotagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[transaccionid] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[amount] [float] NULL,
	[descripcion] [nvarchar](150) NOT NULL,
	[checksum] [varbinary](500) NOT NULL,
	[IP] [varchar](16) NOT NULL,
	[refid1] [bigint] NULL,
	[refid2] [bigint] NULL,
	[entidad] [tinyint] NOT NULL,
	[transtypes] [smallint] NOT NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[transaccionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trantypes]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trantypes](
	[transtypeid] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Trantypes] PRIMARY KEY CLUSTERED 
(
	[transtypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[UbicacionesDB]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionesDB](
	[ubicacionid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[deleted] [bit] NOT NULL,
	[localizacion] [geography] NOT NULL,
 CONSTRAINT [PK_UbicacionesPorHabitos] PRIMARY KEY CLUSTERED 
(
	[ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UbicacionesDeUsuario]    Script Date: 25/06/2021 15:25:33 ******/
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
/****** Object:  Table [dbo].[UbicacionesPorUsuario]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbicacionesPorUsuario](
	[ubicacionid] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [bigint] NOT NULL,
	[actual] [bit] NOT NULL,
 CONSTRAINT [PK_UbicacionesPorUsuario] PRIMARY KEY CLUSTERED 
(
	[ubicacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userid] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[deleted] [bit] NOT NULL,
	[validaciontoken] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValidacionRRSS]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValidacionRRSS](
	[validacionid] [bigint] IDENTITY(1,1) NOT NULL,
	[token] [nvarchar](300) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[tokenvalido] [bit] NOT NULL,
	[redsocial] [smallint] NOT NULL,
	[tiempo] [bigint] NOT NULL,
 CONSTRAINT [PK_ValidacionRRSS] PRIMARY KEY CLUSTERED 
(
	[validacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Empresas] FOREIGN KEY([entidadreferenceid])
REFERENCES [dbo].[Empresas] ([empresaid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Empresas]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Habitos] FOREIGN KEY([habito])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Habitos]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Users] FOREIGN KEY([entidadreferenceid])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Users]
GO
ALTER TABLE [dbo].[Aportes]  WITH CHECK ADD  CONSTRAINT [FK_Aportes_Habitos] FOREIGN KEY([habitoid])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[Aportes] CHECK CONSTRAINT [FK_Aportes_Habitos]
GO
ALTER TABLE [dbo].[AportesPorResumen]  WITH CHECK ADD  CONSTRAINT [FK_AportesPorResumen_AportesPorUsuario] FOREIGN KEY([aporte])
REFERENCES [dbo].[AportesPorUsuario] ([aporteusuarioid])
GO
ALTER TABLE [dbo].[AportesPorResumen] CHECK CONSTRAINT [FK_AportesPorResumen_AportesPorUsuario]
GO
ALTER TABLE [dbo].[AportesPorResumen]  WITH CHECK ADD  CONSTRAINT [FK_AportesPorResumen_ResumenesHabitos] FOREIGN KEY([resumen])
REFERENCES [dbo].[Resumenes] ([resumenid])
GO
ALTER TABLE [dbo].[AportesPorResumen] CHECK CONSTRAINT [FK_AportesPorResumen_ResumenesHabitos]
GO
ALTER TABLE [dbo].[AportesPorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_AportesPorUsuario_Aportes] FOREIGN KEY([aporte])
REFERENCES [dbo].[Aportes] ([aporteid])
GO
ALTER TABLE [dbo].[AportesPorUsuario] CHECK CONSTRAINT [FK_AportesPorUsuario_Aportes]
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
ALTER TABLE [dbo].[HabitosPorResumenes]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPorResumenes_HabitosAplicados] FOREIGN KEY([habito])
REFERENCES [dbo].[HabitosAplicados] ([habitoaplicadoid])
GO
ALTER TABLE [dbo].[HabitosPorResumenes] CHECK CONSTRAINT [FK_HabitosPorResumenes_HabitosAplicados]
GO
ALTER TABLE [dbo].[HabitosPorResumenes]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPorResumenes_ResumenesHabitos] FOREIGN KEY([resumen])
REFERENCES [dbo].[Resumenes] ([resumenid])
GO
ALTER TABLE [dbo].[HabitosPorResumenes] CHECK CONSTRAINT [FK_HabitosPorResumenes_ResumenesHabitos]
GO
ALTER TABLE [dbo].[HabitosPorUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPorUbicacion_Habitos] FOREIGN KEY([habito])
REFERENCES [dbo].[Habitos] ([habitoid])
GO
ALTER TABLE [dbo].[HabitosPorUbicacion] CHECK CONSTRAINT [FK_HabitosPorUbicacion_Habitos]
GO
ALTER TABLE [dbo].[HabitosPorUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_HabitosPorUbicacion_UbicacionesDB] FOREIGN KEY([ubicacion])
REFERENCES [dbo].[UbicacionesDB] ([ubicacionid])
GO
ALTER TABLE [dbo].[HabitosPorUbicacion] CHECK CONSTRAINT [FK_HabitosPorUbicacion_UbicacionesDB]
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
ALTER TABLE [dbo].[Poblacion]  WITH CHECK ADD  CONSTRAINT [FK_Poblacion_UbicacionesDB] FOREIGN KEY([ubicacion])
REFERENCES [dbo].[UbicacionesDB] ([ubicacionid])
GO
ALTER TABLE [dbo].[Poblacion] CHECK CONSTRAINT [FK_Poblacion_UbicacionesDB]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_RedesSociales] FOREIGN KEY([redsocial])
REFERENCES [dbo].[RedesSociales] ([redessocialesid])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_RedesSociales]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_ResumenesHabitos] FOREIGN KEY([resumen])
REFERENCES [dbo].[Resumenes] ([resumenid])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_ResumenesHabitos]
GO
ALTER TABLE [dbo].[Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Publicaciones_Users] FOREIGN KEY([usuario])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[Publicaciones] CHECK CONSTRAINT [FK_Publicaciones_Users]
GO
ALTER TABLE [dbo].[Reacciones]  WITH CHECK ADD  CONSTRAINT [FK_Reacciones_Publicaciones] FOREIGN KEY([post])
REFERENCES [dbo].[Publicaciones] ([publicacionid])
GO
ALTER TABLE [dbo].[Reacciones] CHECK CONSTRAINT [FK_Reacciones_Publicaciones]
GO
ALTER TABLE [dbo].[Reacciones]  WITH CHECK ADD  CONSTRAINT [FK_Reacciones_TipoReaccion] FOREIGN KEY([tiporeaccion])
REFERENCES [dbo].[TipoReaccion] ([tiporeaccionid])
GO
ALTER TABLE [dbo].[Reacciones] CHECK CONSTRAINT [FK_Reacciones_TipoReaccion]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_TipoTag] FOREIGN KEY([tipotag])
REFERENCES [dbo].[TipoTag] ([tipotagid])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_TipoTag]
GO
ALTER TABLE [dbo].[TagsPorAds]  WITH CHECK ADD  CONSTRAINT [FK_TagsPorAds_Ads] FOREIGN KEY([ad])
REFERENCES [dbo].[Ads] ([adid])
GO
ALTER TABLE [dbo].[TagsPorAds] CHECK CONSTRAINT [FK_TagsPorAds_Ads]
GO
ALTER TABLE [dbo].[TagsPorAds]  WITH CHECK ADD  CONSTRAINT [FK_TagsPorAds_Tags] FOREIGN KEY([tag])
REFERENCES [dbo].[Tags] ([tagid])
GO
ALTER TABLE [dbo].[TagsPorAds] CHECK CONSTRAINT [FK_TagsPorAds_Tags]
GO
ALTER TABLE [dbo].[TagsPorPosts]  WITH CHECK ADD  CONSTRAINT [FK_TagsPorPosts_Publicaciones] FOREIGN KEY([post])
REFERENCES [dbo].[Publicaciones] ([publicacionid])
GO
ALTER TABLE [dbo].[TagsPorPosts] CHECK CONSTRAINT [FK_TagsPorPosts_Publicaciones]
GO
ALTER TABLE [dbo].[TagsPorPosts]  WITH CHECK ADD  CONSTRAINT [FK_TagsPorPosts_Tags] FOREIGN KEY([tag])
REFERENCES [dbo].[Tags] ([tagid])
GO
ALTER TABLE [dbo].[TagsPorPosts] CHECK CONSTRAINT [FK_TagsPorPosts_Tags]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Entidad] FOREIGN KEY([entidad])
REFERENCES [dbo].[Entidad] ([entidadid])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Entidad]
GO
ALTER TABLE [dbo].[Transacciones]  WITH CHECK ADD  CONSTRAINT [FK_Transacciones_Trantypes] FOREIGN KEY([transtypes])
REFERENCES [dbo].[Trantypes] ([transtypeid])
GO
ALTER TABLE [dbo].[Transacciones] CHECK CONSTRAINT [FK_Transacciones_Trantypes]
GO
ALTER TABLE [dbo].[UbicacionesPorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_UbicacionesPorUsuario_Users] FOREIGN KEY([usuario])
REFERENCES [dbo].[Users] ([userid])
GO
ALTER TABLE [dbo].[UbicacionesPorUsuario] CHECK CONSTRAINT [FK_UbicacionesPorUsuario_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_ValidacionRRSS] FOREIGN KEY([validaciontoken])
REFERENCES [dbo].[ValidacionRRSS] ([validacionid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_ValidacionRRSS]
GO
ALTER TABLE [dbo].[ValidacionRRSS]  WITH CHECK ADD  CONSTRAINT [FK_ValidacionRRSS_RedesSociales] FOREIGN KEY([redsocial])
REFERENCES [dbo].[RedesSociales] ([redessocialesid])
GO
ALTER TABLE [dbo].[ValidacionRRSS] CHECK CONSTRAINT [FK_ValidacionRRSS_RedesSociales]
GO
/****** Object:  StoredProcedure [dbo].[AplicarHabito]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AplicarHabito] AS

	DECLARE @usuario bigint
	DECLARE @habito int
	DECLARE @lat decimal(8,6)
	DECLARE @lon decimal(9,6)
	DECLARE @localizacion geography

	SET @usuario = FLOOR(RAND()*100000 + 1)
	SET @habito = FLOOR(RAND()*10 + 1)

	SET @lat = (RAND()*90 + 1) 
	SET @lon = (RAND()*180 + 1) 
	

	IF (select rand()) < 0.5
		SET @lat = @lat*-1
	IF (select rand()) < 0.5
		SET @lon = @lon*-1

	SET @localizacion = geography::Point(@lat, @lon, 4326)


	INSERT INTO dbo.HabitosAplicados(usuario, habito, posttime, localizacion)
	VALUES(3, @habito, GETDATE(), @localizacion)

GO
/****** Object:  StoredProcedure [dbo].[GenerarResumen]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerarResumen] 
	@usuarioid bigint
AS

	DECLARE @contador int
	DECLARE @aporteid bigint
	DECLARE @aporte nvarchar(100)
	DECLARE @habitocontador int
	DECLARE @cantidad int
	DECLARE @caption nvarchar(500)

	--PRIMERO GENERAR EL RESUMEN

	SET @caption = ''

	--SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito

	--SELECT habito, COUNT(habitoaplicadoid) cantidad FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito

	SET @contador = (SELECT COUNT(habito) FROM (SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito) AS habito_aux)

	SET @habitocontador = 1

	BEGIN TRAN
	
	WHILE @habitocontador <= (SELECT MAX(habitoid) FROM dbo.Habitos) BEGIN

	IF @habitocontador IN (SELECT habito FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito)
	BEGIN
		
		SET @aporteid = (SELECT aporteid FROM dbo.Aportes WHERE dbo.Aportes.habitoid=@habitocontador)

		SET @cantidad = (SELECT cantidad FROM (SELECT habito, COUNT(habitoaplicadoid) cantidad FROM dbo.HabitosAplicados WHERE ((posttime BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()) AND usuario=@usuarioid) GROUP BY habito) AS A WHERE A.habito=@habitocontador)

		INSERT INTO dbo.AportesPorUsuario (aporte, cantidad, posttime, usuario)
		VALUES (@aporteid, @cantidad, GETDATE(), @usuarioid)


		SET @aporte = (SELECT nombre FROM dbo.Aportes WHERE dbo.Aportes.aporteid=@aporteid)

		
		SET @caption = @caption + '    ' +  @aporte + 'CANT: ' + CAST(@cantidad as nvarchar(100))
	END
	
	SET @habitocontador = @habitocontador + 1

	END

	INSERT INTO dbo.Resumenes (fecha, caption, usuario)
	VALUES (GETDATE(), @caption, @usuarioid)
	
	COMMIT
GO
/****** Object:  StoredProcedure [dbo].[HacerPosteo]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HacerPosteo] AS

	DECLARE @tag1 nvarchar(20)
	DECLARE @tag2 nvarchar(20)
	DECLARE @tag3 nvarchar(20)
	DECLARE @tag4 nvarchar(20)
	DECLARE @tag5 nvarchar(20)
	DECLARE @usuarioid bigint
	DECLARE @resumenid bigint
	DECLARE @caption nvarchar(500)
	DECLARE @URL nvarchar(128)
	DECLARE @redsocialid smallint
	DECLARE @URLredsocial nvarchar(50)
	DECLARE @postid bigint

	-- SE GENERA RESUMEN y SACO DATOS

	SET @usuarioid = FLOOR(RAND()*100000 + 1)

	EXEC GenerarResumen @usuarioid

	SET @resumenid = (SELECT MAX(resumenid) FROM dbo.Resumenes WHERE dbo.Resumenes.usuario=@usuarioid)

	SET @caption = (SELECT caption FROM dbo.Resumenes 
	WHERE dbo.Resumenes.usuario=@usuarioid AND dbo.Resumenes.resumenid=@resumenid)

	SET @redsocialid = (SELECT redsocial FROM ValidacionRRSS INNER JOIN Users ON ValidacionRRSS.validacionid=Users.validaciontoken WHERE Users.userid=@usuarioid)

	-- SE GENERAN LOS TAGS PARA EL URL Y SE HACE LA PUBLICACION

	SET @tag1 = FLOOR(RAND()*100000)
	SET @tag2 = FLOOR(RAND()*100000)
	SET @tag3 = FLOOR(RAND()*100000)
	SET @tag4 = FLOOR(RAND()*100000)
	SET @tag5 = FLOOR(RAND()*100000)

	BEGIN TRAN
					
	SET @URLredsocial = (SELECT URL FROM RedesSociales WHERE redessocialesid=@redsocialid)
	SET @URL = @URLredsocial + 'Tag1=' + @tag1 + 'Tag2=' + @tag2 + 'Tag3=' + @tag3 + 'Tag4=' + @tag4 + 'Tag5=' + @tag5

	INSERT INTO Publicaciones (caption, URL, fecha, deleted, updatepost, redsocial, usuario, resumen)
	VALUES (@caption, @URL, GETDATE(), 0, 0, @redsocialid, @usuarioid, @resumenid)

	SET @postid = (SELECT MAX(publicacionid) FROM dbo.Publicaciones)

	INSERT INTO dbo.Tags (tag, tipotag, referenceid)
	VALUES
	(@tag1, 1, @postid),
	(@tag2, 1, @postid),
	(@tag3, 1, @postid),
	(@tag4, 1, @postid),
	(@tag5, 1, @postid)

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[Insertar100kUsuarios]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insertar100kUsuarios] AS

	DECLARE @redsocialid smallint
	DECLARE @token bigint
	DECLARE @nombre nvarchar(100)
	DECLARE @apellido nvarchar(100)
	DECLARE @contador int

	SET @contador=0

	WHILE @contador < 100000 BEGIN

	SET @redsocialid = FLOOR(RAND()*(5-1)+1)

	IF NULLIF(@redsocialid, '') IS NULL
		continue


	--simulación de obtebción de token
	SET @token = FLOOR(RAND()*100000000000)

		INSERT INTO dbo.ValidacionRRSS (token, posttime, tokenvalido, redsocial, tiempo)
		VALUES (@token, GETDATE(), 1, @redsocialid, 100000000)

		-- simulo la obtencion de nombre

		SET @nombre = FLOOR(RAND()*10000)
		SET @apellido = FLOOR(RAND()*10000)

		INSERT INTO dbo.Users (nombre, apellido, username, deleted, validaciontoken)
		VALUES (@nombre, @apellido, 
		cast(@nombre as varchar(100))+cast(@apellido as varchar(100))+cast(FLOOR(RAND()*1000) as varchar(100)), 0, (SELECT MAX(validacionid) FROM dbo.ValidacionRRSS))

	SET @contador = @contador + 1

	END
GO
/****** Object:  StoredProcedure [dbo].[InsertarHabitos]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarHabitos] AS
INSERT INTO dbo.Habitos(nombre,descripcion,imagenURL,deleted,fechainicio,fechafinal,tipohabito)
VALUES 
('Reducir Pajillas','Reducción del uso de pajillas de plástico','imagen',0,'20210111','20210311',4),
('Reciclar Cartón','Reciclar el cartón','imagen',0,'20210115','20210115',1),
('Usar bolsas reutilizables','Uso de bolsas reutilizables en compras','imagen',0,'20200220','20200623',1),
('Reducir impresión de hojas','Reducción de imprimir hojas','imagen',0,'20210111','20210511',1),
('Durar menos bañandose','Durar menos tiempo bañandose para reducir agua','imagen',0,'20200502','20210111',2),
('Reducir la ingesta de carne','Reducción de la ingesta masiva de carne','imagen',0,'20201224','20212403',4),
('Reducir la compra de ropa masiva repetidamente','No comprar ropa masiva seguidamente','imagen',0,'20200813','20210518',1),
('Utilizar más el transporte público o bicicletas','Reducción del uso de carros y su humo','imagen',0,'20210219','20210601',5),
('Eliminar uso de plástico de un solo uso','Reducción de plástico de un solo uso','imagen',0,'20201027','20210412',1)
GO
/****** Object:  StoredProcedure [dbo].[InsertarTipoReacciones]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarTipoReacciones] AS
INSERT INTO dbo.TipoReaccion (nombre)
VALUES
('Me gusta'),
('Me encanta'),
('Me sorprende'),
('Me enoja'),
('Me entristese'),
('Me divierte')

GO
/****** Object:  StoredProcedure [dbo].[InsertarUbicacionesUsuarios]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarUbicacionesUsuarios] AS

DECLARE @contador int
DECLARE @latitud float
DECLARE @longitud float
DECLARE @localizacion geography


	SET @contador=1

	WHILE @contador < 100001 BEGIN

	SET @latitud = (RAND()*(91))
	SET @longitud = (RAND()*(181))

	IF (SELECT RAND())<0.5
		SET @latitud = @latitud*-1

	IF (SELECT RAND())<0.5
		SET @longitud = @longitud*-1

	SET @localizacion = geography::Point(@latitud, @longitud, 4326)


	INSERT INTO dbo.UbicacionesPorUsuario (localizacion, usuario, actual)
	VALUES ( @localizacion, @contador, 1)

	SET @contador = @contador+1

	END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarHabito]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarHabito]
	@nombre nvarchar(100),
	@descripcion nvarchar(100),
	@imagenURL nvarchar(128),
	@fechainicio datetime,
	@fechafinal datetime,
	@tipohabito nvarchar(100)
AS
	DECLARE @tipohabitoid smallint

	SET @tipohabitoid = (SELECT tipoid FROM dbo.TipoHabitos WHERE dbo.TipoHabitos.nombre=@tipohabito)

	IF NULLIF(@tipohabitoid, '') IS NULL
	BEGIN
		RAISERROR ('El tipo de hábito no existe, porfavor ingrese un tipo de hábito válido.', 1, 1) 
		RETURN
	END

	IF  NULLIF(@fechainicio, '') IS NOT NULL AND NULLIF(@fechafinal, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, fechafinal, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, @fechainicio, @fechafinal, 0)

	ELSE IF NULLIF(@fechainicio, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, @fechainicio, 0)

	ELSE IF NULLIF(@fechafinal, '') IS NOT NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, fechafinal, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, GETDATE(), @fechafinal, 0)

	ELSE IF NULLIF(@fechainicio, '') IS NULL AND NULLIF(@fechafinal, '') IS NULL
		INSERT INTO dbo.Habitos (nombre, descripcion, imagenURL, tipohabito, fechainicio, deleted)
		VALUES (@nombre, @descripcion, @imagenURL, @tipohabitoid, GETDATE(), 0)
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 25/06/2021 15:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario] 
	@redsocial nvarchar(50)
AS
	
	DECLARE @redsocialid smallint
	DECLARE @token bigint
	DECLARE @nombre nvarchar(100)
	DECLARE @apellido nvarchar(100)

	SET @redsocialid = (SELECT redessocialesid FROM dbo.RedesSociales WHERE dbo.RedesSociales.nombre = @redsocial)

	IF NULLIF(@redsocialid, '') IS NULL
	BEGIN
		RAISERROR ('La red social ingresada no existe, porfavor vuelva ingrese una red social válida.', 1, 1) 
		RETURN
	END

	--simulación de obtebción de token
	SET @token = FLOOR(RAND()*100000000000)

		INSERT INTO dbo.ValidacionRRSS (token, posttime, tokenvalido, redsocial, tiempo)
		VALUES (@token, GETDATE(), 1, @redsocialid, 100000000)

	BEGIN TRAN
		-- simulo la obtencion de nombre

		SET @nombre = FLOOR(RAND()*10000)
		SET @apellido = FLOOR(RAND()*10000)

		INSERT INTO dbo.Users (nombre, apellido, username, deleted, validaciontoken)
		VALUES (@nombre, @apellido, 
		cast(@nombre as varchar(100))+cast(@apellido as varchar(100))+cast(FLOOR(RAND()*1000) as varchar(100)), 0, (SELECT MAX(validacionid) FROM dbo.ValidacionRRSS))

	COMMIT
GO
USE [master]
GO
ALTER DATABASE [changeit] SET  READ_WRITE 
GO
