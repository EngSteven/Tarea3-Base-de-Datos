/****** Object:  Database [prueba2312]    Script Date: 11/11/2023 22:10:32 ******/
CREATE DATABASE [prueba2312]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [prueba2312] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [prueba2312] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba2312] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba2312] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba2312] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba2312] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba2312] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba2312] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba2312] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba2312] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba2312] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba2312] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba2312] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba2312] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba2312] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [prueba2312] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba2312] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [prueba2312] SET  MULTI_USER 
GO
ALTER DATABASE [prueba2312] SET ENCRYPTION ON
GO
ALTER DATABASE [prueba2312] SET QUERY_STORE = ON
GO
ALTER DATABASE [prueba2312] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedTableType [dbo].[Jornadas2]    Script Date: 11/11/2023 22:10:32 ******/
CREATE TYPE [dbo].[Jornadas2] AS TABLE(
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[Doc] [varchar](64) NULL,
	[NJornada] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Marcas]    Script Date: 11/11/2023 22:10:32 ******/
CREATE TYPE [dbo].[Marcas] AS TABLE(
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[Doc] [varchar](50) NULL,
	[Entrada] [int] NULL,
	[Salida] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Marcas2]    Script Date: 11/11/2023 22:10:32 ******/
