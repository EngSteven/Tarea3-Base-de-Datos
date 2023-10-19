/****** Object:  Database [prueba2312]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[AD]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DBErrors]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DD]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DedeccionXEmpleado2]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DeduccionFijaNoObligatoria]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DeduccionPorcentualObligatoria]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[DeduccionXMesXEmpleado1]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Departamento]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Dias2]    Script Date: 18/10/2023 21:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EE]    Script Date: 18/10/2023 21:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EE](
	[Sec] [int] IDENTITY(1,1) NOT NULL,
	[ValorDoc] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados3]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[EventLog]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Fechas2]    Script Date: 18/10/2023 21:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fechas2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriados]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[FeriadosInter]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Jornada]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[MovimientoDeduccion]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[MovimientoHoras]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[NEP3]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[NumeroSemanasXMes]    Script Date: 18/10/2023 21:57:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroSemanasXMes](
	[idNumeroMes] [int] NULL,
	[QSemanas] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanillaXSemanaXEmpleado]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[PlanillaXMesXEmpleado]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Puesto]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoMovimientoDeduccion]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TipoMovimientoPlanilla]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[TiposDeDeduccionesInter]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  Table [dbo].[Usuario1]    Script Date: 18/10/2023 21:57:09 ******/
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
/****** Object:  StoredProcedure [dbo].[AnadirEmpleados]    Script Date: 18/10/2023 21:57:10 ******/
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
/****** Object:  StoredProcedure [dbo].[CargarDatos]    Script Date: 18/10/2023 21:57:10 ******/
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
		SET @outResultCode=2;
	END CATCH





