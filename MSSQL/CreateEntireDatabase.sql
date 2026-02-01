USE [master]
GO
/****** Object:  Database [RpaAlmDev]    Script Date: 2/1/2026 8:44:44 AM ******/
CREATE DATABASE [RpaAlmDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RpaAlmDev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS01\MSSQL\Data\RpaAlmDev.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RpaAlmDev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS01\MSSQL\Log\RpaAlmDev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RpaAlmDev] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RpaAlmDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RpaAlmDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RpaAlmDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RpaAlmDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RpaAlmDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RpaAlmDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [RpaAlmDev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RpaAlmDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RpaAlmDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RpaAlmDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RpaAlmDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RpaAlmDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RpaAlmDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RpaAlmDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RpaAlmDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RpaAlmDev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RpaAlmDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RpaAlmDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RpaAlmDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RpaAlmDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RpaAlmDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RpaAlmDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RpaAlmDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RpaAlmDev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RpaAlmDev] SET  MULTI_USER 
GO
ALTER DATABASE [RpaAlmDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RpaAlmDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RpaAlmDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RpaAlmDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RpaAlmDev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RpaAlmDev] SET QUERY_STORE = ON
GO
ALTER DATABASE [RpaAlmDev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [RpaAlmDev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [RpaAlmDev]
GO
/****** Object:  Table [dbo].[AdDomainType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdDomainType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_AdDomainType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Automation]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[SegmentID] [int] NULL,
	[RegionID] [int] NULL,
	[FunctionID] [int] NULL,
	[RpaStatusID] [int] NOT NULL,
	[BtoJjedsID] [int] NULL,
	[BoJjedsID] [int] NULL,
	[FcJjedsID] [int] NULL,
	[SseJjedsID] [int] NULL,
	[LseJjedsID] [int] NULL,
 CONSTRAINT [PK_Automation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomationEnvironment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AutomationID] [int] NOT NULL,
	[CmdbID] [int] NOT NULL,
	[EnvironmentTypeID] [int] NULL,
 CONSTRAINT [PK_AutomationEnvironment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomationEnvironmentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_AutomationEnvironmentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomationLogEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AutomationID] [int] NOT NULL,
	[CreatedJjedsID] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AutomationLogEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmdbHelper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Zcode] [nvarchar](50) NULL,
	[OperationalStatus] [nvarchar](50) NOT NULL,
	[CmdbUpdated] DateTime2 NOT NULL
 CONSTRAINT [PK_CmdbHelper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplexityType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_ComplexityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enhancement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](255) NULL,
 CONSTRAINT [PK_Enhancement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnhancementUserStory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EnhancementID] [int] NOT NULL,
	[JiraIssue] [nvarchar](50) NOT NULL,
	[JiraIssueDate] DATETIME2 NOT NULL,
	[StoryPoints] [int] NOT NULL,
	[JiraIssueLink] [nvarchar](500) NOT NULL,
	[JiraIssueSummary] [nvarchar](max) NOT NULL,
	[JiraIssueCost] DECIMAL(19,4) NOT NULL,
 CONSTRAINT [PK_EnhancementUserStory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_FunctionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JjedsHelper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WWID] [nvarchar](9) NOT NULL,
	[CommonName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[JjedsCreated] DATETIME2 NOT NULL,
	[JjedsLastChanged] DATETIME2 NOT NULL,
 CONSTRAINT [PK_JjedsHelper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedalType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedalType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedalType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegionType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_RegionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RpaStatusType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RpaStatusType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_RpaStatusType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RpaStatusType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SegmentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_SegmentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SlaSignatureStatusType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaSignatureStatusType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_SlaSignatureStatusType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[SlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SlaMasterID] [int] NOT NULL,
	[SlaItemTypeID] [int] NOT NULL,
	[EnhancementID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] DECIMAL(19, 4) NOT NULL,
	[Total] DECIMAL(19, 4) NOT NULL
 CONSTRAINT [PK_SlaItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaItemType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Cost] DECIMAL(19, 4) NOT NULL,
	[EffectiveDate] DATE NOT NULL,
	[Disabled] BIT NOT NULL,
 CONSTRAINT [PK_SlaItemType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaLogEntry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SlaMasterID] [int] NOT NULL,
	[CreatedJjedsID] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SlaLogEntry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlaMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AutomationID] [int] NOT NULL,
	[ComplexityTypeID] [int] NULL,
	[MedalID] [int] NULL,
	[Zcode] [nvarchar](50) NULL,
	[CostCenter] [nvarchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[BtoJjedsId] [int] NOT Null,
	[BoJjedsId] [int] NOT Null,
	[FcJjedsId] [int] NOT Null,
	[SignatureStatus] [int] NOT NULL,
	[SignatureStatusDate] DATETIME2 NOT NULL
 CONSTRAINT [PK_SlaMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryPointCost](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Points] [int] NOT NULL,
	[MaxHours] [int] NOT NULL,
	[TotalCost] DECIMAL(19,4) NOT NULL,
	[JnJCostPercentage] [int] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
 CONSTRAINT [PK_StoryPointCost] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViAssignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VirtualIdentityID] [int] NOT NULL,
	[AutomationEnvironmentID] [int] NOT NULL,
	[Percentage] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_ViAssignments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VirtualIdentity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JjedsID] [int] NOT NULL,
	[AdDomainID] [int] NOT NULL,
	[HostName] [nvarchar](255) NOT NULL,
	[IPv4] [nchar](15) NOT NULL,
	[Created] [date] NOT NULL,
	[Retired] [date] NOT NULL,
 CONSTRAINT [PK_VirtualIdentity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_AdDomain_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_AdDomain_Code] ON [dbo].[AdDomainType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Automation_Name]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Automation_Name] ON [dbo].[Automation]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_AutomationEnvironment_AutomationID_EnvironmentTypeID]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_AutomationEnvironment_AutomationID_EnvironmentTypeID] ON [dbo].[AutomationEnvironment]
(
	[AutomationID] ASC,
	[EnvironmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_AutomationEnvironment_CmdbID]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_AutomationEnvironment_CmdbID] ON [dbo].[AutomationEnvironment]
(
	[CmdbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_AutomationEnvironmentType_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_AutomationEnvironmentType_Code] ON [dbo].[AutomationEnvironmentType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_CmdbHelper_AppID]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_CmdbHelper_AppID] ON [dbo].[CmdbHelper]
(
	[AppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Complexity_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Complexity_Code] ON [dbo].[ComplexityType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_EnhancementUserStory_JiraIssue]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_EnhancementUserStory_JiraIssue] ON [dbo].[EnhancementUserStory]
(
	[JiraIssue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Function_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Function_Code] ON [dbo].[FunctionType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_JjedsHelper_Email]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_JjedsHelper_Email] ON [dbo].[JjedsHelper]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_JjedsHelper_WWID]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_JjedsHelper_WWID] ON [dbo].[JjedsHelper]
(
	[WWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Medal_Name]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Medal_Name] ON [dbo].[MedalType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Region_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Region_Code] ON [dbo].[RegionType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_RpaStatus_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_RpaStatus_Code] ON [dbo].[RpaStatusType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Segment_Code]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Segment_Code] ON [dbo].[RpaStatusType]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_SlaItemType_Name]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_SlaItemType_Name] ON [dbo].[SlaItemType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_StoryPointCost_Points_EffectiveDate]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE NONCLUSTERED INDEX [UX_StoryPointCost_Points_EffectiveDate] ON [dbo].[StoryPointCost]
(
	[Points] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_ViAssignments_VirtualIdentityID_AutomationEnvironmentID]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_ViAssignments_VirtualIdentityID_AutomationEnvironmentID] ON [dbo].[ViAssignments]
(
	[VirtualIdentityID] ASC,
	[AutomationEnvironmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_VirtualIdentity_HostName]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE NONCLUSTERED INDEX [UX_VirtualIdentity_HostName] ON [dbo].[VirtualIdentity]
(
	[HostName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_VirtualIdentity_IPv4]    Script Date: 2/1/2026 8:44:45 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_VirtualIdentity_IPv4] ON [dbo].[VirtualIdentity]
(
	[IPv4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_BoWWID] FOREIGN KEY([BoJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_BoWWID]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_BtoWWID] FOREIGN KEY([BtoJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_BtoWWID]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_FcWWID] FOREIGN KEY([FcJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_FcWWID]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_Function] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[FunctionType] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_Function]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_LseWWID] FOREIGN KEY([LseJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_LseWWID]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[RegionType] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_Region]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_RpaStatus] FOREIGN KEY([RpaStatusID])
REFERENCES [dbo].[RpaStatusType] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_RpaStatus]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_Segment] FOREIGN KEY([SegmentID])
REFERENCES [dbo].[RpaStatusType] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_Segment]
GO
ALTER TABLE [dbo].[Automation]  WITH CHECK ADD  CONSTRAINT [FK_Automation_SseWWID] FOREIGN KEY([SseJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[Automation] CHECK CONSTRAINT [FK_Automation_SseWWID]
GO
ALTER TABLE [dbo].[AutomationEnvironment]  WITH CHECK ADD  CONSTRAINT [FK_AutomationEnvironment_Automation] FOREIGN KEY([AutomationID])
REFERENCES [dbo].[Automation] ([ID])
GO
ALTER TABLE [dbo].[AutomationEnvironment] CHECK CONSTRAINT [FK_AutomationEnvironment_Automation]
GO
ALTER TABLE [dbo].[AutomationEnvironment]  WITH CHECK ADD  CONSTRAINT [FK_AutomationEnvironment_CmdbID] FOREIGN KEY([CmdbID])
REFERENCES [dbo].[CmdbHelper] ([ID])
GO
ALTER TABLE [dbo].[AutomationEnvironment] CHECK CONSTRAINT [FK_AutomationEnvironment_CmdbID]
GO
ALTER TABLE [dbo].[AutomationEnvironment]  WITH CHECK ADD  CONSTRAINT [FK_AutomationEnvironment_EnvironmentType] FOREIGN KEY([EnvironmentTypeID])
REFERENCES [dbo].[AutomationEnvironmentType] ([ID])
GO
ALTER TABLE [dbo].[AutomationEnvironment] CHECK CONSTRAINT [FK_AutomationEnvironment_EnvironmentType]
GO
ALTER TABLE [dbo].[AutomationLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_AutomationLogEntry_Automation] FOREIGN KEY([AutomationID])
REFERENCES [dbo].[Automation] ([ID])
GO
ALTER TABLE [dbo].[AutomationLogEntry] CHECK CONSTRAINT [FK_AutomationLogEntry_Automation]
GO
ALTER TABLE [dbo].[AutomationLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_AutomationLogEntry_CreatedWWID] FOREIGN KEY([CreatedJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[AutomationLogEntry] CHECK CONSTRAINT [FK_AutomationLogEntry_CreatedWWID]
GO
ALTER TABLE [dbo].[EnhancementUserStory]  WITH CHECK ADD  CONSTRAINT [FK_EnhancementUserStory_Enhancement] FOREIGN KEY([EnhancementID])
REFERENCES [dbo].[Enhancement] ([ID])
GO
ALTER TABLE [dbo].[EnhancementUserStory] CHECK CONSTRAINT [FK_EnhancementUserStory_Enhancement]
GO
ALTER TABLE [dbo].[SlaItem]  WITH CHECK ADD  CONSTRAINT [FK_SlaItem_Enhancement] FOREIGN KEY([EnhancementID])
REFERENCES [dbo].[Enhancement] ([ID])
GO
ALTER TABLE [dbo].[SlaItem] CHECK CONSTRAINT [FK_SlaItem_Enhancement]
GO
ALTER TABLE [dbo].[SlaItem]  WITH CHECK ADD  CONSTRAINT [FK_SlaItem_SlaItemType] FOREIGN KEY([SlaItemTypeID])
REFERENCES [dbo].[SlaItemType] ([ID])
GO
ALTER TABLE [dbo].[SlaItem] CHECK CONSTRAINT [FK_SlaItem_SlaItemType]
GO
ALTER TABLE [dbo].[SlaItem]  WITH CHECK ADD  CONSTRAINT [FK_SlaItem_SlaMaster] FOREIGN KEY([SlaMasterID])
REFERENCES [dbo].[SlaMaster] ([ID])
GO
ALTER TABLE [dbo].[SlaItem] CHECK CONSTRAINT [FK_SlaItem_SlaMaster]
GO
ALTER TABLE [dbo].[SlaLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_SlaLogEntry_JjedsHelper] FOREIGN KEY([CreatedJjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[SlaLogEntry] CHECK CONSTRAINT [FK_SlaLogEntry_JjedsHelper]
GO
ALTER TABLE [dbo].[SlaLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_SlaLogEntry_SlaMaster] FOREIGN KEY([SlaMasterID])
REFERENCES [dbo].[SlaMaster] ([ID])
GO
ALTER TABLE [dbo].[SlaLogEntry] CHECK CONSTRAINT [FK_SlaLogEntry_SlaMaster]
GO
ALTER TABLE [dbo].[SlaMaster]  WITH CHECK ADD  CONSTRAINT [FK_SlaMaster_Automation] FOREIGN KEY([AutomationID])
REFERENCES [dbo].[Automation] ([ID])
GO
ALTER TABLE [dbo].[SlaMaster] CHECK CONSTRAINT [FK_SlaMaster_Automation]
GO
ALTER TABLE [dbo].[SlaMaster]  WITH CHECK ADD  CONSTRAINT [FK_SlaMaster_Complexity] FOREIGN KEY([ComplexityTypeID])
REFERENCES [dbo].[ComplexityType] ([ID])
GO
ALTER TABLE [dbo].[SlaMaster] CHECK CONSTRAINT [FK_SlaMaster_Complexity]
GO
ALTER TABLE [dbo].[SlaMaster]  WITH CHECK ADD  CONSTRAINT [FK_SlaMaster_Medal] FOREIGN KEY([MedalID])
REFERENCES [dbo].[MedalType] ([ID])
GO
ALTER TABLE [dbo].[SlaMaster] CHECK CONSTRAINT [FK_SlaMaster_Medal]
GO
ALTER TABLE [dbo].[ViAssignments]  WITH CHECK ADD  CONSTRAINT [FK_ViAssignments_AutomationEnvironment] FOREIGN KEY([AutomationEnvironmentID])
REFERENCES [dbo].[AutomationEnvironment] ([ID])
GO
ALTER TABLE [dbo].[ViAssignments] CHECK CONSTRAINT [FK_ViAssignments_AutomationEnvironment]
GO
ALTER TABLE [dbo].[ViAssignments]  WITH CHECK ADD  CONSTRAINT [FK_ViAssignments_VirtualIdentity] FOREIGN KEY([VirtualIdentityID])
REFERENCES [dbo].[VirtualIdentity] ([ID])
GO
ALTER TABLE [dbo].[ViAssignments] CHECK CONSTRAINT [FK_ViAssignments_VirtualIdentity]
GO
ALTER TABLE [dbo].[VirtualIdentity]  WITH CHECK ADD  CONSTRAINT [FK_VirtualIdentity_AdDomain] FOREIGN KEY([AdDomainID])
REFERENCES [dbo].[AdDomainType] ([ID])
GO
ALTER TABLE [dbo].[VirtualIdentity] CHECK CONSTRAINT [FK_VirtualIdentity_AdDomain]
GO
ALTER TABLE [dbo].[VirtualIdentity]  WITH CHECK ADD  CONSTRAINT [FK_VirtualIdentity_JjedsHelper] FOREIGN KEY([JjedsID])
REFERENCES [dbo].[JjedsHelper] ([ID])
GO
ALTER TABLE [dbo].[VirtualIdentity] CHECK CONSTRAINT [FK_VirtualIdentity_JjedsHelper]
GO

/******************************************************************************************************************/
--/****** Object:  StoredProcedure [dbo].[sp_DeleteAdDomain]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteAdDomain]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM AdDomain WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomation]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteAutomation]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM Automation WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteAutomationEnvironment]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM AutomationEnvironment WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteAutomationEnvironmentType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM AutomationEnvironmentType WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteAutomationLogEntry]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM AutomationLogEntry WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteCmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--
--CREATE    PROCEDURE [dbo].[sp_DeleteCmdbHelper]
--    @ID NVARCHAR(50)
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM CmdbHelper WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteComplexityType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM ComplexityType WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteEnhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteEnhancement]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM Enhancement WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteEnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteEnhancementUserStory]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM EnhancementUserStory WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteFunction]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteFunction]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM [FunctionType] WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteJjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteJjedsHelper]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM JjedsHelper WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteMedal]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteMedal]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM Medal WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteRegion]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteRegion]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM Region WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteRpaStatus]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteRpaStatus]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM RpaStatus WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteSegment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteSegment]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM Segment WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteSlaItem]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM SlaItem WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteSlaItemType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM SlaItemType WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteSlaLogEntry]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM SlaLogEntry WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteSlaMaster]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM SlaMaster WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteStoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteStoryPointCost]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM StoryPointCost WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteViAssignments]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM ViAssignments WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_DeleteVirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_DeleteVirtualIdentity]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        DELETE FROM VirtualIdentity WHERE ID = @ID;
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllAdDomain]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllAdDomain]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Domain, Description
--    FROM AdDomain
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomation]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllAutomation]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID,
--           BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
--    FROM Automation
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllAutomationEnvironment]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, EnvironmentTypeID
--    FROM AutomationEnvironment
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllAutomationEnvironmentType]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM AutomationEnvironmentType
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllAutomationLogEntry]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
--    FROM AutomationLogEntry
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllCmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--
--CREATE    PROCEDURE [dbo].[sp_GetAllCmdbHelper]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AppID, Name, Zcode
--    FROM CmdbHelper
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllComplexityType]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM ComplexityType
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllEnhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllEnhancement]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Scope
--    FROM Enhancement
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllEnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllEnhancementUserStory]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
--           JiraIssueLink, JiraIssueSummary, StoryPointCostID
--    FROM EnhancementUserStory
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllFunction]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllFunction]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM [FunctionType]
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllJjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllJjedsHelper]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
--    FROM JjedsHelper
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllMedal]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllMedal]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, Description
--    FROM Medal
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllRegion]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllRegion]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM Region
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllRpaStatus]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllRpaStatus]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM RpaStatus
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllSegment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllSegment]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM Segment
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllSlaItem]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
--    FROM SlaItem
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllSlaItemType]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, Description, Cost, Disabled
--    FROM SlaItemType
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllSlaLogEntry]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
--    FROM SlaLogEntry
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllSlaMaster]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode,
--           CostCenter, StartDate, EndDate
--    FROM SlaMaster
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllStoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllStoryPointCost]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
--    FROM StoryPointCost
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllViAssignments]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
--           Percentage, StartDate, EndDate
--    FROM ViAssignments
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetAllVirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetAllVirtualIdentity]
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, JjedsID, HostName, JjedsID, IPv4,
--           AdDomainID, Created, Retired
--    FROM VirtualIdentity
--    ORDER BY ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDAdDomain]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDAdDomain]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Domain, Description
--    FROM AdDomain
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomation]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDAutomation]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID,
--           BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
--    FROM Automation
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDAutomationEnvironment]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, CmdbID, EnvironmentTypeID
--    FROM AutomationEnvironment
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDAutomationEnvironmentType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM AutomationEnvironmentType
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDAutomationLogEntry]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
--    FROM AutomationLogEntry
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDCmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDCmdbHelper]
--    @ID NVARCHAR(50)
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AppID, Name, Zcode
--    FROM CmdbHelper
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDComplexityType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM ComplexityType
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDEnhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDEnhancement]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Scope
--    FROM Enhancement
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDEnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDEnhancementUserStory]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
--           JiraIssueLink, JiraIssueSummary, StoryPointCostID
--    FROM EnhancementUserStory
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDFunction]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDFunction]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM [FunctionType]
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDJjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDJjedsHelper]
--    @ID NVARCHAR(9)
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
--    FROM JjedsHelper
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDMedal]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDMedal]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, Description
--    FROM Medal
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDRegion]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDRegion]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM Region
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDRpaStatus]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDRpaStatus]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM RpaStatus
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDSegment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDSegment]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Code, Description
--    FROM Segment
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDSlaItem]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
--    FROM SlaItem
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDSlaItemType]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Name, Description, Cost, Disabled
--    FROM SlaItemType
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDSlaLogEntry]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
--    FROM SlaLogEntry
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDSlaMaster]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode,
--           CostCenter, StartDate, EndDate
--    FROM SlaMaster
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDStoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDStoryPointCost]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
--    FROM StoryPointCost
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDViAssignments]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
--           Percentage, StartDate, EndDate
--    FROM ViAssignments
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetByIDVirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_GetByIDVirtualIdentity]
--    @ID INT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    SELECT ID, JjedsID, AdDomainID, HostName,  IPv4, Created, Retired
--    FROM VirtualIdentity
--    WHERE ID = @ID;
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertAdDomain]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertAdDomain]
--    @Domain NVARCHAR(255) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO AdDomain (Domain, Description)
--        VALUES (@Domain, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertAutomation]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertAutomation]
--    @Name NVARCHAR(255) = NULL,
--    @SegmentID INT = NULL,
--    @RegionID INT = NULL,
--    @FunctionID INT = NULL,
--    @RpaStatusID INT = NULL,
--    @BtoJjedsID INT = NULL,
--    @BoJjedsID INT = NULL,
--    @FcJjedsID INT = NULL,
--    @SseJjedsID INT = NULL,
--    @LseJjedsID INT = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO Automation (Name, SegmentID, RegionID, FunctionID, RpaStatusID,
--                                BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID)
--        VALUES (@Name, @SegmentID, @RegionID, @FunctionID, @RpaStatusID,
--                @BtoJjedsID, @BoJjedsID, @FcJjedsID, @SseJjedsID, @LseJjedsID);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertAutomationEnvironment]
--    @AutomationID INT = NULL,
--    @CmdbID INT = NULL,
--    @EnvironmentTypeID INT = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO AutomationEnvironment (AutomationID, CmdbID, EnvironmentTypeID)
--        VALUES (@AutomationID, @CmdbID, @EnvironmentTypeID);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertAutomationEnvironmentType]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO AutomationEnvironmentType (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_InsertAutomationLogEntry]
--    @AutomationID INT = NULL,
--    @CreatedJjedsID INT = NULL,
--    @CreatedDate DATE = NULL,
--    @Comment NVARCHAR(MAX) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO AutomationLogEntry (AutomationID, CreatedJjedsID, CreatedDate, Comment)
--        VALUES (@AutomationID, @CreatedJjedsID, @CreatedDate, @Comment);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertCmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertCmdbHelper]
--    @AppID NVARCHAR(50),
--    @Name NVARCHAR(255) = NULL,
--    @Zcode NVARCHAR(50) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO CmdbHelper (AppID, Name, Zcode)
--        VALUES (@AppID, @Name, @Zcode);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
-- END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertComplexityType]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO ComplexityType (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertEnhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertEnhancement]
--    @Scope NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO Enhancement (Scope)
--        VALUES (@Scope);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertEnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertEnhancementUserStory]
--    @EnhancementID INT = NULL,
--    @JiraIssue NVARCHAR(50) = NULL,
--    @StoryPoints INT = NULL,
--    @JiraIssueLink NVARCHAR(500) = NULL,
--    @JiraIssueSummary NVARCHAR(MAX) = NULL,
--    @StoryPointCostID INT = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO EnhancementUserStory (EnhancementID, JiraIssue, StoryPoints,
--                                          JiraIssueLink, JiraIssueSummary, StoryPointCostID)
--        VALUES (@EnhancementID, @JiraIssue, @StoryPoints,
--                @JiraIssueLink, @JiraIssueSummary, @StoryPointCostID);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertFunction]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertFunction]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO [FunctionType] (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertJjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertJjedsHelper]	
--    @WWID INT,
--    @CommonName NVARCHAR(255) = NULL,
--    @Email NVARCHAR(255) = NULL,
--    @JjedsCreated DATE = NULL,
--    @JjedsLastChanged DATE = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO JjedsHelper (WWID, CommonName, Email, JjedsCreated, JjedsLastChanged)
--        VALUES (@WWID, @CommonName, @Email, @JjedsCreated, @JjedsLastChanged);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertMedal]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertMedal]
--    @Name NVARCHAR(255) = NULL,
--    @Description NVARCHAR(MAX) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO Medal (Name, Description)
--        VALUES (@Name, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertRegion]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertRegion]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO Region (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertRpaStatus]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertRpaStatus]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO RpaStatus (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertSegment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertSegment]
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO Segment (Code, Description)
--        VALUES (@Code, @Description);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertSlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertSlaItem]
--    @SlaMasterID INT = NULL,
--    @SlaItemTypeID INT = NULL,
--    @EnhancementID INT = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO SlaItem (SlaMasterID, SlaItemTypeID, EnhancementID)
--        VALUES (@SlaMasterID, @SlaItemTypeID, @EnhancementID);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertSlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertSlaItemType]
--    @Name NVARCHAR(255) = NULL,
--    @Description NVARCHAR(MAX) = NULL,
--    @Cost INT = NULL,
--    @Disabled INT = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO SlaItemType (Name, Description, Cost, Disabled)
--        VALUES (@Name, @Description, @Cost, @Disabled);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertSlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_InsertSlaLogEntry]
--    @SlaMasterID INT = NULL,
--    @CreatedJjedsID INT = NULL,
--    @CreatedDate DATE = NULL,
--    @Comment NVARCHAR(MAX) = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO SlaLogEntry (SlaMasterID, CreatedJjedsID, CreatedDate, Comment)
--        VALUES (@SlaMasterID, @CreatedJjedsID, @CreatedDate, @Comment);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertSlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertSlaMaster]
--    @AutomationID INT = NULL,
--    @ComplexityTypeID INT = NULL,
--    @MedalID INT = NULL,
--    @Zcode NVARCHAR(50) = NULL,
--    @CostCenter NVARCHAR(50) = NULL,
--    @StartDate DATE = NULL,
--    @EndDate DATE = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO SlaMaster (AutomationID, ComplexityTypeID, MedalID, Zcode,
--                               CostCenter, StartDate, EndDate)
--        VALUES (@AutomationID, @ComplexityTypeID, @MedalID, @Zcode,
--                @CostCenter, @StartDate, @EndDate);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertStoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertStoryPointCost]
--    @Points INT = NULL,
--    @MaxHours INT = NULL,
--    @TotalCost INT = NULL,
--    @JnJCostShare INT = NULL,
--    @EffectiveDate DATE = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO StoryPointCost (Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate)
--        VALUES (@Points, @MaxHours, @TotalCost, @JnJCostShare, @EffectiveDate);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_InsertViAssignments]
--    @VirtualIdentityID INT = NULL,
--    @AutomationEnvironmentID INT = NULL,
--    @Percentage INT = NULL,
--    @StartDate DATE = NULL,
--    @EndDate DATE = NULL,
--    @NewID INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO ViAssignments (VirtualIdentityID, AutomationEnvironmentID,
--                                    Percentage, StartDate, EndDate)
--        VALUES (@VirtualIdentityID, @AutomationEnvironmentID,
--                @Percentage, @StartDate, @EndDate);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_InsertVirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_InsertVirtualIdentity]
--    @JjedsID        INT = NULL,
--    @AdDomainID  INT = NULL,
--    @HostName    NVARCHAR(255) = NULL,
--    @IPv4        NCHAR(15) = NULL,
--    @Created     DATE = NULL,
--    @Retired     DATE = NULL,
--    @NewID INT   OUTPUT
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        INSERT INTO VirtualIdentity (JjedsID,       
--		                             AdDomainID , 
--									 HostName,   
--									 IPv4,       
--                                     Created,    
--									 Retired)
--        VALUES (@JjedsID,         
--		        @AdDomainID,  
--				@HostName,    
--				@IPv4,        
--                @Created,     
--				@Retired);
--
--        SET @NewID = SCOPE_IDENTITY();
--        SELECT @NewID AS ID;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateAdDomain]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateAdDomain]
--    @ID INT,
--    @Domain NVARCHAR(255) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE AdDomain
--        SET Domain = @Domain,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomation]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_UpdateAutomation]
--    @ID INT,
--    @Name NVARCHAR(255) = NULL,
--    @SegmentID INT = NULL,
--    @RegionID INT = NULL,
--    @FunctionID INT = NULL,
--    @RpaStatusID INT = NULL,
--    @BtoJjedsID INT = NULL,
--    @BoJjedsID INT = NULL,
--    @FcJjedsID INT = NULL,
--    @SseJjedsID INT = NULL,
--    @LseJjedsID INT = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE Automation
--        SET Name = @Name,
--            SegmentID = @SegmentID,
--            RegionID = @RegionID,
--            FunctionID = @FunctionID,
--            RpaStatusID = @RpaStatusID,
--            BtoJjedsID = @BtoJjedsID,
--            BoJjedsID = @BoJjedsID,
--            FcJjedsID = @FcJjedsID,
--            SseJjedsID = @SseJjedsID,
--            LseJjedsID = @LseJjedsID
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationEnvironment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateAutomationEnvironment]
--    @ID INT,
--    @AutomationID INT = NULL,
--    @CmdbID INT = NULL,
--    @EnvironmentTypeID INT = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE AutomationEnvironment
--        SET AutomationID = @AutomationID,
--            CmdbID = @CmdbID,
--            EnvironmentTypeID = @EnvironmentTypeID
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationEnvironmentType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateAutomationEnvironmentType]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE AutomationEnvironmentType
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_UpdateAutomationLogEntry]
--    @ID INT,
--    @AutomationID INT = NULL,
--    @CreatedJjedsID INT = NULL,
--    @CreatedDate DATE = NULL,
--    @Comment NVARCHAR(MAX) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE AutomationLogEntry
--        SET AutomationID = @AutomationID,
--            CreatedJjedsID = @CreatedJjedsID,
--            CreatedDate = @CreatedDate,
--            Comment = @Comment
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateCmdbHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateCmdbHelper]
--    @AppID NVARCHAR(50),
--    @Name NVARCHAR(255) = NULL,
--    @Zcode NVARCHAR(50) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE CmdbHelper
--        SET Name = @Name,
--            Zcode = @Zcode
--        WHERE AppID = @AppID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateComplexityType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateComplexityType]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE ComplexityType
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateEnhancement]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateEnhancement]
--    @ID INT,
--    @Scope NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE Enhancement
--        SET Scope = @Scope
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateEnhancementUserStory]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateEnhancementUserStory]
--    @ID INT,
--    @EnhancementID INT = NULL,
--    @JiraIssue NVARCHAR(50) = NULL,
--    @StoryPoints INT = NULL,
--    @JiraIssueLink NVARCHAR(500) = NULL,
--    @JiraIssueSummary NVARCHAR(MAX) = NULL,
--    @StoryPointCostID INT = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE EnhancementUserStory
--        SET EnhancementID = @EnhancementID,
--            JiraIssue = @JiraIssue,
--            StoryPoints = @StoryPoints,
--            JiraIssueLink = @JiraIssueLink,
--            JiraIssueSummary = @JiraIssueSummary,
--            StoryPointCostID = @StoryPointCostID
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateFunction]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateFunction]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE [FunctionType]
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateJjedsHelper]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateJjedsHelper]
--    @ID INT,
--	@JjedsID INT,
--    @CommonName NVARCHAR(255) = NULL,
--    @Email NVARCHAR(255) = NULL,
--    @JjedsCreated DATE = NULL,
--    @JjedsLastChanged DATE = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE JjedsHelper
--        SET CommonName = @CommonName,
--            Email = @Email,
--            JjedsCreated = @JjedsCreated,
--            JjedsLastChanged = @JjedsLastChanged
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateMedal]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateMedal]
--    @ID INT,
--    @Name NVARCHAR(255) = NULL,
--    @Description NVARCHAR(MAX) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE Medal
--        SET Name = @Name,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateRegion]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateRegion]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE Region
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateRpaStatus]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateRpaStatus]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE RpaStatus
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateSegment]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateSegment]
--    @ID INT,
--    @Code NVARCHAR(50) = NULL,
--    @Description NVARCHAR(255) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE Segment
--        SET Code = @Code,
--            Description = @Description
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaItem]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateSlaItem]
--    @ID INT,
--    @SlaMasterID INT = NULL,
--    @SlaItemTypeID INT = NULL,
--    @EnhancementID INT = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE SlaItem
--        SET SlaMasterID = @SlaMasterID,
--            SlaItemTypeID = @SlaItemTypeID,
--            EnhancementID = @EnhancementID
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaItemType]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateSlaItemType]
--    @ID INT,
--    @Name NVARCHAR(255) = NULL,
--    @Description NVARCHAR(MAX) = NULL,
--    @Cost INT = NULL,
--    @Disabled INT = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE SlaItemType
--        SET Name = @Name,
--            Description = @Description,
--            Cost = @Cost,
--            Disabled = @Disabled
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaLogEntry]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE    PROCEDURE [dbo].[sp_UpdateSlaLogEntry]
--    @ID INT,
--    @SlaMasterID INT = NULL,
--    @CreatedJjedsID INT = NULL,
--    @CreatedDate DATE = NULL,
--    @Comment NVARCHAR(MAX) = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE SlaLogEntry
--        SET SlaMasterID = @SlaMasterID,
--            CreatedJjedsID = @CreatedJjedsID,
--            CreatedDate = @CreatedDate,
--            Comment = @Comment
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaMaster]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateSlaMaster]
--    @ID INT,
--    @AutomationID INT = NULL,
--    @ComplexityTypeID INT = NULL,
--    @MedalID INT = NULL,
--    @Zcode NVARCHAR(50) = NULL,
--    @CostCenter NVARCHAR(50) = NULL,
--    @StartDate DATE = NULL,
--    @EndDate DATE = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE SlaMaster
--        SET AutomationID = @AutomationID,
--            ComplexityTypeID = @ComplexityTypeID,
--            MedalID = @MedalID,
--            Zcode = @Zcode,
--            CostCenter = @CostCenter,
--            StartDate = @StartDate,
--            EndDate = @EndDate
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateStoryPointCost]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateStoryPointCost]
--    @ID INT,
--    @Points INT = NULL,
--    @MaxHours INT = NULL,
--    @TotalCost INT = NULL,
--    @JnJCostShare INT = NULL,
--    @EffectiveDate DATE = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE StoryPointCost
--        SET Points = @Points,
--            MaxHours = @MaxHours,
--            TotalCost = @TotalCost,
--            JnJCostShare = @JnJCostShare,
--            EffectiveDate = @EffectiveDate
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateViAssignments]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateViAssignments]
--    @ID INT,
--    @VirtualIdentityID INT = NULL,
--    @AutomationEnvironmentID INT = NULL,
--    @Percentage INT = NULL,
--    @StartDate DATE = NULL,
--    @EndDate DATE = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE ViAssignments
--        SET VirtualIdentityID = @VirtualIdentityID,
--            AutomationEnvironmentID = @AutomationEnvironmentID,
--            Percentage = @Percentage,
--            StartDate = @StartDate,
--            EndDate = @EndDate
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--/****** Object:  StoredProcedure [dbo].[sp_UpdateVirtualIdentity]    Script Date: 2/1/2026 8:44:45 AM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--
--CREATE    PROCEDURE [dbo].[sp_UpdateVirtualIdentity]
--    @ID          INT,
--    @JjedsID     INT = NULL,
--    @AdDomainID  INT = NULL,
--    @HostName    NVARCHAR(255) = NULL,
--    @IPv4        NCHAR(15) = NULL,
--    @Created     DATE = NULL,
--    @Retired     DATE = NULL
--AS
--BEGIN
--    SET NOCOUNT OFF;
--    BEGIN TRY
--        UPDATE VirtualIdentity
--        SET JjedsID        = @JjedsID,
--            AdDomainID  = @AdDomainID,
--            HostName    = @HostName,
--            IPv4        = @IPv4,
--            Created     = @Created,
--            Retired     = @Retired
--        WHERE ID = @ID;
--
--        SELECT @@ROWCOUNT AS RowsAffected;
--    END TRY
--    BEGIN CATCH
--        THROW;
--    END CATCH
--END
--GO
--USE [master]
--GO
--ALTER DATABASE [RpaAlmDev] SET  READ_WRITE 
--GO
--************************************************************************************************************************/