CREATE TYPE [dbo].[Marcas2] AS TABLE(
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[Doc] [varchar](64) NULL,
	[Entrada] [smalldatetime] NULL,
	[Salida] [smalldatetime] NULL
)
GO
/****** Object:  Table [dbo].[AD]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AD](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[ValorDoc] [varchar](64) NULL,
	[IdTipoDeduc] [int] NULL,
	[Monto] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DD]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[ValorDoc] [varchar](64) NULL,
	[IdTipoDeduc] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DedeccionXEmpleado2]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DedeccionXEmpleado2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TipoDeduccion] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[EsActivo] [bit] NOT NULL,
 CONSTRAINT [PK_DedeccionXEmpleado2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionFijaNoObligatoria]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionFijaNoObligatoria](
	[idDeduccionXEmpleado] [int] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_DeduccionFijaNoObligatoria] PRIMARY KEY CLUSTERED 
(
	[idDeduccionXEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionPorcentualObligatoria]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionPorcentualObligatoria](
	[idTipoDeduccion] [int] NOT NULL,
	[Porcentaje] [float] NOT NULL,
 CONSTRAINT [PK_DeduccionPorcentualObligatoria] PRIMARY KEY CLUSTERED 
(
	[idTipoDeduccion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionXMesXEmpleado1]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionXMesXEmpleado1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdPlanillaXMesXEmpleado] [int] NOT NULL,
	[TotalDeDeduccion] [money] NOT NULL,
	[TipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_DeduccionXMesXEmpleado1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[id] [int] NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias2]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EE]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EE](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[ValorDoc] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados3]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados3](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
	[TipoDocIdentidad] [int] NOT NULL,
	[ValorDocIdentidad] [varchar](128) NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[EsActivo] [bit] NOT NULL,
	[FechaIni] [date] NOT NULL,
 CONSTRAINT [PK_Empleados3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LogDesciption] [varchar](2000) NOT NULL,
	[PostIdUser] [int] NULL,
	[PostIP] [varchar](64) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fechas2]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fechas2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriados]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feriados](
	[id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Feriados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeriadosInter]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeriadosInter](
	[id] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[FechaTexto] [varchar](32) NOT NULL,
 CONSTRAINT [PK_FeriadosInter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[TipoDeJornada] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_Jornada] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAsistencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[MarcaInicio] [smalldatetime] NOT NULL,
	[MarcaFin] [smalldatetime] NOT NULL,
	[IdJornada] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_MarcaAsistencia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesPlanilla](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK_MesPlanilla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoDeduccion]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoDeduccion](
	[idMovimientoPlanilla] [int] NOT NULL,
	[IdDeduccionXEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoDeduccion] PRIMARY KEY CLUSTERED 
(
	[idMovimientoPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoHoras]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoHoras](
	[idMovimientoPlanill] [int] NOT NULL,
	[IdMarcaAsistencia] [int] NOT NULL,
	[CantidadHoras] [int] NOT NULL,
	[TipoDeHoras] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MovimientoHoras] PRIMARY KEY CLUSTERED 
(
	[idMovimientoPlanill] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoPlanilla](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdPlanillaXSemanaXEmpleado] [int] NOT NULL,
	[TipoMov] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEP3]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEP3](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NULL,
	[TipoDoc] [int] NULL,
	[ValorDoc] [varchar](64) NULL,
	[IdDep] [int] NULL,
	[IdPues] [int] NULL,
	[Usuario] [varchar](32) NULL,
	[Pass] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroSemanasXMes]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroSemanasXMes](
	[idNumeroMes] [int] NULL,
	[QSemanas] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanillaXSemanaXEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanillaXSemanaXEmpleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[SalarioBruto] [money] NOT NULL,
	[SalarioNeto] [money] NOT NULL,
	[TotalDeDeducciones] [money] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdPlanillaXMesXEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_PanillaXSemanaXEmpleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanillaXMesXEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanillaXMesXEmpleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
	[SalarioBruto] [money] NOT NULL,
	[SalarioNeto] [money] NOT NULL,
	[TotalDeducciones] [money] NOT NULL,
 CONSTRAINT [PK_PlanillaXMesXEmpleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pruebas]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pruebas](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[Texto] [varchar](64) NULL,
	[Entero] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[id] [int] NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
	[SalarioXHora] [money] NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanilla](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
 CONSTRAINT [PK_SemanaPlanilla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablaIPR]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaIPR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IPR] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeduccion](
	[id] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[EsObligatoria] [bit] NOT NULL,
	[EsPorcentual] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDeduccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[id] [int] NOT NULL,
	[Nombre] [nchar](256) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[id] [int] NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
 CONSTRAINT [PK_TipoEvento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoJornada](
	[id] [int] NOT NULL,
	[Nombre] [varchar](256) NOT NULL,
	[HoraInicio] [time](0) NOT NULL,
	[HoraFin] [time](0) NOT NULL,
 CONSTRAINT [PK_TipoJornada] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoDeduccion]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoDeduccion](
	[idTipoMovimientoPlanilla] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_TipoMovimientoDeduccion] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimientoPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoPlanilla](
	[id] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeDeduccionesInter]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeDeduccionesInter](
	[id] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[EsObligatorio] [varchar](8) NOT NULL,
	[EsPorcentual] [varchar](8) NOT NULL,
	[Valor] [float] NOT NULL,
 CONSTRAINT [PK_TiposDeDeduccionesInter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario1]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario1](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](32) NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
	[Tipo] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
 CONSTRAINT [PK_Usuario1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdEmpleado] ON [dbo].[DedeccionXEmpleado2]
(
	[IdEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_TipoDeduccion]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_TipoDeduccion] ON [dbo].[DedeccionXEmpleado2]
(
	[TipoDeduccion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_idDeduccionXEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_idDeduccionXEmpleado] ON [dbo].[DeduccionFijaNoObligatoria]
(
	[idDeduccionXEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_idTipoDeduccion]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_idTipoDeduccion] ON [dbo].[DeduccionPorcentualObligatoria]
(
	[idTipoDeduccion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ValDoc]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_ValDoc] ON [dbo].[Empleados3]
(
	[ValorDocIdentidad] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdEmpleado] ON [dbo].[Jornada]
(
	[IdEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdSemanaPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdSemanaPlanilla] ON [dbo].[Jornada]
(
	[IdSemanaPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_MFechaFin]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_MFechaFin] ON [dbo].[MesPlanilla]
(
	[FechaFin] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_MFechaInicio]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_MFechaInicio] ON [dbo].[MesPlanilla]
(
	[FechaInicio] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdPlanillaXMesXEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdPlanillaXMesXEmpleado] ON [dbo].[PanillaXSemanaXEmpleado]
(
	[IdPlanillaXMesXEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_PIdEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_PIdEmpleado] ON [dbo].[PanillaXSemanaXEmpleado]
(
	[IdEmpleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_PIdSemanaPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_PIdSemanaPlanilla] ON [dbo].[PanillaXSemanaXEmpleado]
(
	[IdSemanaPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdMesPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdMesPlanilla] ON [dbo].[PlanillaXMesXEmpleado]
(
	[IdMesPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_FechaFin]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_FechaFin] ON [dbo].[SemanaPlanilla]
(
	[FechaFin] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_FechaInicio]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_FechaInicio] ON [dbo].[SemanaPlanilla]
(
	[FechaInicio] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDX_IdMesPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
CREATE NONCLUSTERED INDEX [INDX_IdMesPlanilla] ON [dbo].[SemanaPlanilla]
(
	[IdMesPlanilla] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DedeccionXEmpleado2]  WITH CHECK ADD  CONSTRAINT [FK_DedeccionXEmpleado2_Empleados3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados3] ([id])
GO
ALTER TABLE [dbo].[DedeccionXEmpleado2] CHECK CONSTRAINT [FK_DedeccionXEmpleado2_Empleados3]
GO
ALTER TABLE [dbo].[DedeccionXEmpleado2]  WITH CHECK ADD  CONSTRAINT [FK_DedeccionXEmpleado2_TipoDeduccion] FOREIGN KEY([TipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([id])
GO
ALTER TABLE [dbo].[DedeccionXEmpleado2] CHECK CONSTRAINT [FK_DedeccionXEmpleado2_TipoDeduccion]
GO
ALTER TABLE [dbo].[DeduccionFijaNoObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionFijaNoObligatoria_DedeccionXEmpleado2] FOREIGN KEY([idDeduccionXEmpleado])
REFERENCES [dbo].[DedeccionXEmpleado2] ([id])
GO
ALTER TABLE [dbo].[DeduccionFijaNoObligatoria] CHECK CONSTRAINT [FK_DeduccionFijaNoObligatoria_DedeccionXEmpleado2]
GO
ALTER TABLE [dbo].[DeduccionPorcentualObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionPorcentualObligatoria_TipoDeduccion] FOREIGN KEY([idTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([id])
GO
ALTER TABLE [dbo].[DeduccionPorcentualObligatoria] CHECK CONSTRAINT [FK_DeduccionPorcentualObligatoria_TipoDeduccion]
GO
ALTER TABLE [dbo].[DeduccionXMesXEmpleado1]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXMesXEmpleado1_PlanillaXMesXEmpleado] FOREIGN KEY([IdPlanillaXMesXEmpleado])
REFERENCES [dbo].[PlanillaXMesXEmpleado] ([id])
GO
ALTER TABLE [dbo].[DeduccionXMesXEmpleado1] CHECK CONSTRAINT [FK_DeduccionXMesXEmpleado1_PlanillaXMesXEmpleado]
GO
ALTER TABLE [dbo].[DeduccionXMesXEmpleado1]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXMesXEmpleado1_TipoDeduccion] FOREIGN KEY([TipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([id])
GO
ALTER TABLE [dbo].[DeduccionXMesXEmpleado1] CHECK CONSTRAINT [FK_DeduccionXMesXEmpleado1_TipoDeduccion]
GO
ALTER TABLE [dbo].[Empleados3]  WITH CHECK ADD  CONSTRAINT [FK_Empleados3_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([id])
GO
ALTER TABLE [dbo].[Empleados3] CHECK CONSTRAINT [FK_Empleados3_Departamento]
GO
ALTER TABLE [dbo].[Empleados3]  WITH CHECK ADD  CONSTRAINT [FK_Empleados3_Puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([id])
GO
ALTER TABLE [dbo].[Empleados3] CHECK CONSTRAINT [FK_Empleados3_Puesto]
GO
ALTER TABLE [dbo].[Empleados3]  WITH CHECK ADD  CONSTRAINT [FK_Empleados3_TipoDocumento] FOREIGN KEY([TipoDocIdentidad])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Empleados3] CHECK CONSTRAINT [FK_Empleados3_TipoDocumento]
GO
ALTER TABLE [dbo].[EventLog]  WITH CHECK ADD  CONSTRAINT [FK_EventLog_Usuario1] FOREIGN KEY([PostIdUser])
REFERENCES [dbo].[Usuario1] ([id])
GO
ALTER TABLE [dbo].[EventLog] CHECK CONSTRAINT [FK_EventLog_Usuario1]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_Empleados3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados3] ([id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_Empleados3]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_SemanaPlanilla] FOREIGN KEY([IdSemanaPlanilla])
REFERENCES [dbo].[SemanaPlanilla] ([id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_SemanaPlanilla]
GO
ALTER TABLE [dbo].[Jornada]  WITH CHECK ADD  CONSTRAINT [FK_Jornada_TipoJornada] FOREIGN KEY([TipoDeJornada])
REFERENCES [dbo].[TipoJornada] ([id])
GO
ALTER TABLE [dbo].[Jornada] CHECK CONSTRAINT [FK_Jornada_TipoJornada]
GO
ALTER TABLE [dbo].[MarcaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcaAsistencia_Empleados3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados3] ([id])
GO
ALTER TABLE [dbo].[MarcaAsistencia] CHECK CONSTRAINT [FK_MarcaAsistencia_Empleados3]
GO
ALTER TABLE [dbo].[MarcaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcaAsistencia_Jornada] FOREIGN KEY([IdJornada])
REFERENCES [dbo].[Jornada] ([id])
GO
ALTER TABLE [dbo].[MarcaAsistencia] CHECK CONSTRAINT [FK_MarcaAsistencia_Jornada]
GO
ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_DedeccionXEmpleado2] FOREIGN KEY([IdDeduccionXEmpleado])
REFERENCES [dbo].[DedeccionXEmpleado2] ([id])
GO
ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_DedeccionXEmpleado2]
GO
ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla] FOREIGN KEY([idMovimientoPlanilla])
REFERENCES [dbo].[MovimientoPlanilla] ([id])
GO
ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla]
GO
ALTER TABLE [dbo].[MovimientoHoras]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoHoras_MarcaAsistencia] FOREIGN KEY([IdMarcaAsistencia])
REFERENCES [dbo].[MarcaAsistencia] ([id])
GO
ALTER TABLE [dbo].[MovimientoHoras] CHECK CONSTRAINT [FK_MovimientoHoras_MarcaAsistencia]
GO
ALTER TABLE [dbo].[MovimientoHoras]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoHoras_MovimientoPlanilla] FOREIGN KEY([idMovimientoPlanill])
REFERENCES [dbo].[MovimientoPlanilla] ([id])
GO
ALTER TABLE [dbo].[MovimientoHoras] CHECK CONSTRAINT [FK_MovimientoHoras_MovimientoPlanilla]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_PanillaXSemanaXEmpleado] FOREIGN KEY([IdPlanillaXSemanaXEmpleado])
REFERENCES [dbo].[PanillaXSemanaXEmpleado] ([id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_PanillaXSemanaXEmpleado]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla] FOREIGN KEY([TipoMov])
REFERENCES [dbo].[TipoMovimientoPlanilla] ([id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla]
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PanillaXSemanaXEmpleado_Empleados3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados3] ([id])
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PanillaXSemanaXEmpleado_Empleados3]
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PanillaXSemanaXEmpleado_PlanillaXMesXEmpleado] FOREIGN KEY([IdPlanillaXMesXEmpleado])
REFERENCES [dbo].[PlanillaXMesXEmpleado] ([id])
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PanillaXSemanaXEmpleado_PlanillaXMesXEmpleado]
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PanillaXSemanaXEmpleado_SemanaPlanilla] FOREIGN KEY([IdSemanaPlanilla])
REFERENCES [dbo].[SemanaPlanilla] ([id])
GO
ALTER TABLE [dbo].[PanillaXSemanaXEmpleado] CHECK CONSTRAINT [FK_PanillaXSemanaXEmpleado_SemanaPlanilla]
GO
ALTER TABLE [dbo].[PlanillaXMesXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([id])
GO
ALTER TABLE [dbo].[PlanillaXMesXEmpleado] CHECK CONSTRAINT [FK_PlanillaXMesXEmpleado_MesPlanilla]
GO
ALTER TABLE [dbo].[SemanaPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_SemanaPlanilla_MesPlanilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([id])
GO
ALTER TABLE [dbo].[SemanaPlanilla] CHECK CONSTRAINT [FK_SemanaPlanilla_MesPlanilla]
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoDeduccion_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_TipoMovimientoDeduccion_TipoDeduccion]
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoDeduccion_TipoMovimientoPlanilla] FOREIGN KEY([idTipoMovimientoPlanilla])
REFERENCES [dbo].[TipoMovimientoPlanilla] ([id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_TipoMovimientoDeduccion_TipoMovimientoPlanilla]
GO
ALTER TABLE [dbo].[Usuario1]  WITH CHECK ADD  CONSTRAINT [FK_Usuario1_Empleados3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados3] ([id])
GO
ALTER TABLE [dbo].[Usuario1] CHECK CONSTRAINT [FK_Usuario1_Empleados3]
GO
/****** Object:  StoredProcedure [dbo].[AnadirEmpleados]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AnadirEmpleados]
	@inDatosXML XML
	, @outResultCode INT OUTPUT
AS
BEGIN

    SET NOCOUNT ON

    
	BEGIN TRY
	SET @outResultCode=0;


	DECLARE @Afectados INT = 0
			, @Ultima INT

	DECLARE @NuevosEmpleados TABLE(
		Sec INT IDENTITY(1,1)
		, Nombre VARCHAR(256)
		, TipoDoc INT
		, ValorDoc VARCHAR(64)
		, IdDep INT
		, IdPues INT 
		, Usuario VARCHAR(32)
		, Pass VARCHAR(32));

	
	INSERT INTO @NuevosEmpleados(
			Nombre
			, TipoDoc 
			, ValorDoc 
			, IdDep 
			, IdPues 
			, Usuario 
			, Pass
			)
	SELECT T.Item.value('@Nombre', 'VARCHAR(256)')
			, T.Item.value('@IdTipoDocumento', 'INT')
			, T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			, T.Item.value('@IdDepartamento', 'INT')
			, T.Item.value('@IdPuesto', 'INT')
			, T.Item.value('@Usuario', 'VARCHAR(32)')
			, T.Item.value('@Password', 'VARCHAR(32)')
	FROM @inDatosXML.nodes('(FechaOperacion/NuevosEmpleados/NuevoEmpleado)') as T(Item)
	SET @Afectados=@@ROWCOUNT

	IF NOT (@Afectados = 0)
	BEGIN
	BEGIN TRANSACTION Anadir

	INSERT INTO dbo.Empleados2(
				Nombre
				, TipoDocIdentidad	
				, ValorDocIndetidad	
				, IdDepartamento 
				, IdPuesto 
				, EsActivo
			)
	SELECT E.Usuario
			, E.TipoDoc
			, E.ValorDoc
			, E.IdDep
			, E.IdPues
			, 1
	FROM @NuevosEmpleados E
	ORDER BY E.SEC;

	SET @Ultima=SCOPE_IDENTITY();

	INSERT INTO dbo.Usuario1(
				Clave
				, Nombre
				, Tipo
				, IdEmpleado
			)
	SELECT E.Usuario
	       , E.Pass
		   , 2
		   , @Ultima-@Afectados+E.Sec
	FROM @NuevosEmpleados E
	ORDER BY E.SEC;

	COMMIT TRANSACTION Anadir
	END;

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode=50005;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarEmpleado] 
	  @inID INT
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64) 
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		
		--Nuevos datos del empleado
		DECLARE @nombre VARCHAR(256)
			, @tipoDocIdentidad INT
			, @valorDocIdentidad VARCHAR(128)
			, @idPuesto INT
			, @idDepartamento INT;

		DECLARE @ErrorDescription VARCHAR(100);
		DECLARE @LogDescription VARCHAR(2000)='{TipoAccion=<'
		
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error

		--Caso en el que el nombre ingresado ya exista
		IF NOT EXISTS (SELECT 1 FROM dbo.Empleados3 E 
		WHERE E.id = @inID AND E.EsActivo = 1)
		BEGIN
			  --procesar error
			SET @outResultCode=50001;		-- Nombre del articulo ya existe
			SET @ErrorDescription ='<Descripción del error: El empleado no existe.>}'
			SET @LogDescription =  
					@LogDescription +'Borrado de empleado no exitoso> Descripcion=<';
		END; 

		--Caso en el que los datos ingresados sean validos
		BEGIN
			SET @ErrorDescription = '<>}'
			SET @LogDescription =  
					@LogDescription +'Borrado de empleado exitoso> Descripcion=<';
					
		END; 

		-- Se obtienen los valores del empleado a borrar
		SELECT @nombre = E.Nombre
			,@tipoDocIdentidad = E.TipoDocIdentidad
			,@valorDocIdentidad = E.ValorDocIdentidad
			,@idDepartamento = E.IdDepartamento
			,@idPuesto = E.IdPuesto
		FROM dbo.Empleados3 E
		WHERE E.id = @inID

		SET @LogDescription = 
				@LogDescription 
				+ @nombre + '>, <'
				+ CAST(@tipoDocIdentidad AS VARCHAR) + '>, <'
				+ @valorDocIdentidad + '>, <'
				+ CAST(@idPuesto AS VARCHAR) + '>, <'
				+ CAST(@idDepartamento AS VARCHAR) + '>, '
				+ @ErrorDescription;
	
		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tBorrarEmpleado
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				, [PostIdUser]
				, [PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario);

			--Se hace el borrado logico del empleado
			UPDATE [dbo].[Empleados3] 
			SET [EsActivo] = 0
			WHERE [dbo].[Empleados3].id = @inID
			

		COMMIT TRANSACTION tBorrarEmpleado

	END TRY
	BEGIN CATCH
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0 
		BEGIN
			ROLLBACK TRANSACTION tBorrarEmpleado; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50005;
	
	END CATCH

	SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[BuscarEmpleadoPorId]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarEmpleadoPorId]
(
	@inIdEmpleado INT
    ,@inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

		DECLARE @Usuario INT = NULL

		SET @outResultCode=0;
		SELECT @outResultCode AS Error;
		
		--Inicia la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'+ CAST(@inIdEmpleado AS VARCHAR)+'>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 12
		-- Se devuelve los datos del empleado
		SELECT E.Nombre
			, TD.Nombre
			, E.ValorDocIdentidad
			, P.Nombre 
			, D.Nombre
		FROM dbo.Empleados3 E
		INNER JOIN dbo.TipoDocumento TD ON E.TipoDocIdentidad = TD.id
		INNER JOIN dbo.Puesto P ON E.IdPuesto = P.id
		INNER JOIN dbo.Departamento D ON E.IdDepartamento = D.id
		WHERE E.id = @inIdEmpleado


		-- se devuelve el catalogo de tipo documento
		SELECT TD.Nombre
		FROM dbo.TipoDocumento TD

		-- se devuelve el catalogo de puesto
		SELECT P.Nombre
		FROM dbo.Puesto P

		-- se devuelve el catagolo de departamentos
		SELECT D.Nombre
		FROM dbo.Departamento D

		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)
		COMMIT TRANSACTION tRegistroLog

		END TRY
	BEGIN CATCH
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog;
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50005;
		SELECT @outResultCode AS Error;
	END CATCH

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarUsuario]
(
    @inUsuario VARCHAR(32)
	, @inClave VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

		DECLARE @Usuario INT = NULL
		DECLARE @idEmpleado INT = 0
		DECLARE @tipoUsuario INT = 0

		SET @outResultCode=0;
		SELECT @outResultCode AS Error;
		
		--Inicia la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)='{TipoAccion=<'

		--Si el articulo no existe, devuelva error, sino seleccione el id del usuario. Siempre temine la descripcion del evento.
		IF NOT EXISTS (SELECT 1 FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario AND A.Clave=@inClave))
		BEGIN
			SET @outResultCode=50001;		
			SET @LogDescription = @LogDescription+'Login no exitoso> Descripcion=<null>}';
		END
		ELSE
		BEGIN
			SET @LogDescription = @LogDescription+'Login exitoso> Descripcion=<'+ @inUsuario+'>}';
			SELECT @Usuario = A.id 
				   , @tipoUsuario = A.Tipo
				   , @idEmpleado = A.idEmpleado
			FROM dbo.Usuario1 A 
			WHERE (A.Nombre=@inUsuario AND A.Clave=@inClave)

			SELECT @tipoUsuario 

			IF (@tipoUsuario = 2)
			BEGIN
				SELECT E.id
				FROM dbo.Empleados3 E
				WHERE (E.id = @idEmpleado)
			END

		END; 

		--Realice el registro
		BEGIN TRANSACTION tRegistroLog  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				, [PostIdUser]
				, [PostIP]
				, [PostTime]
				, [UsuarioId])
			SELECT 
				@LogDescription
				, @Usuario
				, @inIP
				, GETDATE()
				, @Usuario

		COMMIT TRANSACTION tRegistroLog

		END TRY
	BEGIN CATCH
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog;
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50005;
	
	END CATCH

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[CargarDatos]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarDatos]
	@inDatosXML XML
	, @outResultCode INT OUTPUT
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
	SET @outResultCode=0;
	BEGIN TRANSACTION COPIARTABLA
	INSERT INTO dbo.TipoDocumento (
			id
			, Nombre)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(256)')
    FROM @inDatosXML.nodes('Catalogos/TiposdeDocumentodeIdentidad/TipoDocuIdentidad') as T(Item)

	INSERT INTO dbo.TipoJornada(
			id
			, Nombre
			, HoraInicio
			, HoraFin)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(256)')
		   , T.Item.value('@HoraInicio', 'TIME(0)')
		   , T.Item.value('@HoraFin', 'TIME(0)')
    FROM @inDatosXML.nodes('Catalogos/TiposDeJornadas/TipoDeJornada') as T(Item)

	INSERT INTO dbo.Puesto(
			id
			, Nombre
			, SalarioXHora)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(256)')
		   , T.Item.value('@SalarioXHora', 'MONEY')
    FROM @inDatosXML.nodes('Catalogos/Puestos/Puesto') as T(Item)

	INSERT INTO dbo.Departamento(
			id
			, Nombre)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(256)')
    FROM @inDatosXML.nodes('Catalogos/Departamentos/Departamento') as T(Item)

	INSERT INTO dbo.FeriadosInter(
			id
			, Nombre
			, FechaTexto)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(128)')
		   , T.Item.value('@Fecha', 'VARCHAR(32)')
    FROM @inDatosXML.nodes('Catalogos/Feriados/Feriado') as T(Item)

	INSERT INTO dbo.TipoMovimientoPlanilla(
			id
			, Nombre)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(128)')
    FROM @inDatosXML.nodes('Catalogos/TiposDeMovimiento/TipoDeMovimiento') as T(Item)

	INSERT INTO dbo.TiposDeDeduccionesInter(
			id
			, Nombre
			, EsObligatorio
			, EsPorcentual
			, Valor)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(128)')
		   , T.Item.value('@Obligatorio', 'VARCHAR(8)')
		   , T.Item.value('@Porcentual', 'VARCHAR(8)')
		   , T.Item.value('@Valor', 'FLOAT')
    FROM @inDatosXML.nodes('Catalogos/TiposDeDeduccion/TipoDeDeduccion') as T(Item)

	INSERT INTO dbo.Usuario1(
			Clave
			, Nombre
			, Tipo)
	SELECT T.Item.value('@Pwd', 'VARCHAR(32)')
		   , T.Item.value('@Username', 'VARCHAR(32)')
		   , T.Item.value('@tipo', 'INT')
    FROM @inDatosXML.nodes('Catalogos/UsuariosAdministradores/Usuario') as T(Item)

	INSERT INTO dbo.TipoEvento(
			id
			, Nombre)
	SELECT T.Item.value('@Id', 'INT')
	       , T.Item.value('@Nombre', 'VARCHAR(256)')
    FROM @inDatosXML.nodes('Catalogos/TiposdeEvento/TipoEvento') as T(Item)

	EXEC dbo.CopiarInterDeduc
	EXEC dbo.CopiarInterFeri

	COMMIT TRANSACTION COPIARTABLA 
	SET @outResultCode=1;
	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode=50005;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[CargarDatosDiarios]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarDatosDiarios]
	@inDatosXML XML
	, @outResultCode INT OUTPUT
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
	SET @outResultCode=55;

	CREATE TABLE #ProximaJornada(
		Sec INT IDENTITY(1,1)
		, ValorDoc VARCHAR(64)
		, tipoJ INT
	)

	CREATE TABLE #NEP3(
	Sec INT IDENTITY(1,1)
	, Nombre VARCHAR(256)
	, TipoDoc INT
	, ValorDoc VARCHAR(64)
	, IdDep INT
	, IdPues INT
	, Usuario VARCHAR(32)
	, Pass VARCHAR(32)
	) 

	CREATE TABLE #EE(
	Sec INT IDENTITY(1,1)
	, ValorDoc VARCHAR(64)
	)

	CREATE TABLE #MarcasAsis(
		Sec INT IDENTITY(1,1)
		, Doc VARCHAR(64)
		, Entrada SMALLDATETIME
		, Salida SMALLDATETIME
	)

	CREATE TABLE #AD(
	Sec INT IDENTITY(1,1) 
	, ValorDoc VARCHAR(64) 
	, IdTipoDeduc INT
	, Monto MONEY
	)

	CREATE TABLE #DD(
	Sec INT IDENTITY(1,1) 
	, ValorDoc VARCHAR(64) 
	, IdTipoDeduc INT
	)
	--DECLARE @outResultCode INT

	DECLARE @NumeroFechas INT
			, @NumeroEmpleados INT
			, @NumeroEliminar INT
			, @NumeroAsociar INT
			, @NumeroDesasociar INT
			, @NumeroAsistencia INT
			, @NumeroJornada INT
			, @NumeroMarcas INT
			, @contador INT = 1
			, @nodoAct XML
			, @empleadoAct XML
			, @Ultima INT
			, @ciclo INT
			, @EliminarAct VARCHAR(64)
			, @FechaAct DATE
			, @idEmpAct INT
			, @TipoDeduc INT 
			, @Porcent	BIT 
			, @montoA MONEY
			, @ultimoIdJ INT
			, @semanaAct INT
			, @QGEmpleados INT = 0
			, @QEmpleados INT = 0
			, @UltimoEmpleadoId INT
			, @EsPorcentual BIT
			, @MontoID INT
			, @IPS VARCHAR(128)

	DECLARE @MarcasA AS Marcas2
	DECLARE @NJornadas AS Jornadas2

	DECLARE @Fechas TABLE(
		id INT IDENTITY
		,Fecha DATE
	)

	DECLARE @meet TABLE(
		id INT IDENTITY
		,lol XML
	)

	DECLARE @NuevosEmpleados TABLE(
		Sec INT IDENTITY(1,1)
		, Nombre VARCHAR(256)
		, TipoDoc INT
		, ValorDoc VARCHAR(64)
		, IdDep INT
		, IdPues INT 
		, Usuario VARCHAR(32)
		, Pass VARCHAR(32)
	)

	DECLARE @EliminarEmpleados TABLE(
		Sec INT IDENTITY(1,1)
		, ValorDoc VARCHAR(64)
	)

	DECLARE @AsociarDeducciones TABLE(
		Sec INT IDENTITY(1,1)
		, ValorDoc VARCHAR(64)
		, IdTipoDeduc INT
		, Monto MONEY
	)

	DECLARE @DesasociarDeducciones TABLE(
		ValorDoc VARCHAR(64)
		, IdTipoDeduc INT
	)

	DECLARE @MarcaDeAsistencia TABLE(
		ValorDoc VARCHAR(64)
		, HInicio SMALLDATETIME
		, HSalida SMALLDATETIME
	)

	DECLARE @LogDescription VARCHAR(2000)

	INSERT INTO @Fechas (
			Fecha)
	SELECT E.Nombre
    FROM Fechas2 E
	
	SET @NumeroFechas=@@ROWCOUNT

	SET @outResultCode = 0

	SELECT @IPS = A.IPR
	FROM dbo.TablaIPR A 
	WHERE (A.id = 1)

	WHILE @contador <= @NumeroFechas
	BEGIN

		SELECT @nodoAct = E.Dia
		FROM dbo.Dias2 E
		WHERE E.id = @contador

		SELECT @FechaAct = E.Nombre
		FROM dbo.Fechas2 E
		WHERE E.id =  @contador

		IF @FechaAct = '2023-07-06'
		BEGIN
			SET @semanaAct = 1
		END;
		ELSE
		BEGIN
			SELECT @semanaAct = E.id+1
			FROM dbo.SemanaPlanilla E
			WHERE @FechaAct <= E.FechaFin AND E.FechaInicio <= @FechaAct
		END;
		--------------------------------------------------------------------
		INSERT INTO #NEP3(
			Nombre
			, TipoDoc 
			, ValorDoc 
			, IdDep 
			, IdPues 
			, Usuario 
			, Pass
			)
		SELECT T.Item.value('@Nombre', 'VARCHAR(256)')
			, T.Item.value('@IdTipoDocumento', 'INT')
			, T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			, T.Item.value('@IdDepartamento', 'INT')
			, T.Item.value('@IdPuesto', 'INT')
			, T.Item.value('@Usuario', 'VARCHAR(32)')
			, T.Item.value('@Password', 'VARCHAR(32)')
		FROM @nodoAct.nodes('(FechaOperacion/NuevosEmpleados/NuevoEmpleado)') as T(Item)
		SET @NumeroEmpleados=@@ROWCOUNT
		SET @QGEmpleados=@QGEmpleados+@NumeroEmpleados
		SET @QEmpleados=@QEmpleados+@NumeroEmpleados

		SET @ciclo = 1

		WHILE @ciclo<= @NumeroEmpleados
		BEGIN
			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 5

			INSERT INTO dbo.Empleados3(
					Nombre
					, TipoDocIdentidad	
					, ValorDocIdentidad	
					, IdDepartamento 
					, IdPuesto 
					, EsActivo
					, FechaIni
				)
			SELECT E.Nombre
					, E.TipoDoc
					, E.ValorDoc
					, E.IdDep
					, E.IdPues
					, 1
					, @FechaAct
			FROM #NEP3 E
			WHERE E.Sec = @ciclo

			SET @Ultima=SCOPE_IDENTITY()

			SELECT @LogDescription = 
					@LogDescription + CAST(@Ultima AS VARCHAR) + '>, <' 
					+ CAST(E.Nombre AS VARCHAR) + '>, <' 
					+ CAST(E.TipoDocIdentidad AS VARCHAR) + '>, <' 
					+ CAST(E.ValorDocIdentidad AS VARCHAR) + '>, <' 
					+ CAST(E.IdDepartamento  AS VARCHAR) + '>, <' 
					+ CAST(E.IdPuesto AS VARCHAR) + '>, <' 
					+ CAST(E.EsActivo AS VARCHAR) + '>, <' 
					+ CAST(E.FechaIni AS VARCHAR) + '>}'
			FROM dbo.Empleados3 E
			WHERE E.id = @Ultima

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)


			SET @ciclo = @ciclo+1
		END;
		

		INSERT INTO dbo.Usuario1(
				Clave
				, Nombre
				, Tipo
				, IdEmpleado)
		SELECT E.Pass
			   , E.Usuario
		       , 2
		       , @Ultima-@NumeroEmpleados+E.Sec
		FROM #NEP3 E
		ORDER BY E.Sec;


		INSERT INTO #EE(
				ValorDoc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
		FROM @nodoAct.nodes('(FechaOperacion/EliminarEmpleados/EliminarEmpleado)') as T(Item)

		SET @NumeroEliminar=@@ROWCOUNT
		SET @ciclo = 1

		WHILE @ciclo<=@NumeroEliminar
		BEGIN
			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 6

			SELECT @EliminarAct = E.ValorDoc
			FROM #EE E
			WHERE E.Sec =  @ciclo

			SELECT @LogDescription = 
					@LogDescription + CAST(E.id AS VARCHAR) + '>, <' 
					+ CAST(E.Nombre AS VARCHAR) + '>, <' 
					+ CAST(E.TipoDocIdentidad AS VARCHAR) + '>, <' 
					+ CAST(E.ValorDocIdentidad AS VARCHAR) + '>, <' 
					+ CAST(E.IdDepartamento  AS VARCHAR) + '>, <' 
					+ CAST(E.IdPuesto AS VARCHAR) + '>, <' 
					+ CAST(E.EsActivo AS VARCHAR) + '>, <' 
					+ CAST(E.FechaIni AS VARCHAR) + '>}'
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)
		
			UPDATE dbo.Empleados3
				SET EsActivo = 0
				WHERE dbo.Empleados3.ValorDocIdentidad = @EliminarAct

			SET @ciclo = @ciclo+1
		END;

		----------------------------------------------------------------------------------------
		INSERT INTO  #AD(
				ValorDoc 
		        , IdTipoDeduc
			    , Monto)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
			   , T.Item.value('@Monto', 'MONEY')
		FROM @nodoAct.nodes('(FechaOperacion/AsociacionEmpleadoDeducciones/AsociacionEmpleadoConDeduccion)') as T(Item)
		SET @NumeroAsociar=@@ROWCOUNT
		SET @ciclo = 1
		
		WHILE @ciclo<=@NumeroAsociar
		BEGIN

			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 7

			SELECT @TipoDeduc = E.IdTipoDeduc
			FROM  #AD E
			WHERE E.Sec = @ciclo
			PRINT(@TipoDeduc)

			
			SELECT @Porcent = E.EsPorcentual
			FROM  dbo.TipoDeduccion E
			WHERE E.id = @TipoDeduc

			SELECT @EliminarAct = E.ValorDoc
			FROM  #AD E
			WHERE E.Sec = @ciclo

			SELECT @montoA = E.Monto
			FROM  #AD E
			WHERE E.Sec = @ciclo
			
			SELECT @idEmpAct = E.id
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct
			
			INSERT INTO dbo.DedeccionXEmpleado2(
						TipoDeduccion
						, IdEmpleado
						, FechaInicio
						, EsActivo)
			SELECT @TipoDeduc
				   , @idEmpAct
				   , @FechaAct
				   , 1	

			SET @Ultima=SCOPE_IDENTITY()
			IF @Porcent=0
			BEGIN
				INSERT INTO dbo.DeduccionFijaNoObligatoria(
						idDeduccionXEmpleado
						, Monto)
				SELECT @Ultima
					   , @montoA 
			END;

			SELECT @LogDescription =
					@LogDescription + CAST(@idEmpAct AS VARCHAR) + '>, <' 
					+ CAST(@TipoDeduc AS VARCHAR) + '>, <'	
					+ 'N/A>, <' 
					+ CAST(@montoA  AS VARCHAR) + '>}'

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)

			SET @ciclo = @ciclo+1
		END;
		-----------------------------------------------------------------------------------------
		INSERT INTO #DD(
				ValorDoc 
		        , IdTipoDeduc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
		FROM @nodoAct.nodes('(FechaOperacion/DesasociacionEmpleadoDeducciones/DesasociacionEmpleadoConDeduccion)') as T(Item)
		SET @NumeroDesasociar=@@ROWCOUNT
		SET @ciclo = 1

		WHILE @ciclo<=@NumeroDesasociar
		BEGIN
			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 8

			SELECT @EliminarAct = E.ValorDoc
				   , @TipoDeduc = E.IdTipoDeduc
			FROM #DD E
			WHERE E.Sec = @ciclo

			SELECT @idEmpAct = E.id
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct

			SELECT @LogDescription = 
					@LogDescription + CAST(@idEmpAct AS VARCHAR) + '>, <' 
					+ CAST(@TipoDeduc AS VARCHAR) + '>}' 

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)
		
			UPDATE dbo.DedeccionXEmpleado2
				SET EsActivo = 0
				WHERE dbo.DedeccionXEmpleado2.IdEmpleado = @idEmpAct AND dbo.DedeccionXEmpleado2.TipoDeduccion = @TipoDeduc
			SET @ciclo = @ciclo+1
		END;
		-------------------------------------------------------------------
		INSERT INTO @MarcasA(
				Doc
		        , Entrada
		        , Salida)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@HoraEntrada', 'SMALLDATETIME')
			   , T.Item.value('@HoraSalida', 'SMALLDATETIME')
		FROM @nodoAct.nodes('(FechaOperacion/MarcasAsistencia/MarcaDeAsistencia)') as T(Item)

		INSERT INTO #MarcasAsis(
				Doc
		        , Entrada
		        , Salida)
		SELECT E.Doc
			   , E.Entrada
			   , E.Salida
		FROM @MarcasA E	

		SET @NumeroMarcas = @@ROWCOUNT

		SET @ciclo = 1

		WHILE @ciclo <= @NumeroMarcas
		BEGIN
			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 14

			SELECT @EliminarAct = E.Doc
			FROM  #MarcasAsis E
			WHERE E.Sec = @ciclo
			
			SELECT @idEmpAct = E.id
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct

			SELECT @LogDescription = 
						@LogDescription + CAST(@idEmpAct AS VARCHAR) + '>, <' 
						+ CAST(E.Entrada AS VARCHAR) + '>, <'
						+ CAST(E.Salida AS VARCHAR) + '>}'
			FROM  #MarcasAsis E
			WHERE E.Sec = @ciclo

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)

			SET @ciclo = @ciclo + 1
		END;

		INSERT INTO @NJornadas(
					Doc
					, NJornada)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
				, T.Item.value('@IdTipoJornada', 'INT')
		FROM @nodoAct.nodes('(FechaOperacion/JornadasProximaSemana/TipoJornadaProximaSemana)') as T(Item)

		INSERT INTO #ProximaJornada(
					ValorDoc
					, tipoJ)
		SELECT E.Doc
			   , E.NJornada
		FROM @NJornadas E	

		SET @NumeroJornada=@@ROWCOUNT

		SET @ciclo = 1

		WHILE @ciclo <= @NumeroJornada
		BEGIN
			SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'
			FROM dbo.TipoEvento E
			WHERE E.id = 15

			SELECT @EliminarAct = E.ValorDoc
			FROM  #ProximaJornada E
			WHERE E.Sec = @ciclo
			
			SELECT @idEmpAct = E.id
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct

			SELECT @LogDescription = 
						@LogDescription + CAST(@idEmpAct AS VARCHAR) + '>, <' 
						+ CAST(E.tipoJ AS VARCHAR) + '>}'
			FROM  #ProximaJornada E
			WHERE E.Sec = @ciclo

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			VALUES 
				(@LogDescription
				, 1
				, @IPS
				, GETDATE()
				, 1)

			SET @ciclo = @ciclo + 1
		END;


		EXEC dbo.PorcesarM @MarcasA, @NJornadas, @QGEmpleados, @QEmpleados, @FechaAct, @outResultCode OUT


		IF  DATEPART(DW,@FechaAct) = 5
		BEGIN
			SET @QGEmpleados=0
		END;
		
		SET @contador = @contador+1
		DELETE FROM @MarcasA

		DELETE FROM @NJornadas
		DELETE FROM #ProximaJornada
		DBCC CHECKIDENT (#ProximaJornada, RESEED, 0)
		DELETE FROM #MarcasAsis
		DBCC CHECKIDENT (#MarcasAsis, RESEED, 0)
		DELETE FROM #AD
		DBCC CHECKIDENT (#AD, RESEED, 0)
		DELETE FROM #DD
		DBCC CHECKIDENT (#DD, RESEED, 0)
		DELETE FROM #EE
		DBCC CHECKIDENT (#EE, RESEED, 0)
		DELETE FROM #NEP3
		DBCC CHECKIDENT (#NEP3, RESEED, 0)
	END;

	SET @outResultCode = 0
	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode = 50001
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CargarDatosSimulacion]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarDatosSimulacion]
(
	@inDatosXML XML
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT
)
AS
BEGIN
	--Este SP carga los datos de la simulacion, ademas de la IP de donde se cargan los datos.
    SET NOCOUNT ON

    BEGIN TRY

	BEGIN TRANSACTION tProcesarDatos

	DELETE FROM Fechas2
	DBCC CHECKIDENT (Fechas2, RESEED, 0)
	DELETE FROM Dias2
	DBCC CHECKIDENT (Dias2, RESEED, 0)
	DELETE FROM TablaIPR
	DBCC CHECKIDENT (TablaIPR, RESEED, 0)

	INSERT INTO dbo.Fechas2 (
			Nombre)
	SELECT T.Item.value('@Fecha', 'DATE')
    FROM @inDatosXML.nodes('Operacion/FechaOperacion') as T(Item) 
	
	INSERT INTO dbo.Dias2(
			    Dia)
	SELECT T.Item.query('.')
	FROM @inDatosXML.nodes('(Operacion/FechaOperacion)') as T(Item)

	INSERT INTO dbo.TablaIPR (IPR) VALUES (@inIP) 

	COMMIT TRANSACTION tProcesarDatos

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tProcesarDatos; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CopiarInterDeduc]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopiarInterDeduc]

AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
	DECLARE @cont INT = 1
			, @obl VARCHAR(8)
			, @por VARCHAR(8)
			, @bitObl BIT 
			, @bitPor BIT

	BEGIN TRANSACTION COPIARTABLA

	WHILE (@cont <= 6)
	BEGIN
		SELECT @obl = E.EsObligatorio
			   , @por = E.EsPorcentual
		FROM dbo.TiposDeDeduccionesInter E
		WHERE E.id = @cont

		IF @obl = 'Si'
		BEGIN
		SET @bitObl = 1
		END;
		ELSE
		BEGIN
		SET  @bitObl = 0
		END;

		IF @por = 'Si'
		BEGIN
		SET  @bitPor = 1
		END;
		ELSE
		BEGIN
		SET  @bitPor = 0
		END;

		INSERT INTO dbo.TipoDeduccion(
				id
				, Nombre
				, EsObligatoria
				, EsPorcentual)
		SELECT @cont
			   , E.Nombre
			   , @bitObl
			   , @bitPor
		FROM dbo.TiposDeDeduccionesInter E
		WHERE E.id = @cont

		IF @bitPor = 1
		BEGIN
		INSERT INTO dbo.DeduccionPorcentualObligatoria(
				idTipoDeduccion
				, Porcentaje)
		SELECT @cont
			   , E.Valor
		FROM dbo.TiposDeDeduccionesInter E
		WHERE E.id = @cont
		END;
		SET @cont = @cont+1
	END;
	COMMIT TRANSACTION COPIARTABLA 
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CopiarInterFeri]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CopiarInterFeri]

AS
BEGIN
    SET NOCOUNT ON
	BEGIN TRY
	DECLARE @Inicio BIT = 1

	BEGIN TRANSACTION COPIARTABLA
	INSERT INTO [dbo].[Feriados] ([id]
      ,[Nombre]
      ,[Fecha])
	SELECT A.id
	, A.Nombre
	, CAST(A.FechaTexto AS DATE)
	FROM dbo.FeriadosInter A



	COMMIT TRANSACTION COPIARTABLA 
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DetallesMesPlanillaDeduc]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DetallesMesPlanillaDeduc]
(
    @inIdMesPlanilla	INT
    , @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

    BEGIN TRY

	DECLARE @QDeducciones INT
			, @ciclo INT = 1
			, @DeducAct INT
			, @DeducEmpleadoAct INT
			, @TipoAct INT
			, @NombreTipo VARCHAR(128)
			, @EsPorcentual BIT
			, @Porcentaje FLOAT


	DECLARE @Deducciones TABLE (
		Sec INT IDENTITY(1,1)
		, IdDeduc INT
		, Monto MONEY
		, Tipo INT)

	DECLARE @Salida TABLE (
		Sec INT IDENTITY(1,1)
		, Nombre VARCHAR(128)
		, Porcentaje FLOAT
		, Monto MONEY)


	SET @outResultCode=0;
	SELECT @outResultCode AS Error;

	INSERT INTO @Deducciones(
				IdDeduc 
				, Monto
				, Tipo)
	SELECT E.id
		   , E.TotalDeDeduccion
		   , E.TipoDeduccion
	FROM dbo.DeduccionXMesXEmpleado1 E
	WHERE E.IdPlanillaXMesXEmpleado = @inIdMesPlanilla

	SET @QDeducciones = @@ROWCOUNT

	WHILE @ciclo <= @QDeducciones
	BEGIN

		SELECT @DeducAct = E.IdDeduc
		FROM @Deducciones E
		WHERE E.Sec = @ciclo


		SELECT @TipoAct = E.Tipo
		FROM @Deducciones E
		WHERE E.Sec = @ciclo

		SELECT @NombreTipo = E.Nombre
			   , @EsPorcentual = E.EsPorcentual
		FROM dbo.TipoDeduccion E
		WHERE E.id = @TipoAct

		IF @EsPorcentual = 1
		BEGIN

			SELECT @Porcentaje = E.Porcentaje
			FROM DeduccionPorcentualObligatoria E
			WHERE E.idTipoDeduccion = @TipoAct

		END;
		ELSE
		BEGIN

			SET @Porcentaje = 0

		END;


		INSERT INTO @Salida(
					Nombre 
					, Porcentaje 
					, Monto)
		SELECT @NombreTipo
			   , @Porcentaje
			   , E.Monto
		FROM @Deducciones E
		WHERE E.Sec = @ciclo

		SET @ciclo = @ciclo + 1
	END;

	SELECT E.Nombre
			, E.Porcentaje
			, E.Monto
	FROM @Salida E

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DetallesSemanaPlanilla]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DetallesSemanaPlanilla]
(
     @inIdSemanaPlanilla	INT
    , @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

	DECLARE @SemanaAct INT
			, @Empleado INT
			, @QMarcas INT
			, @ciclo INT = 1
			, @ciclo2 INT = 1
			, @HOrdinaria INT
			, @HExtra INT
			, @HDoble INT
			, @MHOrdinaria MONEY
			, @MHExtra MONEY
			, @MHDoble MONEY
			, @MarcaAct INT
			, @MovXMarca INT
			, @idMovAct INT
			, @TipoAct VARCHAR(32)
			, @QHoras INT
			, @MontoAct MONEY


	DECLARE @Marcas TABLE (
		Sec INT IDENTITY(1,1)
		, IdMarca INT
		, Fechas DATE
		, Ini SMALLDATETIME 
		, Fin SMALLDATETIME )

	DECLARE @Salida TABLE (
		Sec INT IDENTITY(1,1)
		, Fechas DATE
		, Ini SMALLDATETIME 
		, Fin SMALLDATETIME 
		, QOrdi INT
		, MQOrdi MONEY
		, QExtra INT
		, MQExtra MONEY
		, QDoble INT
		, MQDoble MONEY)

	CREATE TABLE #Horas(
		Sec INT IDENTITY(1,1)
		, IdMov INT
		, Tipo VARCHAR(32)
		, Horas INT
		, Monto MONEY
	)

	SET @outResultCode=0;
	SELECT @outResultCode AS Error;

	SELECT @SemanaAct = E.IdSemanaPlanilla
		   , @Empleado = E.IdEmpleado
	FROM dbo.PanillaXSemanaXEmpleado E
	WHERE E.id = @inIdSemanaPlanilla

	INSERT INTO @Marcas(
				IdMarca 
				, Fechas 
				, Ini 
				, Fin)
	SELECT E.id
		   , E.Fecha
		   , E.MarcaInicio
		   , E.MarcaFin
	FROM dbo.MarcaAsistencia E
	INNER JOIN dbo.Jornada CE ON CE.id = E.IdJornada
	WHERE CE.IdSemanaPlanilla = @SemanaAct AND E.IdEmpleado = @Empleado

	SET @QMarcas = @@ROWCOUNT

	WHILE @ciclo <= @QMarcas  
	BEGIN
		
		SELECT @HOrdinaria = 0
			   , @HExtra = 0
			   , @HDoble = 0
			   , @MHOrdinaria = 0
			   , @MHExtra = 0
			   , @MHDoble = 0

		SELECT @MarcaAct = E.IdMarca
		FROM @Marcas E
		WHERE E.Sec = @ciclo

		INSERT INTO #Horas(
					IdMov
					, Tipo
					, Horas
					, Monto)
		SELECT E.idMovimientoPlanill
			   , E.TipoDeHoras
			   , E.CantidadHoras
			   , CE.Monto
		FROM dbo.MovimientoHoras E
		INNER JOIN dbo.MovimientoPlanilla CE ON CE.id= E.idMovimientoPlanill
		WHERE E.IdMarcaAsistencia = @MarcaAct

		SET @MovXMarca = @@ROWCOUNT

		SET @ciclo2 = 1

		WHILE @ciclo2 <= @MovXMarca
		BEGIN

			SELECT @idMovAct = E.IdMov
				   , @TipoAct = E.Tipo
				   , @QHoras = E.Horas
				   , @MontoAct = E.Monto
			FROM #Horas E
			WHERE E.Sec = @ciclo2

			IF @TipoAct = 'Ordinarias'
			BEGIN

			SELECT @HOrdinaria =  @HOrdinaria + @QHoras
			SELECT @MHOrdinaria =  @MHOrdinaria + @MontoAct 

			END;
			IF @TipoAct = 'Extras'
			BEGIN

			SELECT @HExtra =  @HExtra + @QHoras
			SELECT @MHExtra =  @MHExtra + @MontoAct 
			END;
			IF @TipoAct = 'Dobles'
			BEGIN

			SELECT @HDoble =  @HDoble + @QHoras
			SELECT @MHDoble =  @MHDoble + @MontoAct 
			END;


			SET @ciclo2 = @ciclo2 + 1
		END;

		INSERT INTO @Salida(
					Fechas 
					, Ini 
					, Fin 
					, QOrdi 
					, MQOrdi 
					, QExtra 
					, MQExtra 
					, QDoble 
					, MQDoble)
		SELECT E.Fechas
				, E.Ini
				, E.Fin
				, @HOrdinaria
				, @MHOrdinaria
				, @HExtra
				, @MHExtra
				, @HDoble
				, @MHDoble
		FROM @Marcas E
		WHERE E.Sec = @ciclo

		DELETE FROM #Horas
		DBCC CHECKIDENT (#Horas, RESEED, 0)

		SET @ciclo = @ciclo + 1
	END;

	SELECT E.Fechas
			, E.Ini
			, E.Fin 
			, E.QOrdi
			, E.MQOrdi
			, E.QExtra
			, E.MQExtra
			, E.QDoble
			, E.MQDoble
	FROM @Salida E

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[DetallesSemanaPlanillaDeduc]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DetallesSemanaPlanillaDeduc]
(
    @inIdSemanaPlanilla	INT
    , @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

    BEGIN TRY

	DECLARE @QDeducciones INT
			, @ciclo INT = 1
			, @DeducAct INT
			, @DeducEmpleadoAct INT
			, @TipoAct INT
			, @NombreTipo VARCHAR(128)
			, @EsPorcentual BIT
			, @Porcentaje FLOAT


	DECLARE @Deducciones TABLE (
		Sec INT IDENTITY(1,1)
		, IdDeduc INT
		, Monto MONEY)

	DECLARE @Salida TABLE (
		Sec INT IDENTITY(1,1)
		, Nombre VARCHAR(128)
		, Porcentaje FLOAT
		, Monto MONEY)


	SET @outResultCode=0;
	SELECT @outResultCode AS Error;

	INSERT INTO @Deducciones(
				IdDeduc 
				, Monto)
	SELECT E.id
		   , E.Monto
	FROM dbo.MovimientoPlanilla E
	WHERE E.IdPlanillaXSemanaXEmpleado = @inIdSemanaPlanilla AND (E.TipoMov = 4 OR E.TipoMov = 5)

	SET @QDeducciones = @@ROWCOUNT

	WHILE @ciclo <= @QDeducciones
	BEGIN

		SELECT @DeducAct = E.IdDeduc
		FROM @Deducciones E
		WHERE E.Sec = @ciclo

		
		SELECT @DeducEmpleadoAct = E.IdDeduccionXEmpleado
		FROM MovimientoDeduccion E
		WHERE E.idMovimientoPlanilla = @DeducAct


		SELECT @TipoAct = E.TipoDeduccion
		FROM dbo.DedeccionXEmpleado2 E
		WHERE E.id = @DeducEmpleadoAct

		SELECT @NombreTipo = E.Nombre
			   , @EsPorcentual = E.EsPorcentual
		FROM dbo.TipoDeduccion E
		WHERE E.id = @TipoAct

		IF @EsPorcentual = 1
		BEGIN

			SELECT @Porcentaje = E.Porcentaje
			FROM DeduccionPorcentualObligatoria E
			WHERE E.idTipoDeduccion = @TipoAct

		END;
		ELSE
		BEGIN

			SET @Porcentaje = 0

		END;


		INSERT INTO @Salida(
					Nombre 
					, Porcentaje 
					, Monto)
		SELECT @NombreTipo
			   , @Porcentaje
			   , E.Monto
		FROM @Deducciones E
		WHERE E.Sec = @ciclo


		SET @ciclo = @ciclo + 1
	END;

	SELECT E.Nombre
			, E.Porcentaje
			, E.Monto
	FROM @Salida E

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[EsJuevesN]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EsJuevesN]	
(
	 @cont INT  -- 1-Primer 2-Normal 3-FinDeMes
	 , @NEmpl INT
	 , @NumEmpl INT
	 , @fecha DATE
     , @outResultCode INT OUTPUT
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
	SET @outResultCode = 1
	DECLARE @ciclo INT = 1
			, @max INT
			, @semanaAct INT
			, @mesAct INT
			, @ultimo INT
			, @cantidad INT
			, @esActivo BIT
			

	SELECT @max = MAX(E.id) --Cantidad de la ultima id de empleados
	FROM dbo.Empleados3 E

	IF @fecha = '2023-07-06'
	BEGIN
	SET @semanaAct = 1
	SET @mesAct = 1
	END;
	ELSE
	BEGIN
	SELECT @semanaAct = E.id+1
	FROM dbo.SemanaPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha
	SELECT @mesAct = E.id
	FROM dbo.MesPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha
	END;


	--BEGIN TRANSACTION COPIARTABLA
	IF @cont = 1
	BEGIN
		WHILE @ciclo<= @NEmpl
		BEGIN
			/*SELECT @esActivo = E.EsActivo --Esta por ver si funciona, mejorar despues usando un par de contadores
			FROM dbo.Empleados3 E
			WHERE E.id = @ciclo*/
			INSERT INTO dbo.PlanillaXMesXEmpleado(
					IdMesPlanilla
					, SalarioBruto
					, SalarioNeto
					, TotalDeducciones)
			SELECT @mesAct
					,0
					,0
					,0
			SET @ultimo=SCOPE_IDENTITY()
			SET @ciclo = @ciclo+1
		END;
		SET @ciclo = 1	
		WHILE @ciclo<=@NumEmpl
		BEGIN
			INSERT INTO dbo.PanillaXSemanaXEmpleado(
					IdEmpleado
					, SalarioBruto
					, SalarioNeto
					, TotalDeDeducciones
					, IdSemanaPlanilla
					, IdPlanillaXMesXEmpleado)
			SELECT E.id
					,0
					,0
					,0
					,@semanaAct
					,@ultimo-@NumEmpl+@ciclo
			FROM dbo.Empleados3 E
			WHERE E.id = @ciclo --AND E.EsActivo = 1   Probar
			SET @ciclo = @ciclo+1
		END;
	END;
	IF @cont = 2
	BEGIN
	WHILE @ciclo<=@NumEmpl
		BEGIN
			/*SELECT @esActivo = E.EsActivo --Esta por ver si funciona, mejorar despues usando un par de contadores
			FROM dbo.Empleados3 E
			WHERE E.id = @ciclo*/
			INSERT INTO dbo.PlanillaXMesXEmpleado(
					IdMesPlanilla
					, SalarioBruto
					, SalarioNeto
					, TotalDeducciones)
			SELECT @mesAct+1
					,0
					,0
					,0
			SET @ultimo=SCOPE_IDENTITY()
			SET @ciclo = @ciclo+1
		END;
	SET @ciclo = 1	
	WHILE @ciclo<=@NumEmpl
		BEGIN
			INSERT INTO dbo.PanillaXSemanaXEmpleado(
					IdEmpleado
					, SalarioBruto
					, SalarioNeto
					, TotalDeDeducciones
					, IdSemanaPlanilla
					, IdPlanillaXMesXEmpleado)
			SELECT E.id
					,0
					,0
					,0
					,@semanaAct
					,@ultimo-@NumEmpl+@ciclo
			FROM dbo.Empleados3 E
			WHERE E.id = @ciclo AND E.EsActivo = 1
		SET @ciclo = @ciclo+1
		END;
	END;
	SET @outResultCode = 977
	--COMMIT TRANSACTION COPIARTABLA
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode = 66
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FiltrarNombreEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FiltrarNombreEmpleado]
(
    @inNombre VARCHAR(256)
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

    BEGIN TRY
		
		--Cree la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<'+@inNombre+'>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 4
	
		SET @outResultCode=0;
		
		SELECT @outResultCode AS Error;		
		
		--Retorna todos los empleados que cumplan el filtro por nombre.
		SELECT E.id 
			, E.Nombre
			, P.Nombre 
		FROM dbo.Empleados3 E 
		INNER JOIN dbo.Puesto P ON E.IdPuesto = P.id 
		WHERE E.EsActivo = 1 AND E.Nombre LIKE ('%'+@inNombre+'%')  ORDER BY E.Nombre

		--Realize el registro
		BEGIN TRANSACTION tRegistroLog  
		
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog
	END TRY
	BEGIN CATCH		
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarEmpleado] 
	@inNombre VARCHAR(256)
	, @inTipoDocIdentidad VARCHAR(256)
	, @inValorDocIdentidad VARCHAR(128)
	, @inPuesto VARCHAR(256)
	, @inDepartamento VARCHAR(256)
	, @inUsuarioEmpleado VARCHAR(32)
	, @inClaveEmpleado VARCHAR(32)
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64) 
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		
		--nuevos datos del empleado
		DECLARE @tipoDocIdentidad INT
			,@idPuesto INT
			,@idDepartamento INT 
			,@Inicio bit = 1
			,@idEmpleado INT

		DECLARE @ErrorDescription VARCHAR(100)
		DECLARE @LogDescription VARCHAR(2000)='{TipoAccion=<'
		
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error

		--Caso en el que el documento identidad ingresado ya exista
		IF EXISTS (SELECT 1 FROM dbo.Empleados3 E 
		WHERE E.ValorDocIdentidad = @inValorDocIdentidad AND E.EsActivo = 1)
		BEGIN
			 --procesar error
			SET @outResultCode=50001;		-- Nombre del articulo ya existe
			SET @ErrorDescription ='<Descripción del error: Valor documento identidad de empleado duplicado.>}'
			SET @LogDescription =  
					@LogDescription +'Inserción de empleado no exitoso> Descripcion=<';
		END; 

		ELSE
		--Caso en el que los datos ingresados sean validos
		BEGIN
			SET @ErrorDescription = '<>}'
			SET @LogDescription =  
					@LogDescription +'Inserción de empleado exitoso> Descripcion=<';
					
		END; 

		-- se obtienen los nuevos valores del empleado
		SELECT @tipoDocIdentidad = TD.id
		FROM dbo.TipoDocumento TD
		WHERE TD.Nombre = @inTipoDocIdentidad

		SELECT @idPuesto = P.id
		FROM dbo.Puesto P
		WHERE P.Nombre = @inPuesto

		SELECT @idDepartamento = D.id
		FROM dbo.Departamento D
		WHERE D.Nombre = @inDepartamento

		SET @LogDescription = 
				@LogDescription 
				+ @inNombre + '>, <'
				+ CAST(@tipoDocIdentidad AS VARCHAR) + '>, <'
				+ @inValorDocIdentidad + '>, <'
				+ CAST(@idPuesto AS VARCHAR) + '>, <'
				+ CAST(@idDepartamento AS VARCHAR) + '>, '
				+ @ErrorDescription;
	
		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tInsertarEmpleado
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario);

			--se inserta el empleado
			INSERT INTO [dbo].[Empleados3] (
				 [Nombre]
				,[TipoDocIdentidad]
				,[ValorDocIdentidad]
				,[IdDepartamento]
				,[IdPuesto]
				,[EsActivo]
				,[FechaIni]
			)
			SELECT @inNombre
				,@tipoDocIdentidad
				,@inValorDocIdentidad
				,@idDepartamento
				,@idPuesto
				,@Inicio
				,GETDATE()
			WHERE @outResultCode != 50001

			SET @idEmpleado = SCOPE_IDENTITY();

			INSERT INTO [dbo].[Usuario1](
				 [Clave]
				,[Nombre]
				,[Tipo]
				,[IdEmpleado]
			)
			SELECT @inClaveEmpleado
				,@inUsuarioEmpleado
				,2 
				,@idEmpleado  
			
		COMMIT TRANSACTION tInsertarEmpleado

	END TRY
	BEGIN CATCH
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0 
		BEGIN
			ROLLBACK TRANSACTION tInsertarEmpleado; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50005;
	
	END CATCH

	SET NOCOUNT OFF;