END
GO
/****** Object:  StoredProcedure [dbo].[CargarDatosDiarios]    Script Date: 18/10/2023 21:57:10 ******/
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

	DECLARE @NumeroFechas INT
			, @NumeroEmpleados INT
			, @NumeroEliminar INT
			, @NumeroAsociar INT
			, @NumeroDesasociar INT
			, @NumeroAsistencia INT
			, @NumeroJornada INT
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

	DECLARE @ProximaJornada TABLE(
		ValorDoc VARCHAR(64)
		, tipoJ INT
	)

	


	--BEGIN TRANSACTION COPIARTABLA

	INSERT INTO dbo.Fechas2 (
			Nombre)
	SELECT T.Item.value('@Fecha', 'DATE')
    FROM @inDatosXML.nodes('Operacion/FechaOperacion') as T(Item) 

	SET @NumeroFechas=@@ROWCOUNT

	INSERT INTO dbo.Dias2(
			    Dia)
	SELECT T.Item.query('.')	
	FROM @inDatosXML.nodes('(Operacion/FechaOperacion)') as T(Item)

	SET @outResultCode = 24
	--BEGIN
	WHILE @contador <= @NumeroFechas
	BEGIN
		SELECT @nodoAct = E.Dia
		FROM dbo.Dias2 E
		WHERE E.id = @contador

		/*INSERT INTO dbo.Dias2(
			    Dia)
		SELECT @nodoAct*/
		SELECT @FechaAct = E.Nombre
		FROM dbo.Fechas2 E
		WHERE E.id =  @contador

		INSERT INTO dbo.NEP3(
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


		SET @ciclo = 1

		WHILE @ciclo<= @NumeroEmpleados
		BEGIN
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
			FROM NEP3 E
			WHERE E.Sec = @ciclo
			SET @ciclo = @ciclo+1
		END;
		SET @Ultima=SCOPE_IDENTITY()

		INSERT INTO dbo.Usuario1(
				Clave
				, Nombre
				, Tipo
				, IdEmpleado
			)
		SELECT E.Pass
			   , E.Usuario
		       , 2
		       , @Ultima-@NumeroEmpleados+E.Sec
		FROM NEP3 E
		ORDER BY E.Sec;


		INSERT INTO dbo.EE(
				ValorDoc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
		FROM @nodoAct.nodes('(FechaOperacion/EliminarEmpleados/EliminarEmpleado)') as T(Item)

		SET @NumeroEliminar=@@ROWCOUNT
		SET @ciclo = 1

		WHILE @ciclo<=@NumeroEliminar
		BEGIN

			SELECT @EliminarAct = E.ValorDoc
			FROM dbo.EE E
			WHERE E.Sec =  @ciclo
		
			UPDATE dbo.Empleados3
				SET EsActivo = 0
				WHERE dbo.Empleados3.ValorDocIdentidad = @EliminarAct
			SET @ciclo = @ciclo+1
		END;

		----------------------------------------------------------------------------------------
		INSERT INTO  dbo.AD(
				ValorDoc 
		        , IdTipoDeduc
			    , Monto)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
			   , T.Item.value('@Monto', 'MONEY')
		FROM @nodoAct.nodes('(FechaOperacion/AsociacionEmpleadoDeducciones/AsociacionEmpleadoConDeduccion)') as T(Item)
		SET @NumeroAsociar=@@ROWCOUNT
		SET @ciclo = 1

		

		INSERT INTO dbo.Fechas2 (
			Nombre)
		SELECT @FechaAct
		
		WHILE @ciclo<=@NumeroAsociar
		BEGIN

			SELECT @TipoDeduc = E.IdTipoDeduc
			FROM  dbo.AD E
			WHERE E.Sec = @ciclo
			PRINT(@TipoDeduc)

			
			SELECT @Porcent = E.EsPorcentual
			FROM  dbo.TipoDeduccion E
			WHERE E.id = @TipoDeduc

			SELECT @EliminarAct = E.ValorDoc
			FROM  dbo.AD E
			WHERE E.Sec = @ciclo

			SELECT @montoA = E.Monto
			FROM  dbo.AD E
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
			SET @ciclo = @ciclo+1
		END;
		-----------------------------------------------------------------------------------------
		INSERT INTO dbo.DD(
				ValorDoc 
		        , IdTipoDeduc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
		FROM @nodoAct.nodes('(FechaOperacion/DesasociacionEmpleadoDeducciones/DesasociacionEmpleadoConDeduccion)') as T(Item)
		SET @NumeroDesasociar=@@ROWCOUNT
		SET @ciclo = 1

		WHILE @ciclo<=@NumeroDesasociar
		BEGIN

			SELECT @EliminarAct = E.ValorDoc
				   , @TipoDeduc = E.IdTipoDeduc
			FROM dbo.DD E
			WHERE E.Sec = @ciclo

			SELECT @idEmpAct = E.id
			FROM dbo.Empleados3 E
			WHERE E.ValorDocIdentidad = @EliminarAct
		
			UPDATE dbo.DedeccionXEmpleado2
				SET EsActivo = 0
				WHERE dbo.DedeccionXEmpleado2.IdEmpleado = @idEmpAct AND dbo.DedeccionXEmpleado2.TipoDeduccion = @TipoDeduc
			SET @ciclo = @ciclo+1
		END;
		--SELECT @idEmpAct = E.id
		--FROM dbo.Empleados2 E
		--WHERE E.ValorDocIndetidad = @contador
		--@FechaAct DATE
		--@@TipoDeduc


		

		

		--INSERT INTO dbo.Dias2(
		--	    Dia)
		--SELECT T.Item.query('.')
		--FROM @nodoAct.nodes('(FechaOperacion/NuevosEmpleados)') as T(Item)

		/*INSERT INTO @meet(
			    lol)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/NuevosEmpleados)') as T(Item)

		SELECT @empleadoAct = E.lol
		FROM @meet E
		WHERE E.id = 1

		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT @empleadoAct*/

		--EXEC dbo.AnadirEmpleados @empleadoAct;

		/*INSERT INTO dbo.NEP(
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
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/NuevosEmpleados)') as T(Item)
		SET @NumeroEmpleados=@@ROWCOUNT


		INSERT INTO @EliminarEmpleados(
				ValorDoc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
		FROM @nodoAct.nodes('(FechaOperacion/EliminarEmpleados/EliminarEmpleado)') as T(Item)
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/EliminarEmpleados)') as T(Item)
		SET @NumeroEliminar=@@ROWCOUNT

		INSERT INTO  @AsociarDeducciones(
				ValorDoc 
		        , IdTipoDeduc
			    , Monto)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
			   , T.Item.value('@Monto', 'MONEY')
		FROM @nodoAct.nodes('(FechaOperacion/AsociacionEmpleadoDeducciones/AsociacionEmpleadoConDeduccion)') as T(Item)
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/AsociacionEmpleadoDeducciones)') as T(Item)
		SET @NumeroAsociar=@@ROWCOUNT

		INSERT INTO @DesasociarDeducciones(
				ValorDoc 
		        , IdTipoDeduc)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoDeduccion', 'INT')
		FROM @nodoAct.nodes('(FechaOperacion/DesasociacionEmpleadoDeducciones/DesasociacionEmpleadoConDeduccion)') as T(Item)
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/DesasociacionEmpleadoDeducciones)') as T(Item)
		SET @NumeroDesasociar=@@ROWCOUNT

		INSERT INTO @MarcaDeAsistencia(
				ValorDoc
		        , HInicio
		        , HSalida)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@HoraEntrada', 'SMALLDATETIME')
			   , T.Item.value('@HoraSalida', 'SMALLDATETIME')
		FROM @nodoAct.nodes('(FechaOperacion/MarcasAsistencia/MarcaDeAsistencia)') as T(Item)
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/MarcasAsistencia)') as T(Item)
		SET @NumeroAsistencia=@@ROWCOUNT

		INSERT INTO @ProximaJornada (
				ValorDoc
		        , tipoJ)
		SELECT T.Item.value('@ValorTipoDocumento', 'VARCHAR(64)')
			   , T.Item.value('@IdTipoJornada', 'INT')
		FROM @nodoAct.nodes('(FechaOperacion/JornadasProximaSemana/TipoJornadaProximaSemana)') as T(Item)
		INSERT INTO dbo.Dias2(
			    Dia)
		SELECT T.Item.query('.')
		FROM @nodoAct.nodes('(FechaOperacion/JornadasProximaSemana)') as T(Item)
		SET @NumeroJornada=@@ROWCOUNT

		DELETE FROM @NuevosEmpleados*/
		SET @contador = @contador+1
		--SET @outResultCode = @NumeroAsistencia
		DELETE FROM AD
		DBCC CHECKIDENT (AD, RESEED, 0)
		DELETE FROM dbo.EE
		DBCC CHECKIDENT (EE, RESEED, 0)
		DELETE FROM dbo.NEP3
		DBCC CHECKIDENT (NEP3, RESEED, 0)
	--END;
	END;
	SET @outResultCode = 33
	--COMMIT TRANSACTION COPIARTABLA 
	--SET @outResultCode=1;
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
		SET @outResultCode = 99
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[CopiarInterDeduc]    Script Date: 18/10/2023 21:57:10 ******/
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
/****** Object:  StoredProcedure [dbo].[CopiarInterFeri]    Script Date: 18/10/2023 21:57:10 ******/
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
ALTER DATABASE [prueba2312] SET  READ_WRITE 
GO