END;

GO
/****** Object:  StoredProcedure [dbo].[ListaEmpleados]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaEmpleados]
	  @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
			
		SET @outResultCode=0;
		SELECT @outResultCode AS Error;	
		
		--Crea la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)
		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 3
		
		--Retorna todos los empleados.
		SELECT E.id  
		, E.Nombre
		, P.Nombre 
		FROM dbo.Empleados3 E 
		INNER JOIN dbo.Puesto P ON E.IdPuesto = P.id 
		WHERE E.EsActivo = 1 ORDER BY E.Nombre
		
		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog

		
	END TRY
	BEGIN CATCH										
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

	SET NOCOUNT OFF;	
END
GO
/****** Object:  StoredProcedure [dbo].[LogOut]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LogOut]
	  @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
			
		SET @outResultCode=0;
		SELECT @outResultCode AS Error;	
		
		--Crea la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 2
		
		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog

	END TRY
	BEGIN CATCH										
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

	SET NOCOUNT OFF;	
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarEmpleado]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarEmpleado] 
	  @inID INT
	, @inNombre VARCHAR(256)
	, @inTipoDocIdentidad VARCHAR(256)
	, @inValorDocIdentidad VARCHAR(128)
	, @inPuesto VARCHAR(256)
	, @inDepartamento VARCHAR(256)
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64) 
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		
		--nuevos datos del empleado
		DECLARE @tipoDocIdentidad INT
				, @idPuesto INT
				, @idDepartamento INT 

		--datos anteriores del empleado 
		DECLARE @nombreAnterior VARCHAR(256)
				, @tipoDocIdentidadAnterior INT
				, @valorDocIdentidadAnterior VARCHAR(128)
				, @idPuestoAnterior INT
				, @idDepartamentoAnterior INT 
				, @ErrorDescription VARCHAR(100)
				, @LogDescription VARCHAR(2000)='{TipoAccion=<'
		
		SET @outResultCode=0;  -- Por default codigo error 0 es que no hubo error

		--Caso en el que el nombre ingresado ya exista
		IF EXISTS (SELECT 1 FROM dbo.Empleados3 E 
		WHERE E.ValorDocIdentidad = @inValorDocIdentidad AND E.id != @inID AND E.EsActivo = 1)
		BEGIN
			 --procesar error
			SET @outResultCode=50001;		-- Nombre del articulo ya existe
			SET @ErrorDescription ='<Descripción del error: Valor documento identidad de empleado duplicado.>}'
			SET @LogDescription =  
					@LogDescription +'Modificación de empleado no exitoso> Descripcion=<';
		END; 

		ELSE
		--Caso en el que los datos ingresados sean validos
		BEGIN
			SET @ErrorDescription = '<>}'
			SET @LogDescription =  
					@LogDescription +'Modificación de empleado exitoso> Descripcion=<';
					
		END; 

		-- se obtienen los nuevos valores del empleado
		SELECT @tipoDocIdentidad = TD.id
		FROM dbo.TipoDocumento TD
		WHERE TD.Nombre = @inTipoDocIdentidad

		SELECT @idPuesto = P.id
		FROM dbo.Puesto P
		WHERE P.Nombre = @inPuesto

		SELECT @idDepartamento = D.id
		FROM dbo.Departamento D
		WHERE D.Nombre = @inDepartamento

		-- se obtiene los valores anteriores del empleado
		SELECT @nombreAnterior = E.Nombre  
			   ,@tipoDocIdentidadAnterior = E.TipoDocIdentidad
			   ,@valorDocIdentidadAnterior = E.ValorDocIdentidad
			   ,@idPuestoAnterior = E.IdPuesto
			   ,@idDepartamentoAnterior = E.IdDepartamento
		FROM [dbo].[Empleados3] E 
		WHERE E.id = @inID

		
	
		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tModificarEmpleado
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				, [PostIdUser]
				, [PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario);

			--se actualiza el empleado
			UPDATE [dbo].[Empleados3] 
			SET 
				[Nombre] = @inNombre
				,[TipoDocIdentidad] = @tipoDocIdentidad
				,[ValorDocIdentidad] = @inValorDocIdentidad
				,[IdDepartamento] = @idDepartamento
				,[IdPuesto] = @idPuesto
			WHERE [dbo].[Empleados3].id = @inID AND @outResultCode != 50001
			

		COMMIT TRANSACTION tModificarEmpleado

	END TRY
	BEGIN CATCH
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0 
		BEGIN
			ROLLBACK TRANSACTION tModificarEmpleado; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50005;
	
	END CATCH

	SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[PlanMensual]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PlanMensual]
(	
	@inIdEmpleado	INT
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64) 
    , @outResultCode INT OUTPUT	
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

		DECLARE @MaxMes INT 
				, @contadorS INT = 1
				, @planillaAct INT 
				, @MaxSemana INT
				, @IdMesAct INT
				, @HDoble INT
				, @QMovimientos INT
				, @ciclo2 INT = 1
				, @idMovAct INT
				, @TipoAct VARCHAR(32)
				, @QHoras INT
			 
		DECLARE @Semanas TABLE (
			Sec INT IDENTITY(1,1)
			, IdMes INT)

		DECLARE @MesSalida TABLE (
			Sec INT IDENTITY(1,1)
			, IdMes INT
			, Bruto MONEY
			, Neto MONEY 
			, Deduc MONEY
			, IdMesH INT)  ---Continua

	
		CREATE TABLE #Horas(
			Sec INT IDENTITY(1,1)
			, IdMov INT
			, Tipo VARCHAR(32)
			, Horas INT
		)

		SET @outResultCode=0;
		SELECT @outResultCode AS Error;	
		
		--Crea la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 10

		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog

			SELECT @MaxMes = MAX(E.IdMesPlanilla)
			FROM dbo.PlanillaXMesXEmpleado E
	
			INSERT INTO @Semanas(
						IdMes)
			SELECT E.IdPlanillaXMesXEmpleado
			FROM dbo.PanillaXSemanaXEmpleado E
			WHERE E.IdEmpleado = @inIdEmpleado
			ORDER BY E.IdSemanaPlanilla

			SET @MaxSemana = @@ROWCOUNT

			WHILE @MaxMes > 0 AND @contadorS <= @MaxSemana
			BEGIN
				SELECT @IdMesAct = E.IdMes
				FROM @Semanas E
				WHERE E.Sec = @contadorS

				IF NOT EXISTS (SELECT 1 FROM @MesSalida E WHERE E.IdMes = @IdMesAct)
				BEGIN 
					INSERT INTO @MesSalida(
								IdMes 
								, Bruto 
								, Neto  
								, Deduc
								, IdMesH)
					SELECT @IdMesAct
						   , E.SalarioBruto
						   , E.SalarioNeto
						   , E.TotalDeducciones
						   , E.IdMesPlanilla
					FROM dbo.PlanillaXMesXEmpleado E
					WHERE E.id = @IdMesAct

					SET @MaxMes = @MaxMes-1
				END;

				SET @contadorS = @contadorS + 1
			END;

			SELECT E.IdMes
				   , E.Bruto
				   , E.Deduc
				   , E.Neto
			FROM @MesSalida E
			ORDER BY E.IdMesH
  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[PlanSemanal]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PlanSemanal]
(	
	@inIdEmpleado	INT
	, @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
    , @outResultCode INT OUTPUT	
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

	BEGIN TRY

		DECLARE @MaxSemana INT 
				, @contadorS INT = 1
				, @planillaAct INT 
				, @HOrdinaria INT
				, @HExtra INT
				, @HDoble INT
				, @QMovimientos INT
				, @ciclo2 INT = 1
				, @idMovAct INT
				, @TipoAct VARCHAR(32)
				, @QHoras INT
			 
		DECLARE @Semana TABLE (
			Sec INT IDENTITY(1,1)
			, IdSemana INT
			, Bruto MONEY
			, Neto MONEY 
			, Deduc MONEY)

		DECLARE @SemanSalida TABLE (
			Sec INT IDENTITY(1,1)
			, IdSemana INT
			, Bruto MONEY
			, Neto MONEY 
			, Deduc MONEY
			, QOrdi INT
			, QExtra INT
			, QDoble INT)

	
		CREATE TABLE #Horas(
			Sec INT IDENTITY(1,1)
			, IdMov INT
			, Tipo VARCHAR(32)
			, Horas INT
		)

		SET @outResultCode=0;
		SELECT @outResultCode AS Error;	
		--Crea la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 9

		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog

			SELECT @MaxSemana  = MAX(E.IdSemanaPlanilla)
			FROM dbo.PanillaXSemanaXEmpleado E
	
			INSERT INTO @Semana(
						IdSemana
						, Bruto
						, Neto 
						, Deduc)
			SELECT E.id
				   , E.SalarioBruto
				   , E.SalarioNeto
				   , E.TotalDeDeducciones
			FROM dbo.PanillaXSemanaXEmpleado E
			WHERE E.IdEmpleado = @inIdEmpleado
			ORDER BY E.IdSemanaPlanilla

			WHILE @MaxSemana > 0 AND @contadorS <= 15 
			BEGIN

				SELECT @HOrdinaria = 0
					   , @HExtra = 0
					   , @HDoble = 0	
	
				SELECT @planillaAct = E.IdSemana
				FROM @Semana E
				WHERE E.Sec = @MaxSemana

				INSERT INTO #Horas(
							IdMov
							, Tipo
							, Horas)
				SELECT E.id
					   , CE.TipoDeHoras
					   , CE.CantidadHoras
				FROM dbo.MovimientoPlanilla E
				INNER JOIN dbo.MovimientoHoras CE ON CE.idMovimientoPlanill = E.id
				WHERE E.IdPlanillaXSemanaXEmpleado = @planillaAct AND (E.TipoMov = 1 OR E.TipoMov = 2 OR E.TipoMov = 3)

				SET @QMovimientos = @@ROWCOUNT

				SET @ciclo2 = 1

				WHILE @ciclo2 <= @QMovimientos
				BEGIN

					SELECT @idMovAct = E.IdMov
						   , @TipoAct = E.Tipo
						   , @QHoras = E.Horas
					FROM #Horas E
					WHERE E.Sec = @ciclo2

					IF @TipoAct = 'Ordinarias'
					BEGIN

					SELECT @HOrdinaria =  @HOrdinaria + @QHoras

					END;
					IF @TipoAct = 'Extras'
					BEGIN

					SELECT @HExtra =  @HExtra + @QHoras

					END;
					IF @TipoAct = 'Dobles'
					BEGIN

					SELECT @HDoble =  @HDoble + @QHoras

					END;


					SET @ciclo2 = @ciclo2 + 1
				END;

				INSERT INTO @SemanSalida(
							IdSemana 
							, Bruto 
							, Neto  
							, Deduc 
							, QOrdi 
							, QExtra 
							, QDoble)
				SELECT E.IdSemana
						, E.Bruto
						, E.Neto
						, E.Deduc
						, @HOrdinaria
						, @HExtra
						, @HDoble
				FROM @Semana E
				WHERE E.Sec = @MaxSemana

				DELETE FROM #Horas
				DBCC CHECKIDENT (#Horas, RESEED, 0)

				SET @MaxSemana = @MaxSemana - 1
				SET @contadorS = @contadorS + 1
			END;

			SELECT E.IdSemana 
					, E.Bruto 
					, E.Neto  
					, E.Deduc 
					, E.QOrdi 
					, E.QExtra 
					, E.QDoble
			FROM @SemanSalida E

			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog

	END TRY
	BEGIN CATCH
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[PorcesarM]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PorcesarM]	
(
	@inMarcasA Marcas2 READONLY 
	 , @inNJornadas Jornadas2 READONLY 
	 , @inNEmpl INT
	 , @inNumEmpl INT
	 , @infecha DATE
     , @outResultCode INT OUTPUT
)

AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

	SET @outResultCode = 0 

	DECLARE @MarcaDeAsistencia TABLE(
		Sec INT IDENTITY(1,1)
		, ValorDoc VARCHAR(64)
		, HInicio SMALLDATETIME
		, HSalida SMALLDATETIME
	)

	CREATE TABLE #ProximaJornada(
		Sec INT IDENTITY(1,1)
		, ValorDoc VARCHAR(64)
		, tipoJ INT
	)

	CREATE TABLE #PreJornada(
		Sec INT IDENTITY(1,1)
		, IdEmpleado INT
		, tipoJ INT
		, Semana INT
	)

	CREATE TABLE #DatoXEmpleado(
		Sec INT IDENTITY(1,1)
		, IdEmpleado INT
		, TieneMarca BIT
		, HInicio SMALLDATETIME
		, HSalida SMALLDATETIME
		, QHOrdinarias INT
		, QHExtras INT
		, QHDobles INT
		, SalarioHora MONEY
		, NuevaJ INT
		, JornadaA INT
		, PlanillaS INT
		, PlanillaM INT
		, Monto1 MONEY
		, Monto2 MONEY
		, Monto3 MONEY
		, IdSemanaNJ INT
		, EsNuevo BIT
	)

    DECLARE @ciclo INT = 1
			, @ciclo3 INT = 1
			, @max INT
			, @QAsistencias INT 
			, @EmpleadoAct INT
			, @PuestEAct INT
			, @ValDoc VARCHAR(64)
			, @ValDoc2 VARCHAR(64)
			, @idEmpleado2 INT
			, @JornadaAct INT
			, @TipoJornadaAct INT
			, @SemanaP INT
			, @QHoras INT
			, @QHorasE INT = 0
			, @IdPlanillaAct INT
			, @MesP INT
			, @IdMesPlanillaAct INT
			, @ultimaMarca INT
			, @PuestoEAct INT
			, @ultimoMov INT 
			, @montoActual INT
			, @QJornadasN INT

	DECLARE @HayMarca BIT
			, @HEntradaAct SMALLDATETIME
			, @HSalidaAct SMALLDATETIME
			, @QHOrdinariasAct INT
			, @QHExtraAct INT
			, @QHDoblesAct INT
			, @SalarioAct MONEY
			, @NuevaJornada INT
			, @SemanaNJ INT
			, @MesNJ INT
			, @ultimo INT
			, @EsNuevos BIT
			, @EstaActivo BIT

	DECLARE @ciclo2 INT = 1
			, @QDeducciones INT
			, @QMontoBruto MONEY
			, @TipoAct INT
			, @DeducAct INT
			, @MontoReducido MONEY
			, @EsObligatoria BIT
			, @DeduccionTotal MONEY = 0
			, @NetoTotal MONEY = 0
			, @QSemanas INT
			, @TipoMov INT
			, @EsActivaAct BIT
			, @Last INT

	DECLARE @Deducciones TABLE(
		Sec INT IDENTITY(1,1)
		, Tipo INT
	)

	CREATE TABLE #Semanas(
		Sec INT IDENTITY(1,1)
		, IdSemana INT
		, Neto MONEY 
		, Deduc MONEY
		, IdMes INT
	)

	INSERT INTO @MarcaDeAsistencia(
				ValorDoc
		        , HInicio
		        , HSalida)
	SELECT E.Doc
			   , E.Entrada
			   , E.Salida
	FROM @inMarcasA E	

	SET @QAsistencias = @@ROWCOUNT

	INSERT INTO #ProximaJornada(
				ValorDoc
		        , tipoJ)
	SELECT E.Doc
			   , E.NJornada
	FROM @inNJornadas E	

	SET @QJornadasN = @@ROWCOUNT


	CREATE TABLE #Deducciones(
		Sec INT IDENTITY(1,1)
		, IdDeduc INT
		, Tipo INT 
		, EsActiva BIT
	)

	DECLARE @MaxE TABLE(
		Sec INT IDENTITY(1,1)
		, id INT
	)

	INSERT INTO @MaxE(id)
	SELECT E.id --Cantidad de la ultima id de empleados
	FROM dbo.Empleados3 E

	SET @max = @@ROWCOUNT

	SELECT @SemanaP = E.id
	FROM dbo.SemanaPlanilla E
	WHERE @infecha <= E.FechaFin AND E.FechaInicio <= @infecha

	SELECT @MesP = E.id
	FROM dbo.MesPlanilla E
	WHERE @infecha <= E.FechaFin AND E.FechaInicio <= @infecha


	IF @infecha = '2023-07-06'
	BEGIN
		SET @SemanaNJ = 1
		SET @MesNJ = 1
	END;
	ELSE
	BEGIN
		SELECT @SemanaNJ = E.id+1
		FROM dbo.SemanaPlanilla E
		WHERE @infecha <= E.FechaFin AND E.FechaInicio <= @infecha
		SELECT @MesNJ = E.id
		FROM dbo.MesPlanilla E
		WHERE @infecha <= E.FechaFin AND E.FechaInicio <= @infecha
	END;

	SET @ciclo = 1

	WHILE @ciclo<=@max --Este es el ciclo de preprocesado para los empleados, no incluya deducciones.
	BEGIN

		SELECT @EmpleadoAct = E.id
			   , @PuestoEAct = E.IdPuesto
			   , @ValDoc = E.ValorDocIdentidad
		FROM dbo.Empleados3 E
		WHERE E.id = @ciclo 

		SELECT @SalarioAct = E.SalarioXHora
		FROM dbo.Puesto E
		WHERE E.id = @PuestoEAct

		SELECT @JornadaAct = E.id
			   , @TipoJornadaAct = E.TipoDeJornada
		FROM dbo.Jornada E
		WHERE E.IdSemanaPlanilla = @SemanaP AND E.IdEmpleado = @ciclo

		SELECT @IdPlanillaAct = E.id
		FROM dbo.PanillaXSemanaXEmpleado E
		WHERE E.IdSemanaPlanilla = @SemanaP AND E.IdEmpleado = @ciclo

		SELECT @IdMesPlanillaAct = E.id
		FROM dbo.PlanillaXMesXEmpleado E
		INNER JOIN dbo.PanillaXSemanaXEmpleado CE ON CE.id = @IdPlanillaAct
		WHERE E.IdMesPlanilla = @MesP AND CE.IdPlanillaXMesXEmpleado = E.id

		IF EXISTS (SELECT 1 FROM @MarcaDeAsistencia E WHERE E.ValorDoc =  @ValDoc)
		BEGIN
			SET @HayMarca = 1

			SELECT @QHoras = DATEDIFF(HOUR, E.HInicio, E.HSalida)
					, @HEntradaAct = E.HInicio
					, @HSalidaAct = E.HSalida
			FROM @MarcaDeAsistencia E
			WHERE E.ValorDoc =  @ValDoc

			SET @QHorasE = @QHoras-8

			IF DATEPART(DW,@infecha) = 1 OR EXISTS (SELECT 1 FROM dbo.Feriados E WHERE E.Fecha = @infecha)
			BEGIN

				SELECT @QHOrdinariasAct = 0
					   , @QHExtraAct = 0
					   , @QHDoblesAct = @QHoras

			END;
			ELSE
			BEGIN

				SELECT @QHOrdinariasAct = 8
					   , @QHExtraAct = @QHorasE
					   , @QHDoblesAct = 0
			END;
		END;
		ELSE
		BEGIN
			SELECT @HayMarca = 0
				   , @HEntradaAct = NULL
				   , @HSalidaAct = NULL
				   , @QHOrdinariasAct = 0
				   , @QHExtraAct = 0
				   , @QHDoblesAct = 0
		END;

		IF DATEPART(DW,@infecha) = 5  --Si es jueves vamos a buscar la nueva//Debe calcularse las deducciones.
		BEGIN
			SELECT @NuevaJornada = E.tipoJ
			FROM #ProximaJornada E
			WHERE E.ValorDoc = @ValDoc
		END;

		IF @ciclo <= @max - @inNEmpl
		BEGIN
			SET @EsNuevos = 0
		END;
		ELSE
		BEGIN 
			SET @EsNuevos = 1
		END;

		INSERT INTO #DatoXEmpleado(
			IdEmpleado 
			, TieneMarca 
			, HInicio
			, HSalida
			, QHOrdinarias 
			, QHExtras
			, QHDobles
			, SalarioHora
			, NuevaJ     --Este es el tipo de jornada
			, JornadaA 
			, PlanillaS 
			, PlanillaM
			, Monto1 
			, Monto2 
			, Monto3
			, IdSemanaNJ
			, EsNuevo)
		VALUES (@EmpleadoAct
				, @HayMarca
				, @HEntradaAct
				, @HSalidaAct
				, @QHOrdinariasAct
				, @QHExtraAct
				, @QHDoblesAct
				, @SalarioAct
				, @NuevaJornada  --Este es el tipo de jornada
				, @JornadaAct
				, @IdPlanillaAct
				, @IdMesPlanillaAct
				, @SalarioAct * @QHOrdinariasAct
				, @SalarioAct * @QHExtraAct * 1.5
				, @SalarioAct * @QHDoblesAct * 2
				, @SemanaNJ
				, @EsNuevos)
		

		SET @ciclo = @ciclo + 1 
		END;

		IF  DATEPART(DW,@infecha) = 5
		BEGIN
			SET @ciclo = 1
			WHILE @ciclo<=@QJornadasN
			BEGIN
				SELECT @ValDoc2 = E.ValorDoc
				FROM  #ProximaJornada E
				WHERE E.Sec = @ciclo

				SELECT @idEmpleado2 = E.id
				FROM dbo.Empleados3 E
				WHERE E.ValorDocIdentidad = @ValDoc2

				INSERT INTO #PreJornada(
							IdEmpleado
							, tipoJ
							, Semana)
				SELECT @idEmpleado2
						   , E.tipoJ
						   , @SemanaNJ
				FROM #ProximaJornada E
				WHERE E.Sec = @ciclo

				SET @ciclo = @ciclo+1
			END;
		END;

		SET @ciclo = 1

		--Empieza la transaccion
		BEGIN TRANSACTION tProcesarMarca

		WHILE @ciclo<=@max
		BEGIN
			
			SELECT @HayMarca = E.TieneMarca
			FROM #DatoXEmpleado E
			WHERE E.IdEmpleado = @ciclo

			SELECT @EstaActivo = E.EsActivo
			FROM dbo.Empleados3 E
			WHERE E.id = @ciclo

			IF @HayMarca = 1
			BEGIN

				INSERT INTO dbo.MarcaAsistencia(
							Fecha
							, MarcaInicio
							, MarcaFin
							, IdJornada
							, IdEmpleado)
				SELECT @infecha
					   , E.HInicio
					   , E.HSalida
					   , E.JornadaA
					   , @ciclo
				FROM #DatoXEmpleado E
				WHERE E.IdEmpleado = @ciclo

				SET @ultimaMarca = SCOPE_IDENTITY()

				SELECT @IdPlanillaAct = E.PlanillaS
						, @IdMesPlanillaAct = E.PlanillaM
				FROM #DatoXEmpleado E
				WHERE E.IdEmpleado = @ciclo

				IF DATEPART(DW,@infecha) = 1 OR EXISTS (SELECT 1 FROM dbo.Feriados E WHERE E.Fecha = @infecha)
				BEGIN
					INSERT INTO dbo.MovimientoPlanilla(
								Monto
								, Fecha
								, IdPlanillaXSemanaXEmpleado
								, TipoMov)
					SELECT E.Monto3
						   , @infecha
						   , E.PlanillaS
						   , 3
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo

					SET @ultimoMov = SCOPE_IDENTITY()

					SELECT @montoActual = E.Monto
					FROM dbo.MovimientoPlanilla E
					WHERE E.id = @ultimoMov

					INSERT INTO dbo.MovimientoHoras(
								idMovimientoPlanill
								, IdMarcaAsistencia
								, CantidadHoras
								, TipoDeHoras)
					SELECT @ultimoMov
						   , @ultimaMarca
						   , E.QHDobles
						   , 'Dobles'
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo

					UPDATE dbo.PanillaXSemanaXEmpleado
					SET SalarioBruto = SalarioBruto + @montoActual
					WHERE dbo.PanillaXSemanaXEmpleado.id = @IdPlanillaAct

					UPDATE dbo.PlanillaXMesXEmpleado
					SET SalarioBruto = SalarioBruto + @montoActual
					WHERE dbo.PlanillaXMesXEmpleado.id = @IdMesPlanillaAct
				END;
				ELSE
				BEGIN
					INSERT INTO dbo.MovimientoPlanilla(
								Monto
								, Fecha
								, IdPlanillaXSemanaXEmpleado
								, TipoMov)
					SELECT E.Monto1
						   ,@infecha
						   , E.PlanillaS
						   , 1
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo

					SET @ultimoMov = SCOPE_IDENTITY()

					SELECT @montoActual = E.Monto1
						   , @QHoras = E.QHExtras
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo

					INSERT INTO dbo.MovimientoHoras(
								idMovimientoPlanill
								, IdMarcaAsistencia
								, CantidadHoras
								, TipoDeHoras)
					SELECT @ultimoMov
						   , @ultimaMarca
						   , 8
						   , 'Ordinarias'
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo

					UPDATE dbo.PanillaXSemanaXEmpleado
					SET SalarioBruto = SalarioBruto + @montoActual
					WHERE dbo.PanillaXSemanaXEmpleado.id = @IdPlanillaAct

					UPDATE dbo.PlanillaXMesXEmpleado
					SET SalarioBruto = SalarioBruto + @montoActual
					WHERE dbo.PlanillaXMesXEmpleado.id = @IdMesPlanillaAct

					IF @QHoras > 0
					BEGIN
						INSERT INTO dbo.MovimientoPlanilla(
									Monto
									, Fecha
									, IdPlanillaXSemanaXEmpleado
									, TipoMov)
						SELECT E.Monto2
							   ,@infecha
							   , E.PlanillaS
							   , 2
						FROM #DatoXEmpleado E
						WHERE E.IdEmpleado = @ciclo

						SET @ultimoMov = SCOPE_IDENTITY()

						SELECT @montoActual = E.Monto
						FROM dbo.MovimientoPlanilla E
						WHERE E.id = @ultimoMov

						INSERT INTO dbo.MovimientoHoras(
									idMovimientoPlanill
									, IdMarcaAsistencia
									, CantidadHoras
									, TipoDeHoras)
						SELECT @ultimoMov
							   , @ultimaMarca
							   , E.QHExtras
							   , 'Extras'
						FROM #DatoXEmpleado E
						WHERE E.IdEmpleado = @ciclo

						UPDATE dbo.PanillaXSemanaXEmpleado
						SET SalarioBruto = SalarioBruto + @montoActual
						WHERE dbo.PanillaXSemanaXEmpleado.id = @IdPlanillaAct

						UPDATE dbo.PlanillaXMesXEmpleado
						SET SalarioBruto = SalarioBruto + @montoActual
						WHERE dbo.PlanillaXMesXEmpleado.id = @IdMesPlanillaAct
					END;
				END;
			END;
		
			--Deducciones

			IF @ciclo<=@max - @inNEmpl
			BEGIN
				IF DATEPART(DW,@infecha) = 5 AND @EstaActivo = 1
				BEGIN
					SET @DeduccionTotal = 0

					SELECT @IdPlanillaAct = E.id
							, @QMontoBruto = E.SalarioBruto
					FROM dbo.PanillaXSemanaXEmpleado E
					WHERE E.IdSemanaPlanilla = @SemanaP AND E.IdEmpleado = @ciclo

					SELECT @IdMesPlanillaAct = E.id
					FROM dbo.PlanillaXMesXEmpleado E
					INNER JOIN dbo.PanillaXSemanaXEmpleado CE ON CE.id = @IdPlanillaAct
					WHERE E.IdMesPlanilla = @MesP AND CE.IdPlanillaXMesXEmpleado = E.id

					IF @QMontoBruto > 0
					BEGIN
						INSERT INTO #Deducciones(
								IdDeduc
								, Tipo
								, EsActiva)
						SELECT E.id
							   , E.TipoDeduccion
							   , E.EsActivo
						FROM dbo.DedeccionXEmpleado2 E
						WHERE E.IdEmpleado = @ciclo

						SET @QDeducciones = @@ROWCOUNT
						
						SET @ciclo2 = 1

						WHILE @ciclo2 <= @QDeducciones
						BEGIN
							SELECT @TipoAct = E.Tipo
								   , @DeducAct = E.IdDeduc
								   , @EsActivaAct = E.EsActiva
							FROM #Deducciones E
							WHERE E.Sec = @ciclo2

							IF @EsActivaAct = 1
							BEGIN
								SELECT @EsObligatoria = E.EsObligatoria
								FROM TipoDeduccion E
								WHERE E.id = @TipoAct

								IF @EsObligatoria = 1
								BEGIN
									SELECT @MontoReducido = E.Porcentaje * @QMontoBruto
									FROM dbo.DeduccionPorcentualObligatoria E
									WHERE E.idTipoDeduccion = @TipoAct

									SET @TipoMov = 4
								END;
								ELSE
								BEGIN
									SELECT @QSemanas = E.QSemanas
									FROM NumeroSemanasXMes E
									WHERE E.idNumeroMes = @MesP
				
									SELECT @MontoReducido = E.Monto / @QSemanas
									FROM dbo.DeduccionFijaNoObligatoria E
									WHERE E.idDeduccionXEmpleado = @DeducAct 

									SET @TipoMov = 5
								END;

								INSERT INTO dbo.MovimientoPlanilla(
											Monto
											, Fecha
											, IdPlanillaXSemanaXEmpleado
											, TipoMov)
								VALUES (@MontoReducido
										   , @infecha
										   , @IdPlanillaAct
										   , @TipoMov)

								SET @ultimoMov = SCOPE_IDENTITY()

								INSERT INTO	MovimientoDeduccion(
											idMovimientoPlanilla
											, IdDeduccionXEmpleado)
								VALUES (@ultimoMov
									   , @DeducAct)

								SET @DeduccionTotal = @DeduccionTotal + @MontoReducido

								INSERT INTO DeduccionXMesXEmpleado1(
											IdPlanillaXMesXEmpleado
											, TotalDeDeduccion
											, TipoDeduccion)
								VALUES  (@IdMesPlanillaAct
									   , @MontoReducido
									   , @TipoAct)
							END;
							SET @ciclo2=@ciclo2+1
						END;

						UPDATE dbo.PanillaXSemanaXEmpleado
						SET SalarioNeto =  @QMontoBruto - @DeduccionTotal
							, TotalDeDeducciones = @DeduccionTotal
						WHERE dbo.PanillaXSemanaXEmpleado.id = @IdPlanillaAct

					END;	
					DELETE FROM #Deducciones
					DBCC CHECKIDENT (#Deducciones, RESEED, 0)  
					------------------------------------------Actualizar Mes--------------------------------------------------------------
		
					IF EXISTS (SELECT 1 FROM dbo.MesPlanilla E WHERE E.FechaFin = @infecha)
					BEGIN 
						INSERT INTO #Semanas(
									IdSemana
									, Neto 
									, Deduc
									, IdMes)
						SELECT E.id
							   , E.SalarioNeto
							   , E.TotalDeDeducciones
							   , E.IdPlanillaXMesXEmpleado
						FROM dbo.PanillaXSemanaXEmpleado E
						INNER JOIN dbo.Empleados3 CE ON CE.id = @ciclo 
						INNER JOIN SemanaPlanilla CD ON CD.id = E.IdSemanaPlanilla
						WHERE E.IdEmpleado = @ciclo AND CE.EsActivo = 1 AND CD.IdMesPlanilla = @MesP

						SET @QSemanas = @@ROWCOUNT
						SET @Last = SCOPE_IDENTITY()

						SET @ciclo2 = 1
						SET @DeduccionTotal = 0
						SET @NetoTotal = 0

						WHILE @ciclo2 <= @QSemanas
						BEGIN
							SELECT @DeduccionTotal = @DeduccionTotal + E.Deduc
								   , @NetoTotal = @NetoTotal + E.Neto
							FROM #Semanas E
							WHERE E.Sec = @ciclo2

							SET @ciclo2=@ciclo2+1
						END;

						SELECT @IdMesPlanillaAct = E.IdMes
						FROM #Semanas E
						WHERE E.Sec = @Last

						UPDATE dbo.PlanillaXMesXEmpleado
						SET SalarioNeto = @NetoTotal
							, TotalDeducciones = @DeduccionTotal
						WHERE dbo.PlanillaXMesXEmpleado.id = @IdMesPlanillaAct

						DELETE FROM #Semanas
						DBCC CHECKIDENT (#Semanas, RESEED, 0)
					END;
				END;
			END;
		IF  DATEPART(DW,@infecha) = 5 AND @EstaActivo = 1
		BEGIN	
			IF EXISTS (SELECT 1 FROM #PreJornada E WHERE E.IdEmpleado = @ciclo)
			BEGIN
				INSERT INTO dbo.Jornada(
							IdEmpleado
							, TipoDeJornada
							, IdSemanaPlanilla)
				SELECT E.IdEmpleado
							, E.tipoJ
							, E.Semana
				FROM #PreJornada E
				WHERE E.IdEmpleado= @ciclo
			END;
	
			SELECT @EsNuevos = E.EsNuevo
			FROM #DatoXEmpleado E
			WHERE E.IdEmpleado = @ciclo


			IF EXISTS (SELECT 1 FROM dbo.MesPlanilla E WHERE E.FechaFin = @infecha) 
			BEGIN
				INSERT INTO dbo.PlanillaXMesXEmpleado(
							IdMesPlanilla
							, SalarioBruto
							, SalarioNeto
							, TotalDeducciones)
				VALUES (@MesNJ+1
						,0
						,0
						,0)

				SET @ultimo=SCOPE_IDENTITY()

				INSERT INTO dbo.PanillaXSemanaXEmpleado(
							IdEmpleado
							, SalarioBruto
							, SalarioNeto
							, TotalDeDeducciones
							, IdSemanaPlanilla
							, IdPlanillaXMesXEmpleado)
				VALUES (@ciclo
						, 0
						, 0
						, 0
						, @SemanaNJ
						, @ultimo)
	
			END;
			ELSE
			BEGIN
				IF @EsNuevos = 1
				BEGIN
					INSERT INTO dbo.PlanillaXMesXEmpleado(
								IdMesPlanilla
								, SalarioBruto
								, SalarioNeto
								, TotalDeducciones)
					VALUES  (@MesNJ
							,0
							,0
							,0)

					SET @ultimo=SCOPE_IDENTITY()

					INSERT INTO dbo.PanillaXSemanaXEmpleado(
								IdEmpleado
								, SalarioBruto
								, SalarioNeto
								, TotalDeDeducciones
								, IdSemanaPlanilla
								, IdPlanillaXMesXEmpleado)
					VALUES  (@ciclo
							, 0
							, 0
							, 0
							, @SemanaNJ
							, @ultimo)

				END;
				ELSE
				BEGIN
					INSERT INTO dbo.PanillaXSemanaXEmpleado(
								IdEmpleado
								, SalarioBruto
								, SalarioNeto
								, TotalDeDeducciones
								, IdSemanaPlanilla
								, IdPlanillaXMesXEmpleado)
					SELECT @ciclo
							, 0
							, 0
							, 0
							, @SemanaNJ
							, E.PlanillaM
					FROM #DatoXEmpleado E
					WHERE E.IdEmpleado = @ciclo
				END;
			END;
		END;

		SET @ciclo = @ciclo + 1 

	END;  --Termina main bucle

	--DELETE FROM #PreJornada
	--DBCC CHECKIDENT (#PreJornada, RESEED, 0)

	COMMIT TRANSACTION tProcesarMarca

	SET @outResultCode = 1

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tProcesarMarca; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode = 50003
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ProcesarD]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProcesarD]
(
	@fecha DATE
	, @NEmpleados INT 
    , @outResultCode INT OUTPUT
)
AS
BEGIN

    SET NOCOUNT ON
	BEGIN TRY

	DECLARE @max INT 
			, @ciclo INT = 1
			, @SemanaP INT
			, @IdPlanillaAct INT
			, @ciclo2 INT = 1
			, @QDeducciones INT
			, @QMontoBruto MONEY
			, @TipoAct INT
			, @DeducAct INT
			, @MontoReducido MONEY
			, @EsObligatoria BIT
			, @MesP INT
			, @ultimoMov INT
			, @DeduccionTotal MONEY
			, @IdMesPlanillaAct INT
			, @QSemanas INT
			, @TipoMov INT
			, @EsActivaAct BIT

	DECLARE @Deducciones TABLE(
		Sec INT IDENTITY(1,1)
		, Tipo INT
	)

	CREATE TABLE #Deducciones(
		Sec INT IDENTITY(1,1)
		, IdDeduc INT
		, Tipo INT 
		, EsActiva BIT
	)

	SET @outResultCode = 0

	SELECT @max = MAX(E.id)-@NEmpleados --Cantidad de la ultima id de empleados
	FROM dbo.Empleados3 E

	SELECT @MesP = E.id
	FROM dbo.MesPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha

	SELECT @SemanaP = E.id
	FROM dbo.SemanaPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha

	INSERT INTO Pruebas(Texto, Entero) Values ( '/////', @max)
	WHILE @ciclo<=@max
	BEGIN
		
		SET @DeduccionTotal = 0

		SELECT @IdPlanillaAct = E.id
				, @QMontoBruto = E.SalarioBruto
		FROM dbo.PanillaXSemanaXEmpleado E
		WHERE E.IdSemanaPlanilla = @SemanaP AND E.IdEmpleado = @ciclo

		SELECT @IdMesPlanillaAct = E.id
		FROM dbo.PlanillaXMesXEmpleado E
		INNER JOIN dbo.PanillaXSemanaXEmpleado CE ON CE.id = @IdPlanillaAct
		WHERE E.IdMesPlanilla = @MesP AND CE.IdPlanillaXMesXEmpleado = E.id

		IF @QMontoBruto > 0
		BEGIN
			INSERT INTO #Deducciones(
					IdDeduc
					, Tipo
					, EsActiva)
			SELECT E.id
				   , E.TipoDeduccion
				   , E.EsActivo
			FROM dbo.DedeccionXEmpleado2 E
			WHERE E.IdEmpleado = @ciclo

			SET @QDeducciones = @@ROWCOUNT
			INSERT INTO Pruebas(Texto, Entero) Values ( '////', @QDeducciones)


			SET @ciclo2 = 1

			WHILE @ciclo2 <= @QDeducciones
			BEGIN
				
				SELECT @TipoAct = E.Tipo
					   , @DeducAct = E.IdDeduc
					   , @EsActivaAct = E.EsActiva
				FROM #Deducciones E
				WHERE E.Sec = @ciclo2

				IF @EsActivaAct = 1
				BEGIN

					SELECT @EsObligatoria = E.EsObligatoria
					FROM TipoDeduccion E
					WHERE E.id = @TipoAct

					IF @EsObligatoria = 1
					BEGIN
						SELECT @MontoReducido = E.Porcentaje * @QMontoBruto
						FROM dbo.DeduccionPorcentualObligatoria E
						WHERE E.idTipoDeduccion = @TipoAct

						SET @TipoMov = 4
					END;
					ELSE
					BEGIN
						SELECT @QSemanas = E.QSemanas
						FROM NumeroSemanasXMes E
						WHERE E.idNumeroMes = @MesP
				
						SELECT @MontoReducido = E.Monto / @QSemanas
						FROM dbo.DeduccionFijaNoObligatoria E
						WHERE E.idDeduccionXEmpleado = @DeducAct 

						SET @TipoMov = 5
					END;

					INSERT INTO dbo.MovimientoPlanilla(
								Monto
								, Fecha
								, IdPlanillaXSemanaXEmpleado
								, TipoMov)
					SELECT @MontoReducido
							   , @fecha
							   , @IdPlanillaAct
							   , @TipoMov

					SET @ultimoMov = SCOPE_IDENTITY()

					INSERT INTO	MovimientoDeduccion(
								idMovimientoPlanilla
								, IdDeduccionXEmpleado)
					SELECT @ultimoMov
						   , @DeducAct

					SET @DeduccionTotal = @DeduccionTotal + @MontoReducido

					INSERT INTO DeduccionXMesXEmpleado1(
								IdPlanillaXMesXEmpleado
								, TotalDeDeduccion
								, TipoDeduccion)
					SELECT @IdMesPlanillaAct
						   , @MontoReducido
						   , @TipoAct
				END;
				SET @ciclo2=@ciclo2+1
			END;

			UPDATE dbo.PanillaXSemanaXEmpleado
			SET SalarioNeto =  @QMontoBruto - @DeduccionTotal
				, TotalDeDeducciones = @DeduccionTotal
			WHERE dbo.PanillaXSemanaXEmpleado.id = @IdPlanillaAct

		END;	
		DELETE FROM #Deducciones
		DBCC CHECKIDENT (#Deducciones, RESEED, 0)  
		SET @ciclo=@ciclo+1
	END;

	DROP TABLE #Deducciones
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode = 66
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ProcesarMes]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProcesarMes]
(
	@fecha DATE
     ,@outResultCode INT OUTPUT
)
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY

	DECLARE @max INT 
			, @ciclo INT = 1
			, @SemanaP INT
			, @IdPlanillaAct INT
			, @ciclo2 INT = 1
			, @QDeducciones INT
			, @QMontoBruto MONEY
			, @TipoAct INT
			, @DeducAct INT
			, @MontoReducido MONEY
			, @EsObligatoria BIT
			, @MesP INT
			, @ultimoMov INT
			, @DeduccionTotal MONEY = 0
			, @NetoTotal MONEY = 0
			, @IdMesPlanillaAct INT
			, @QSemanas INT
			, @TipoMov INT
			, @EsActivaAct BIT
			, @Last INT

	DECLARE @Deducciones TABLE(
		Sec INT IDENTITY(1,1)
		, Tipo INT
	)

	CREATE TABLE #Semanas(
		Sec INT IDENTITY(1,1)
		, IdSemana INT
		, Neto MONEY 
		, Deduc MONEY
		, IdMes INT
	)

	SET @outResultCode = 0

	SELECT @max = MAX(E.id) --Cantidad de la ultima id de empleados
	FROM dbo.Empleados3 E

	SELECT @MesP = E.id
	FROM dbo.MesPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha

	SELECT @SemanaP = E.id
	FROM dbo.SemanaPlanilla E
	WHERE @fecha <= E.FechaFin AND E.FechaInicio <= @fecha

	WHILE @ciclo<=@max
	BEGIN
		
		INSERT INTO #Semanas(
					IdSemana
					, Neto 
					, Deduc
					, IdMes)
		SELECT E.id
			   , E.SalarioNeto
			   , E.TotalDeDeducciones
			   , E.IdPlanillaXMesXEmpleado
		FROM dbo.PanillaXSemanaXEmpleado E
		INNER JOIN dbo.Empleados3 CE ON CE.id = @ciclo 
		INNER JOIN SemanaPlanilla CD ON CD.id = E.IdSemanaPlanilla
		WHERE E.IdEmpleado = @ciclo AND CE.EsActivo = 1 AND CD.IdMesPlanilla = @MesP

		SET @QSemanas = @@ROWCOUNT
		SET @Last = SCOPE_IDENTITY()

		SET @ciclo2 = 1
		SET @DeduccionTotal = 0
		SET @NetoTotal = 0

		WHILE @ciclo2 <= @QSemanas
		BEGIN

			SELECT @DeduccionTotal = @DeduccionTotal + E.Deduc
				   , @NetoTotal = @NetoTotal + E.Neto
			FROM #Semanas E
			WHERE E.Sec = @ciclo2

			SET @ciclo2=@ciclo2+1
		END;

		SELECT @IdMesPlanillaAct = E.IdMes
		FROM #Semanas E
		WHERE E.Sec = @Last

		UPDATE dbo.PlanillaXMesXEmpleado
		SET SalarioNeto = @NetoTotal
			, TotalDeducciones = @DeduccionTotal
		WHERE dbo.PlanillaXMesXEmpleado.id = @IdMesPlanillaAct

		DELETE FROM #Semanas
		DBCC CHECKIDENT (#Semanas, RESEED, 0)  
	SET @ciclo=@ciclo+1
	END;	

	DROP TABLE #Semanas

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION COPIARTABLA; 
		END;
		INSERT INTO dbo.DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		)
		SET @outResultCode = 66
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[VolverAAdministrador]    Script Date: 11/11/2023 22:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VolverAAdministrador]
	  @inUsuario VARCHAR(32)
	, @inIP VARCHAR(64)
	, @outResultCode INT OUTPUT	
AS
BEGIN

    SET NOCOUNT ON

	BEGIN TRY
			
		SET @outResultCode=0;
		SELECT @outResultCode AS Error;	
		
		--Crea la descripcion de evento.
		DECLARE @LogDescription VARCHAR(2000)

		SELECT @LogDescription ='{TipoAccion=<'+E.Nombre+'> Descripcion=<>}'
		FROM dbo.TipoEvento E
		WHERE E.id = 13
		
		--Realiza el registro.
		BEGIN TRANSACTION tRegistroLog  
			INSERT INTO dbo.EventLog(
				[LogDesciption]
				,[PostIdUser]
				,[PostIP]
				,[PostTime]
				,[UsuarioId])
			SELECT 
				@LogDescription
				, A.id
				, @inIP
				, GETDATE()
				, A.id 
			FROM dbo.Usuario1 A WHERE (A.Nombre=@inUsuario)

		COMMIT TRANSACTION tRegistroLog

	END TRY
	BEGIN CATCH										
		--En caso se error deshacer el TRANSACT, registrar el error y devolver el aviso a capa logica.
		IF @@TRANCOUNT>0  
		BEGIN
			ROLLBACK TRANSACTION tRegistroLog; 
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);
		SET @outResultCode=50003;					
		SELECT @outResultCode AS Error;
	END CATCH

	SET NOCOUNT OFF;	
END
GO
ALTER DATABASE [prueba2312] SET  READ_WRITE 
GO
