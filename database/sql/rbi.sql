USE [master]
GO
/****** Object:  Database [rbi]    Script Date: 12/13/2018 4:02:14 PM ******/
CREATE DATABASE [rbi]
 /*CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RiskWISE5ProcessData', FILENAME = N'D:\Lab411\Base\RiskWISE5ProcessData.mdf' , SIZE = 28736KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RiskWISE5ProcessData_log', FILENAME = N'D:\Lab411\Base\RiskWISE5ProcessData_log.ldf' , SIZE = 52416KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
*/
GO
ALTER DATABASE [rbi] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rbi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rbi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rbi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rbi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rbi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rbi] SET ARITHABORT ON 
GO
ALTER DATABASE [rbi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [rbi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rbi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rbi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rbi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rbi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rbi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rbi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rbi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rbi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rbi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rbi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rbi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rbi] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [rbi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rbi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rbi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rbi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rbi] SET  MULTI_USER 
GO
ALTER DATABASE [rbi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rbi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rbi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rbi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
-- ALTER DATABASE [rbi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [rbi]
GO
/****** Object:  Table [dbo].[API_COMPONENT_TYPE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_COMPONENT_TYPE](
	[APIComponentTypeID] [int] NOT NULL,
	[APIComponentTypeName] [nvarchar](50) NOT NULL,
	[GFFSmall] [float] NULL,
	[GFFMedium] [float] NULL,
	[GFFLarge] [float] NULL,
	[GFFRupture] [float] NULL,
	[GFFTotal] [float] NULL,
	[HoleCostSmall] [float] NULL,
	[HoleCostMedium] [float] NULL,
	[HoleCostLarge] [float] NULL,
	[HoleCostRupture] [float] NULL,
	[OutageSmall] [float] NULL,
	[OutageMedium] [float] NULL,
	[OutageLarge] [float] NULL,
	[OutageRupture] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_F4676DD1_API_COMPONENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_F4676DD1_API_COMPONENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_API_COMPONENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[APIComponentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_DETAIL]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_DETAIL](
	[ComponentID] [int] NOT NULL,
	[MaterialID] [int] NULL,
	[StreamID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_COMPONENT_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_MASTER]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_MASTER](
	[ComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentNumber] [nvarchar](100) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentTypeID] [int] NOT NULL,
	[ComponentName] [nvarchar](150) NULL,
	[ComponentDesc] [nvarchar](250) NULL,
	[IsEquipment] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_MASTER_IsEquipment]  DEFAULT ((0)),
	[IsEquipmentLinked] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_MASTER_IsEquipmentLinked]  DEFAULT ((0)),
	[APIComponentTypeID] [int] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FBB73A00_COMPONENT_MASTER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FBB73A00_COMPONENT_MASTER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_MASTER] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_MODELLING]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_MODELLING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[ObjectName] [nvarchar](max) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_COMPONENT_MODELLING] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_TYPE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_TYPE](
	[ComponentTypeID] [int] NOT NULL,
	[ComponentTypeName] [nvarchar](50) NOT NULL,
	[ComponentTypeCode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_D4E2C9E6_COMPONENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_D4E2C9E6_COMPONENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[ComponentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DESIGN_CODE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESIGN_CODE](
	[DesignCodeID] [int] IDENTITY(1,1) NOT NULL,
	[DesignCode] [nvarchar](100) NOT NULL,
	[DesignCodeApp] [nvarchar](100) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_5EF56B98_DESIGN_CODE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_5EF56B98_DESIGN_CODE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DESIGN_CODES_1] PRIMARY KEY CLUSTERED 
(
	[DesignCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_CATEGORY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_CATEGORY](
	[DMCategoryID] [int] NOT NULL,
	[DMCategoryName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_3D582FB0_DM_CATEGORY_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_3D582FB0_DM_CATEGORY_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DM_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[DMCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_EXPECTED_TYPE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_EXPECTED_TYPE](
	[ExpectedTypeID] [int] NOT NULL,
	[ExpectedTypeName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DM_EXPECTED_TYPE] PRIMARY KEY CLUSTERED 
(
	[ExpectedTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_ITEMS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_ITEMS](
	[DMItemID] [int] NOT NULL,
	[DMDescription] [nvarchar](100) NOT NULL,
	[DMSeq] [int] NOT NULL,
	[DMCategoryID] [int] NOT NULL,
	[DMCode] [nvarchar](50) NOT NULL,
	[HasDF] [bit] NOT NULL,
	[FailureMode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_BCE4C1B0_DM_ITEMS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_BCE4C1B0_DM_ITEMS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DM_ITEMS] PRIMARY KEY CLUSTERED 
(
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_EXTRA_FIELDS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS](
	[EquipmentID] [int] NOT NULL,
	[ObjectField001] [nvarchar](max) NULL,
	[ObjectField002] [nvarchar](max) NULL,
	[ObjectField003] [nvarchar](max) NULL,
	[ObjectField004] [nvarchar](max) NULL,
	[ObjectField005] [nvarchar](max) NULL,
	[ObjectField006] [nvarchar](max) NULL,
	[ObjectField007] [nvarchar](max) NULL,
	[ObjectField008] [nvarchar](max) NULL,
	[ObjectField009] [nvarchar](max) NULL,
	[ObjectField010] [nvarchar](max) NULL,
	[ObjectField011] [nvarchar](max) NULL,
	[ObjectField012] [nvarchar](max) NULL,
	[ObjectField013] [nvarchar](max) NULL,
	[ObjectField014] [nvarchar](max) NULL,
	[ObjectField015] [nvarchar](max) NULL,
	[ObjectField016] [nvarchar](max) NULL,
	[ObjectField017] [nvarchar](max) NULL,
	[ObjectField018] [nvarchar](max) NULL,
	[ObjectField019] [nvarchar](max) NULL,
	[ObjectField020] [nvarchar](max) NULL,
	[ObjectField021] [nvarchar](max) NULL,
	[ObjectField022] [nvarchar](max) NULL,
	[ObjectField023] [nvarchar](max) NULL,
	[ObjectField024] [nvarchar](max) NULL,
	[ObjectField025] [nvarchar](max) NULL,
	[ObjectField026] [nvarchar](max) NULL,
	[ObjectField027] [nvarchar](max) NULL,
	[ObjectField028] [nvarchar](max) NULL,
	[ObjectField029] [nvarchar](max) NULL,
	[ObjectField030] [nvarchar](max) NULL,
	[ObjectField031] [nvarchar](max) NULL,
	[ObjectField032] [nvarchar](max) NULL,
	[ObjectField033] [nvarchar](max) NULL,
	[ObjectField034] [nvarchar](max) NULL,
	[ObjectField035] [nvarchar](max) NULL,
	[ObjectField036] [nvarchar](max) NULL,
	[ObjectField037] [nvarchar](max) NULL,
	[ObjectField038] [nvarchar](max) NULL,
	[ObjectField039] [nvarchar](max) NULL,
	[ObjectField040] [nvarchar](max) NULL,
	[ObjectField041] [nvarchar](max) NULL,
	[ObjectField042] [nvarchar](max) NULL,
	[ObjectField043] [nvarchar](max) NULL,
	[ObjectField044] [nvarchar](max) NULL,
	[ObjectField045] [nvarchar](max) NULL,
	[ObjectField046] [nvarchar](max) NULL,
	[ObjectField047] [nvarchar](max) NULL,
	[ObjectField048] [nvarchar](max) NULL,
	[ObjectField049] [nvarchar](max) NULL,
	[ObjectField050] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_EXTRA_FIELDS] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_MASTER]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_MASTER](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentNumber] [nvarchar](100) NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[EquipmentName] [nvarchar](150) NULL,
	[CommissionDate] [datetime] NOT NULL,
	[DesignCodeID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[FacilityID] [int] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[PFDNo] [nvarchar](100) NULL,
	[ProcessDescription] [nvarchar](250) NULL,
	[EquipmentDesc] [nvarchar](250) NULL,
	[IsArchived] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_MASTER_IsArchived]  DEFAULT ((0)),
	[Archived] [datetime] NULL,
	[ArchivedBy] [nvarchar](50) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_65A01428_EQUIPMENT_MASTER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_65A01428_EQUIPMENT_MASTER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_MASTER] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION](
	[RevisionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[RevisionXML] [nvarchar](max) NOT NULL,
	[RevisionNo] [int] NOT NULL,
	[IssuedBy] [nvarchar](100) NULL,
	[IssuedDate] [datetime] NULL,
	[ReviewedBy] [nvarchar](100) NULL,
	[ReviewedDate] [datetime] NULL,
	[IsReviewed] [bit] NOT NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[ApprovedDate] [datetime] NULL,
	[IsApproved] [bit] NOT NULL,
	[EndorsedBy] [nvarchar](100) NULL,
	[EndorsedDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION](
	[RevisionID] [int] NOT NULL,
	[CoverageDetailID] [int] NOT NULL,
	[ComponentNumber] [nvarchar](100) NOT NULL,
	[CoverageID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NOT NULL,
	[CarriedOut] [bit] NOT NULL,
	[CarriedOutDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC,
	[CoverageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE](
	[RevisionID] [int] NOT NULL,
	[CoverageID] [int] NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[InspPlanDate] [datetime] NULL,
	[CoverageName] [nvarchar](150) NOT NULL,
	[CoverageDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION_INSPECTION_COVERAGE] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC,
	[CoverageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_TYPE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_TYPE](
	[EquipmentTypeID] [int] NOT NULL,
	[EquipmentTypeCode] [nvarchar](50) NOT NULL,
	[EquipmentTypeName] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_4FA96E1E_EQUIPMENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_4FA96E1E_EQUIPMENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_LOOKUP](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraFieldID] [int] NOT NULL,
	[LookupText] [nvarchar](50) NULL,
	[LookupValue] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EXTRA_FIELDS_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraFieldID] [int] NOT NULL,
	[LookupText] [nvarchar](50) NULL,
	[LookupValue] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EXTRA_FIELDS_LOOKUP_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_SETTING](
	[ExtraFieldID] [int] NOT NULL,
	[FieldID] [nvarchar](15) NULL,
	[FieldName] [nvarchar](50) NULL,
	[FieldDescription] [nvarchar](100) NULL,
	[SeqNo] [int] NULL,
	[FieldType] [nvarchar](50) NULL,
	[FieldSize] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsCreated] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_IsCreated]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_FF633810_EXTRA_FIELDS_SETTING_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FF633810_EXTRA_FIELDS_SETTING_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EXTRA_FIELDS_SETTING] PRIMARY KEY CLUSTERED 
(
	[ExtraFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING_COMPONENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_SETTING_COMPONENT](
	[ExtraFieldID] [int] NOT NULL,
	[FieldID] [nvarchar](15) NULL,
	[FieldName] [nvarchar](50) NULL,
	[FieldDescription] [nvarchar](100) NULL,
	[SeqNo] [int] NULL,
	[FieldType] [nvarchar](50) NULL,
	[FieldSize] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_COMPONENT_IsActive]  DEFAULT ((0)),
	[IsCreated] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_COMPONENT_IsCreated]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_B0D0A01F_EXTRA_FIELDS_SETTING_COMPONENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B0D0A01F_EXTRA_FIELDS_SETTING_COMPONENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EXTRA_FIELDS_SETTING_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ExtraFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FACILITY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[FacilityName] [nvarchar](100) NOT NULL,
	[ManagementFactor] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_E3A6D5C7_FACILITY_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_E3A6D5C7_FACILITY_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FACILITY] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FACILITY_RISK_TARGET]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY_RISK_TARGET](
	[FacilityID] [int] NOT NULL,
	[RiskTarget_A] [float] NULL,
	[RiskTarget_B] [float] NULL,
	[RiskTarget_C] [float] NULL,
	[RiskTarget_D] [float] NULL,
	[RiskTarget_E] [float] NULL,
	[RiskTarget_CA] [float] NULL,
	[RiskTarget_FC] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_859350EE_FACILITY_RISK_TARGET_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_859350EE_FACILITY_RISK_TARGET_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FACILITY_RISK_TARGET] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FILE_COMPONENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_COMPONENT](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_EQUIPMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_EQUIPMENT](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_FACILITY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_FACILITY](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_FACILITY] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GENERIC_FLUID]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENERIC_FLUID](
	[GenericFluidID] [int] IDENTITY(1,1) NOT NULL,
	[GenericFluid] [nvarchar](100) NOT NULL,
	[NBP] [float] NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GENERIC_FLUID] PRIMARY KEY CLUSTERED 
(
	[GenericFluidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GENERIC_MATERIAL]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENERIC_MATERIAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[DesignPressure] [float] NULL,
	[DesignTemperature] [float] NULL,
	[MinDesignTemperature] [float] NULL,
	[CorrosionAllowance] [float] NULL,
	[SigmaPhase] [float] NULL,
	[SulfurContent] [nvarchar](50) NULL,
	[HeatTreatment] [nvarchar](50) NULL,
	[ReferenceTemperature] [float] NULL,
	[PTAMaterialCode] [nvarchar](70) NULL,
	[HTHAMaterialCode] [nvarchar](50) NULL,
	[IsPTA] [bit] NOT NULL,
	[IsHTHA] [bit] NOT NULL,
	[Austenitic] [bit] NOT NULL,
	[Temper] [bit] NOT NULL,
	[CarbonLowAlloy] [bit] NOT NULL,
	[NickelBased] [bit] NOT NULL,
	[ChromeMoreEqual12] [bit] NOT NULL,
	[CostFactor] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GENERIC_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IM_ITEMS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM_ITEMS](
	[IMItemID] [int] NOT NULL,
	[IMDescription] [nvarchar](100) NOT NULL,
	[IMCode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_C907A950_IM_ITEMS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_C907A950_IM_ITEMS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_IM_ITEMS] PRIMARY KEY CLUSTERED 
(
	[IMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IM_TYPE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM_TYPE](
	[IMTypeID] [int] NOT NULL,
	[IMTypeName] [nvarchar](100) NOT NULL,
	[IMTypeCode] [nvarchar](50) NOT NULL,
	[IMItemID] [int] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DCBF0E90_IM_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DCBF0E90_IM_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_IM_TYPE] PRIMARY KEY CLUSTERED 
(
	[IMTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_COMPONENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_COMPONENT](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_EQUIPMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_EQUIPMENT](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_FACILITY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_FACILITY](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_FACILITY] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE](
	[CoverageID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[CoverageName] [nvarchar](150) NOT NULL,
	[CoverageDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE] PRIMARY KEY CLUSTERED 
(
	[CoverageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE_DETAIL]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE_DETAIL](
	[CoverageDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CoverageID] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NOT NULL,
	[CarriedOut] [bit] NOT NULL,
	[CarriedOutDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[CoverageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE_EQUIPMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT](
	[CoverageID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[CoverageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_PLAN]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_PLAN](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[InspPlanDate] [datetime] NULL,
	[Remarks] [nchar](250) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_PLAN] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM_LIST_CONFIG]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_LIST_CONFIG](
	[ItemListConfigID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[TreeNode] [nvarchar](100) NOT NULL,
	[NodeSeq] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ITEM_LIST_CONFIG] PRIMARY KEY CLUSTERED 
(
	[ItemListConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MANUFACTURER]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUFACTURER](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_2E8184B5_MANUFACTURER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_2E8184B5_MANUFACTURER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_MANUFACTURER] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POINTS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POINTS](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](50) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[CorrosionRate] [float] NULL,
	[NominalThickness] [float] NULL,
	[MinReqThickness] [float] NULL,
	[ThicknessCurrent] [float] NULL,
	[ThicknessPrevious] [float] NULL,
	[DateCurrent] [datetime] NULL,
	[DatePrevious] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_POINTS] PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](50) NULL,
	[TemplateDescription] [nvarchar](200) NULL,
	[OriginalFile] [nvarchar](150) NULL,
	[ReportIdentifier] [nvarchar](50) NULL,
	[ReportID] [nvarchar](50) NULL,
	[ReportType] [nvarchar](50) NULL,
	[ReportVersion] [nvarchar](50) NULL,
	[Predefined] [bit] NOT NULL CONSTRAINT [DF_REPORT_TEMPLATE_Predefined]  DEFAULT ((0)),
	[TemplateBinary] [varbinary](max) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_2C65B66D_REPORT_TEMPLATE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_2C65B66D_REPORT_TEMPLATE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_REPORT_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_ASSESSMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT](
	[ID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_TEMPLATE_ASSESSMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT](
	[EquipmentID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_TEMPLATE_COMPONENT_DEFAULT] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_EQUIPMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT](
	[EquipmentID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_ASSESSMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_ASSESSMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[AssessmentDate] [datetime] NULL,
	[AssessmentMethod] [int] NULL,
	[RiskAnalysisPeriod] [int] NULL,
	[IsEquipmentLinked] [bit] NOT NULL CONSTRAINT [DF_RW_ASSESSMENT_IsEquipmentLinked]  DEFAULT ((0)),
	[RecordType] [nvarchar](2) NULL,
	[ProposalNo] [int] NULL,
	[RevisionNo] [int] NULL,
	[IsRecommend] [bit] NOT NULL CONSTRAINT [DF_RW_ASSESSMENT_IsRecommend]  DEFAULT ((0)),
	[ProposalOrRevision] [nvarchar](2) NULL,
	[AdoptedBy] [nvarchar](50) NULL,
	[AdoptedDate] [datetime] NULL,
	[RecommendedBy] [nvarchar](50) NULL,
	[RecommendedDate] [datetime] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DCAE204E_RW_ASSESSMENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DCAE204E_RW_ASSESSMENT_AuditingID]  DEFAULT (newid()),
	[ProposalName] [nvarchar](max) NULL,
	[AddByExcel] [bit] NULL,
 CONSTRAINT [PK_RW_ASSESSMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CA_LEVEL1]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CA_LEVEL1](
	[ID] [int] NOT NULL,
	[Release_Phase] [nvarchar](50) NULL,
	[fact_di] [float] NULL,
	[fact_mit] [float] NULL,
	[fact_ait] [float] NULL,
	[CA_cmd] [float] NULL,
	[CA_inj_flame] [float] NULL,
	[CA_inj_toxic] [float] NULL,
	[CA_inj_ntnf] [float] NULL,
	[FC_cmd] [float] NULL,
	[FC_affa] [float] NULL,
	[FC_prod] [float] NULL,
	[FC_inj] [float] NULL,
	[FC_envi] [float] NULL,
	[FC_total] [float] NULL,
	[FCOF_Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_RW_CA_LEVEL1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CA_TANK]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CA_TANK](
	[ID] [int] NOT NULL,
	[Hydraulic_Water] [float] NULL,
	[Hydraulic_Fluid] [float] NULL,
	[Seepage_Velocity] [float] NULL,
	[Flow_Rate_D1] [float] NULL,
	[Flow_Rate_D2] [float] NULL,
	[Flow_Rate_D3] [float] NULL,
	[Flow_Rate_D4] [float] NULL,
	[Leak_Duration_D1] [float] NULL,
	[Leak_Duration_D2] [float] NULL,
	[Leak_Duration_D3] [float] NULL,
	[Leak_Duration_D4] [float] NULL,
	[Release_Volume_Leak_D1] [float] NULL,
	[Release_Volume_Leak_D2] [float] NULL,
	[Release_Volume_Leak_D3] [float] NULL,
	[Release_Volume_Leak_D4] [float] NULL,
	[Release_Volume_Rupture] [float] NULL,
	[Liquid_Height] [float] NULL,
	[Volume_Fluid] [float] NULL,
	[Time_Leak_Ground] [float] NULL,
	[Volume_SubSoil_Leak_D1] [float] NULL,
	[Volume_SubSoil_Leak_D4] [float] NULL,
	[Volume_Ground_Water_Leak_D1] [float] NULL,
	[Volume_Ground_Water_Leak_D4] [float] NULL,
	[Barrel_Dike_Leak] [float] NULL,
	[Barrel_Dike_Rupture] [float] NULL,
	[Barrel_Onsite_Leak] [float] NULL,
	[Barrel_Onsite_Rupture] [float] NULL,
	[Barrel_Offsite_Leak] [float] NULL,
	[Barrel_Offsite_Rupture] [float] NULL,
	[Barrel_Water_Leak] [float] NULL,
	[Barrel_Water_Rupture] [float] NULL,
	[FC_Environ_Leak] [float] NULL,
	[FC_Environ_Rupture] [float] NULL,
	[FC_Environ] [float] NULL,
	[Material_Factor] [float] NULL,
	[Component_Damage_Cost] [float] NULL,
	[Business_Cost] [float] NULL,
	[Consequence] [float] NULL,
	[ConsequenceCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_RW_CA_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CF_MASTER]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CF_MASTER](
	[ID] [int] NOT NULL,
	[CF1] [float] NULL,
	[CF2] [float] NULL,
	[CF3] [float] NULL,
	[CF4] [float] NULL,
	[CF5] [float] NULL,
	[CF6] [float] NULL,
	[CF7] [float] NULL,
	[CF8] [float] NULL,
	[CF9] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CF_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COATING]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COATING](
	[ID] [int] NOT NULL,
	[ExternalCoating] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_ExternalCoating]  DEFAULT ((0)),
	[ExternalInsulation] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_ExternalInsulation]  DEFAULT ((0)),
	[InternalCladding] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalCladding]  DEFAULT ((0)),
	[InternalCoating] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalCoating]  DEFAULT ((0)),
	[InternalLining] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalLining]  DEFAULT ((0)),
	[ExternalCoatingDate] [datetime] NULL,
	[ExternalCoatingQuality] [nvarchar](50) NULL,
	[ExternalInsulationType] [nvarchar](50) NULL,
	[InsulationCondition] [nvarchar](50) NULL,
	[InsulationContainsChloride] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InsulationContainsChloride]  DEFAULT ((0)),
	[InternalLinerCondition] [nvarchar](50) NULL,
	[InternalLinerType] [nvarchar](50) NULL,
	[CladdingCorrosionRate] [float] NULL,
	[SupportConfigNotAllowCoatingMaint] [bit] NOT NULL CONSTRAINT [DF_RW_COATING_SupportConfigNotAllowCoatingMaint]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_363BB8AC_RW_COATING_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_363BB8AC_RW_COATING_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_GEOMETRIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COF_FACTOR]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COF_FACTOR](
	[ID] [int] NULL,
	[ca_inj_flame] [float] NULL,
	[ca_cmd_flame] [float] NULL,
	[fc_cmd] [float] NULL,
	[fc_affa] [float] NULL,
	[fc_prod] [float] NULL,
	[fc_inj] [float] NULL,
	[fc_environment] [float] NULL,
	[fc_total] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COMPONENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COMPONENT](
	[ID] [int] NOT NULL,
	[NominalDiameter] [float] NULL,
	[NominalThickness] [float] NULL,
	[CurrentThickness] [float] NULL,
	[MinReqThickness] [float] NULL,
	[CurrentCorrosionRate] [float] NULL,
	[BranchDiameter] [nvarchar](50) NULL,
	[BranchJointType] [nvarchar](50) NULL,
	[BrinnelHardness] [nvarchar](50) NULL,
	[ChemicalInjection] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_ChemicalInjection]  DEFAULT ((0)),
	[HighlyInjectionInsp] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_HighlyInjectionInsp]  DEFAULT ((0)),
	[ComplexityProtrusion] [nvarchar](50) NULL,
	[CorrectiveAction] [nvarchar](50) NULL,
	[CracksPresent] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_CracksPresent]  DEFAULT ((0)),
	[CyclicLoadingWitin15_25m] [nvarchar](50) NULL,
	[DamageFoundInspection] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_DamageFoundInspection]  DEFAULT ((0)),
	[DeltaFATT] [float] NULL,
	[NumberPipeFittings] [nvarchar](50) NULL,
	[PipeCondition] [nvarchar](50) NULL,
	[PreviousFailures] [nvarchar](50) NULL,
	[ShakingAmount] [nvarchar](50) NULL,
	[ShakingDetected] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_ShakingDetected]  DEFAULT ((0)),
	[ShakingTime] [nvarchar](50) NULL,
	[TrampElements] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_TrampElements]  DEFAULT ((0)),
	[ShellHeight] [float] NULL,
	[ReleasePreventionBarrier] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_ReleasePreventionBarrier]  DEFAULT ((0)),
	[ConcreteFoundation] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_ConcreteFoundation]  DEFAULT ((0)),
	[SeverityOfVibration] [nvarchar](50) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_1A28FCEA_RW_COMPONENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_1A28FCEA_RW_COMPONENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_PROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CORROSION_RATE_TANK]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CORROSION_RATE_TANK](
	[ID] [int] NOT NULL,
	[CorrosionID] [int] IDENTITY(1,1) NOT NULL,
	[SoilSideCorrosionRate] [float] NULL,
	[ProductSideCorrosionRate] [float] NULL,
	[PotentialCorrosion] [nvarchar](100) NULL,
	[TankPadMaterial] [nvarchar](100) NULL,
	[TankDrainageType] [nvarchar](100) NULL,
	[CathodicProtectionType] [nvarchar](100) NULL,
	[TankBottomType] [nvarchar](100) NULL,
	[SoilSideTemperature] [nvarchar](100) NULL,
	[ProductCondition] [nvarchar](100) NULL,
	[ProductSideTemp] [nvarchar](100) NULL,
	[SteamCoil] [nvarchar](50) NULL,
	[WaterDrawOff] [nvarchar](50) NULL,
	[ProductSideBottom] [nvarchar](100) NULL,
	[ModifiedSoilSideCorrosionRate] [float] NULL,
	[ModifiedProductSideCorrosionRate] [float] NULL,
	[FinalEstimatedCorrosionRate] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_CORROSION_RATE_TANK] PRIMARY KEY CLUSTERED 
(
	[CorrosionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_DAMAGE_MECHANISM]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_DAMAGE_MECHANISM](
	[ID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsActive]  DEFAULT ((0)),
	[Notes] [nvarchar](255) NULL,
	[ExpectedTypeID] [int] NULL,
	[IsEL] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsEL]  DEFAULT ((0)),
	[ELValue] [float] NULL,
	[IsDF] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsDF]  DEFAULT ((0)),
	[IsUserDisabled] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsUserDisabled]  DEFAULT ((0)),
	[DF1] [float] NULL,
	[DF2] [float] NULL,
	[DF3] [float] NULL,
	[DFBase] [float] NULL,
	[RLI] [float] NULL,
	[HighestInspectionEffectiveness] [nvarchar](50) NULL,
	[SecondInspectionEffectiveness] [nvarchar](50) NULL,
	[NumberOfInspections] [int] NULL,
	[LastInspDate] [datetime] NULL,
	[InspDueDate] [datetime] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DB30996F_RW_DAMAGE_MECHANISM_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DB30996F_RW_DAMAGE_MECHANISM_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_DAMAGE_MECHANISM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EQUIPMENT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EQUIPMENT](
	[ID] [int] NOT NULL,
	[CommissionDate] [datetime] NOT NULL,
	[AdminUpsetManagement] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_AdminUpsetManagement]  DEFAULT ((0)),
	[ContainsDeadlegs] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_ContainsDeadlegs]  DEFAULT ((0)),
	[CyclicOperation] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_CyclicOperation]  DEFAULT ((0)),
	[HighlyDeadlegInsp] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_HighlyDeadlegInsp]  DEFAULT ((0)),
	[DowntimeProtectionUsed] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_DowntimeProtectionUsed]  DEFAULT ((0)),
	[ExternalEnvironment] [nvarchar](50) NULL,
	[HeatTraced] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_HeatTraced]  DEFAULT ((0)),
	[InterfaceSoilWater] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_InterfaceSoilWater]  DEFAULT ((0)),
	[LinerOnlineMonitoring] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_LinerOnlineMonitoring]  DEFAULT ((0)),
	[MaterialExposedToClExt] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_MaterialExposedToClExt]  DEFAULT ((0)),
	[MinReqTemperaturePressurisation] [float] NULL,
	[OnlineMonitoring] [nvarchar](100) NULL,
	[PresenceSulphidesO2] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PresenceSulphidesO2]  DEFAULT ((0)),
	[PresenceSulphidesO2Shutdown] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PresenceSulphidesO2Shutdown]  DEFAULT ((0)),
	[PressurisationControlled] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PressurisationControlled]  DEFAULT ((0)),
	[PWHT] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PWHT]  DEFAULT ((0)),
	[SteamOutWaterFlush] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_SteamedOut]  DEFAULT ((0)),
	[ManagementFactor] [float] NULL,
	[ThermalHistory] [nvarchar](50) NULL,
	[YearLowestExpTemp] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_YearLowestExpTemp]  DEFAULT ((0)),
	[Volume] [float] NULL,
	[TypeOfSoil] [nvarchar](50) NULL,
	[EnvironmentSensitivity] [nvarchar](50) NULL,
	[DistanceToGroundWater] [float] NULL,
	[AdjustmentSettle] [nvarchar](100) NULL,
	[ComponentIsWelded] [bit] NOT NULL CONSTRAINT [DF_RW_EQUIPMENT_ComponentIsWelded]  DEFAULT ((0)),
	[TankIsMaintained] [bit] NOT NULL CONSTRAINT [DF_RW_EQUIPMENT_TankIsMaintained]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_D4198DA6_RW_EQUIPMENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_D4198DA6_RW_EQUIPMENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_PROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EXTCOR_TEMPERATURE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EXTCOR_TEMPERATURE](
	[ID] [int] NOT NULL,
	[Minus12ToMinus8] [float] NULL,
	[Minus8ToPlus6] [float] NULL,
	[Plus6ToPlus32] [float] NULL,
	[Plus32ToPlus71] [float] NULL,
	[Plus71ToPlus107] [float] NULL,
	[Plus107ToPlus121] [float] NULL,
	[Plus121ToPlus135] [float] NULL,
	[Plus135ToPlus162] [float] NULL,
	[Plus162ToPlus176] [float] NULL,
	[MoreThanPlus176] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FF3B9BFE_RW_EXTCOR_TEMPERATURE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FF3B9BFE_RW_EXTCOR_TEMPERATURE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_EXTCOR_TEMPERATURE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EXTRA_FIELDS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EXTRA_FIELDS](
	[ID] [int] NOT NULL,
	[ObjectField001] [nvarchar](max) NULL,
	[ObjectField002] [nvarchar](max) NULL,
	[ObjectField003] [nvarchar](max) NULL,
	[ObjectField004] [nvarchar](max) NULL,
	[ObjectField005] [nvarchar](max) NULL,
	[ObjectField006] [nvarchar](max) NULL,
	[ObjectField007] [nvarchar](max) NULL,
	[ObjectField008] [nvarchar](max) NULL,
	[ObjectField009] [nvarchar](max) NULL,
	[ObjectField010] [nvarchar](max) NULL,
	[ObjectField011] [nvarchar](max) NULL,
	[ObjectField012] [nvarchar](max) NULL,
	[ObjectField013] [nvarchar](max) NULL,
	[ObjectField014] [nvarchar](max) NULL,
	[ObjectField015] [nvarchar](max) NULL,
	[ObjectField016] [nvarchar](max) NULL,
	[ObjectField017] [nvarchar](max) NULL,
	[ObjectField018] [nvarchar](max) NULL,
	[ObjectField019] [nvarchar](max) NULL,
	[ObjectField020] [nvarchar](max) NULL,
	[ObjectField021] [nvarchar](max) NULL,
	[ObjectField022] [nvarchar](max) NULL,
	[ObjectField023] [nvarchar](max) NULL,
	[ObjectField024] [nvarchar](max) NULL,
	[ObjectField025] [nvarchar](max) NULL,
	[ObjectField026] [nvarchar](max) NULL,
	[ObjectField027] [nvarchar](max) NULL,
	[ObjectField028] [nvarchar](max) NULL,
	[ObjectField029] [nvarchar](max) NULL,
	[ObjectField030] [nvarchar](max) NULL,
	[ObjectField031] [nvarchar](max) NULL,
	[ObjectField032] [nvarchar](max) NULL,
	[ObjectField033] [nvarchar](max) NULL,
	[ObjectField034] [nvarchar](max) NULL,
	[ObjectField035] [nvarchar](max) NULL,
	[ObjectField036] [nvarchar](max) NULL,
	[ObjectField037] [nvarchar](max) NULL,
	[ObjectField038] [nvarchar](max) NULL,
	[ObjectField039] [nvarchar](max) NULL,
	[ObjectField040] [nvarchar](max) NULL,
	[ObjectField041] [nvarchar](max) NULL,
	[ObjectField042] [nvarchar](max) NULL,
	[ObjectField043] [nvarchar](max) NULL,
	[ObjectField044] [nvarchar](max) NULL,
	[ObjectField045] [nvarchar](max) NULL,
	[ObjectField046] [nvarchar](max) NULL,
	[ObjectField047] [nvarchar](max) NULL,
	[ObjectField048] [nvarchar](max) NULL,
	[ObjectField049] [nvarchar](max) NULL,
	[ObjectField050] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_EXTRA_FIELDS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF](
	[ID] [int] NOT NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](50) NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF_FLUID]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_FLUID](
	[ID] [int] NOT NULL,
	[Cp] [float] NULL,
	[k] [float] NULL,
	[GFFTotal] [float] NULL,
	[Kv_n] [float] NULL,
	[ReleasePhase] [varchar](15) NULL,
	[Cd] [float] NULL,
	[Ptrans] [float] NULL,
	[NBP] [float] NULL,
	[Density] [float] NULL,
	[MW] [float] NULL,
	[R] [float] NULL,
	[Ps] [float] NULL,
	[Ts] [float] NULL,
	[Patm] [float] NULL,
	[fact_di] [float] NULL,
	[fact_mit] [float] NULL,
	[fact_AIT] [float] NULL,
	[g] [float] NULL,
	[h] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_FULL_COF_HOLE_SIZE]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_HOLE_SIZE](
	[ID] [int] NOT NULL,
	[GFF_n] [varchar](15) NOT NULL,
	[An] [float] NULL,
	[Wn] [float] NULL,
	[t_n] [float] NULL,
	[ld_max_n] [float] NULL,
	[mass_add_n] [float] NULL,
	[mass_avail_n] [float] NULL,
	[rate_n] [float] NULL,
	[ld_n] [float] NULL,
	[mass_n] [float] NULL,
	[eneff_n] [float] NULL,
	[factIC_n] [float] NULL,
	[ReleaseType_n] [varchar](15) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_HOLE_SIZE_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[GFF_n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_FULL_COF_INPUT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_INPUT](
	[ID] [int] NOT NULL,
	[Mitigation] [nvarchar](50) NULL,
	[DetectionType] [nvarchar](50) NULL,
	[IsolationType] [nvarchar](50) NULL,
	[mass_comp] [float] NULL,
	[mass_inv] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_INPUT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF_TANK]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_TANK](
	[ID] [int] NOT NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](50) NULL,
	[ProdCost] [float] NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_FULL_COF_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_FCOF]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_FCOF](
	[ID] [int] NOT NULL,
	[FCoFValue] [float] NULL,
	[FCoFCategory] [nvarchar](50) NULL,
	[AIL] [bit] NOT NULL CONSTRAINT [DF_RW_FULL_FCOF_AIL]  DEFAULT ((0)),
	[envcost] [float] NULL,
	[equipcost] [float] NULL,
	[prodcost] [float] NULL,
	[popdens] [float] NULL,
	[injcost] [float] NULL,
	[FCoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FULLY_FCOF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_POF]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_POF](
	[ID] [int] NOT NULL,
	[ThinningAP1] [float] NULL,
	[ThinningAP2] [float] NULL,
	[ThinningAP3] [float] NULL,
	[SCCAP1] [float] NULL,
	[SCCAP2] [float] NULL,
	[SCCAP3] [float] NULL,
	[ExternalAP1] [float] NULL,
	[ExternalAP2] [float] NULL,
	[ExternalAP3] [float] NULL,
	[BrittleAP1] [float] NULL,
	[BrittleAP2] [float] NULL,
	[BrittleAP3] [float] NULL,
	[HTHA_AP1] [float] NULL,
	[HTHA_AP2] [float] NULL,
	[HTHA_AP3] [float] NULL,
	[FatigueAP1] [float] NULL,
	[FatigueAP2] [float] NULL,
	[FatigueAP3] [float] NULL,
	[FMS] [float] NULL,
	[ThinningType] [nvarchar](7) NULL,
	[GFFTotal] [float] NULL,
	[ThinningLocalAP1] [float] NULL,
	[ThinningLocalAP2] [float] NULL,
	[ThinningLocalAP3] [float] NULL,
	[ThinningGeneralAP1] [float] NULL,
	[ThinningGeneralAP2] [float] NULL,
	[ThinningGeneralAP3] [float] NULL,
	[TotalDFAP1] [float] NULL,
	[TotalDFAP2] [float] NULL,
	[TotalDFAP3] [float] NULL,
	[PoFAP1] [float] NULL,
	[PoFAP2] [float] NULL,
	[PoFAP3] [float] NULL,
	[MatrixPoFAP1] [float] NULL,
	[MatrixPoFAP2] [float] NULL,
	[MatrixPoFAP3] [float] NULL,
	[RLI] [float] NULL,
	[SemiAP1] [float] NULL,
	[SemiAP2] [float] NULL,
	[SemiAP3] [float] NULL,
	[PoFAP1Category] [nvarchar](50) NULL,
	[PoFAP2Category] [nvarchar](50) NULL,
	[PoFAP3Category] [nvarchar](50) NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](2) NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_0AD829CC_RW_FULL_POF_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_0AD829CC_RW_FULL_POF_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FULLY_POF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INPUT_CA_LEVEL1]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INPUT_CA_LEVEL1](
	[ID] [int] NOT NULL,
	[API_FLUID] [nvarchar](50) NULL,
	[SYSTEM] [nvarchar](50) NULL,
	[Release_Duration] [nvarchar](50) NULL,
	[Detection_Type] [nvarchar](50) NULL,
	[Isulation_Type] [nvarchar](50) NULL,
	[Mitigation_System] [nvarchar](150) NULL,
	[Equipment_Cost] [float] NULL,
	[Injure_Cost] [float] NULL,
	[Evironment_Cost] [float] NULL,
	[Toxic_Percent] [float] NULL,
	[Personal_Density] [float] NULL,
	[Material_Cost] [float] NULL,
	[Production_Cost] [float] NULL,
	[Mass_Inventory] [float] NULL,
	[Mass_Component] [float] NULL,
	[Stored_Pressure] [float] NULL,
	[Stored_Temp] [float] NULL,
 CONSTRAINT [PK_RW_INPUT_CA_LEVEL1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INPUT_CA_TANK]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INPUT_CA_TANK](
	[ID] [int] NOT NULL,
	[FLUID_HEIGHT] [float] NULL,
	[SHELL_COURSE_HEIGHT] [float] NULL,
	[TANK_DIAMETTER] [float] NULL,
	[Prevention_Barrier] [bit] NOT NULL,
	[Environ_Sensitivity] [nvarchar](50) NULL,
	[P_lvdike] [float] NULL,
	[P_onsite] [float] NULL,
	[P_offsite] [float] NULL,
	[Soil_Type] [nvarchar](150) NULL,
	[TANK_FLUID] [nvarchar](150) NULL,
	[API_FLUID] [nvarchar](50) NULL,
	[SW] [float] NULL,
	[ProductionCost] [float] NULL,
 CONSTRAINT [PK_RW_INPUT_CA_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INSPECTION_HISTORY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INSPECTION_HISTORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InspectionPlanName] [nvarchar](max) NULL,
	[InspectionCoverageName] [nvarchar](max) NULL,
	[EquipmentNumber] [nvarchar](50) NULL,
	[ComponentNumber] [nvarchar](50) NULL,
	[DM] [nvarchar](max) NULL,
	[InspectionType] [nvarchar](max) NULL,
	[InspectionDate] [datetime] NULL,
	[InspectionEffective] [nvarchar](1) NULL,
 CONSTRAINT [PK_RW_INSPECTION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_LF_DETAIL]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_LF_DETAIL](
	[ID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[LF2AP1] [float] NULL,
	[LF2AP2] [float] NULL,
	[LF2AP3] [float] NULL,
	[LF2FactorAP1] [float] NULL,
	[LF2FactorAP2] [float] NULL,
	[LF2FactorAP3] [float] NULL,
	[LF3] [float] NULL,
	[LF3Factor] [float] NULL,
	[LCF] [float] NULL,
	[LHAP1Category] [nvarchar](2) NULL,
	[LHAP2Category] [nvarchar](2) NULL,
	[LHAP3Category] [nvarchar](2) NULL,
	[LHAP1Value] [float] NULL,
	[LHAP2Value] [float] NULL,
	[LHAP3Value] [float] NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](2) NULL,
	[RLI] [float] NULL,
	[IsEL] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_LF_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_LF_MASTER]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_LF_MASTER](
	[ID] [int] NOT NULL,
	[LF1Factor] [float] NULL,
	[LF4Factor] [float] NULL,
	[LF5Factor] [float] NULL,
	[LF6Factor] [float] NULL,
	[LF7Factor] [float] NULL,
	[LF1] [float] NULL,
	[LF4] [float] NULL,
	[LF5] [float] NULL,
	[LF6] [float] NULL,
	[LF7] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LF_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_MATERIAL]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_MATERIAL](
	[ID] [int] NOT NULL,
	[MaterialName] [nvarchar](100) NULL,
	[DesignPressure] [float] NULL,
	[DesignTemperature] [float] NULL,
	[MinDesignTemperature] [float] NULL,
	[BrittleFractureThickness] [float] NULL,
	[CorrosionAllowance] [float] NULL,
	[SigmaPhase] [float] NULL,
	[SulfurContent] [nvarchar](50) NULL,
	[HeatTreatment] [nvarchar](50) NULL,
	[ReferenceTemperature] [float] NULL,
	[PTAMaterialCode] [nvarchar](70) NULL,
	[HTHAMaterialCode] [nvarchar](50) NULL,
	[IsPTA] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_IsPTA]  DEFAULT ((0)),
	[IsHTHA] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_IsHTHA]  DEFAULT ((0)),
	[Austenitic] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_Austenitic]  DEFAULT ((0)),
	[Temper] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_Temper]  DEFAULT ((0)),
	[CarbonLowAlloy] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_CarbonLowAlloy]  DEFAULT ((0)),
	[NickelBased] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_NickelBased]  DEFAULT ((0)),
	[ChromeMoreEqual12] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_ChromeLess12]  DEFAULT ((0)),
	[AllowableStress] [float] NULL,
	[CostFactor] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_4634F597_RW_MATERIAL_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_4634F597_RW_MATERIAL_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_MATERIALS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_POINTS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_POINTS](
	[ID] [int] NOT NULL,
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](100) NULL,
	[GaugePoint] [nvarchar](100) NULL,
	[PointLocation] [nvarchar](100) NULL,
	[PIDNo] [nvarchar](100) NULL,
	[FittingDesc] [nvarchar](100) NULL,
	[Specification] [nvarchar](100) NULL,
	[Size] [nvarchar](50) NULL,
	[MinReqThickness] [float] NULL,
	[ThicknessReading] [float] NULL,
	[ThicknessDate] [datetime] NULL,
	[NominalThickness] [float] NULL,
	[EstimatedCorrosionRate] [float] NULL,
	[CalculatedCorrosionRate] [float] NULL,
	[CalculatedRemainingLife] [float] NULL,
	[k] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_POINTS_1] PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRIMARY_FLUID]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRIMARY_FLUID](
	[ID] [int] NOT NULL,
	[FluidName] [nvarchar](100) NULL,
	[NBP] [float] NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRIMARY_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_REVISION_INSPECTION]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_REVISION_INSPECTION](
	[ID] [int] NOT NULL,
	[CoverageDetailID] [int] NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[CoverageName] [nvarchar](150) NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NOT NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_REVISION_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[CoverageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_RISK_GRAPH]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_RISK_GRAPH](
	[ID] [int] NOT NULL,
	[risktarget] [float] NULL,
	[risk1] [float] NULL,
	[risk2] [float] NULL,
	[risk3] [float] NULL,
	[risk4] [float] NULL,
	[risk5] [float] NULL,
	[risk6] [float] NULL,
	[risk7] [float] NULL,
	[risk8] [float] NULL,
	[risk9] [float] NULL,
	[risk10] [float] NULL,
	[risk11] [float] NULL,
	[risk12] [float] NULL,
	[risk13] [float] NULL,
	[risk14] [float] NULL,
	[risk15] [float] NULL,
 CONSTRAINT [PK_RW_RISK_GRAPH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_RISK_TARGET]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_RISK_TARGET](
	[ID] [int] NOT NULL,
	[RiskTarget_A] [float] NULL,
	[RiskTarget_B] [float] NULL,
	[RiskTarget_C] [float] NULL,
	[RiskTarget_D] [float] NULL,
	[RiskTarget_E] [float] NULL,
	[RiskTarget_CA] [float] NULL,
	[RiskTarget_FC] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_RISK_TARGET] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SAFETY_FACTOR]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SAFETY_FACTOR](
	[ID] [int] NOT NULL,
	[SafetyFactorScheme] [nvarchar](50) NULL,
	[A] [float] NULL,
	[B] [float] NULL,
	[C] [float] NULL,
	[D] [float] NULL,
	[E] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_SAFETY_FACTOR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SECONDARY_FLUID]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SECONDARY_FLUID](
	[ID] [int] NOT NULL,
	[FluidName] [nvarchar](100) NULL,
	[NBP] [float] NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_SECONDARY_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SETTINGS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SETTINGS](
	[ID] [int] NOT NULL,
	[DefaultAssessmentMethod] [int] NOT NULL,
	[SchemaVersion] [nvarchar](50) NULL,
	[UnlockCode] [nvarchar](max) NULL,
	[CompanyName] [nvarchar](250) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_84D4695A_rw_settings_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_84D4695A_rw_settings_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_SETTINGS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_STREAM]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_STREAM](
	[ID] [int] NOT NULL,
	[AmineSolution] [nvarchar](50) NULL,
	[AqueousOperation] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_AqueousOperation]  DEFAULT ((0)),
	[AqueousShutdown] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_AqueousShutdown]  DEFAULT ((0)),
	[ToxicConstituent] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ToxicConstituent]  DEFAULT ((0)),
	[Caustic] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Caustic]  DEFAULT ((0)),
	[Chloride] [float] NULL,
	[CO3Concentration] [float] NULL,
	[Cyanide] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Cyanide]  DEFAULT ((0)),
	[ExposedToGasAmine] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ExposedToGasAmine]  DEFAULT ((0)),
	[ExposedToSulphur] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ExposedToSulphur]  DEFAULT ((0)),
	[ExposureToAmine] [nvarchar](50) NULL,
	[FlammableFluidID] [int] NULL,
	[FlowRate] [float] NULL,
	[H2S] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_H2S]  DEFAULT ((0)),
	[H2SInWater] [float] NULL,
	[Hydrogen] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Hydrogen]  DEFAULT ((0)),
	[H2SPartialPressure] [float] NULL,
	[Hydrofluoric] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Hydrofluoric]  DEFAULT ((0)),
	[MaterialExposedToClInt] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_MaterialExposedToClInt]  DEFAULT ((0)),
	[MaxOperatingPressure] [float] NULL,
	[MaxOperatingTemperature] [float] NULL,
	[MinOperatingPressure] [float] NULL,
	[MinOperatingTemperature] [float] NULL,
	[CriticalExposureTemperature] [float] NULL,
	[ModelFluidID] [int] NULL,
	[NaOHConcentration] [float] NULL,
	[NonFlameToxicFluidID] [int] NULL,
	[ReleaseFluidPercentToxic] [float] NULL,
	[StoragePhase] [nvarchar](50) NULL,
	[ToxicFluidID] [int] NULL,
	[WaterpH] [float] NULL,
	[TankFluidName] [nvarchar](50) NULL,
	[FluidHeight] [float] NULL,
	[FluidLeaveDikePercent] [float] NULL,
	[FluidLeaveDikeRemainOnSitePercent] [float] NULL,
	[FluidGoOffSitePercent] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_5CD0A346_RW_STREAM_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_5CD0A346_RW_STREAM_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_STREAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_THICKNESS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_THICKNESS](
	[ID] [int] NOT NULL,
	[PointID] [int] NOT NULL,
	[ThicknessID] [int] IDENTITY(1,1) NOT NULL,
	[ThicknessDate] [datetime] NULL,
	[MinReading] [float] NULL,
	[MaxReading] [float] NULL,
	[Orientation] [nvarchar](50) NULL,
	[InspectionComment] [nvarchar](100) NULL,
	[AnalysisComment] [nvarchar](100) NULL,
	[ValidReading] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_THICKNESS_1] PRIMARY KEY CLUSTERED 
(
	[ThicknessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAFETY_FACTORS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAFETY_FACTORS](
	[SafetyFactorID] [int] NOT NULL,
	[SafetyFactorName] [nvarchar](50) NOT NULL,
	[A] [float] NOT NULL,
	[B] [float] NOT NULL,
	[C] [float] NOT NULL,
	[D] [float] NOT NULL,
	[E] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_B5F38ED2_SAFETY_FACTORS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B5F38ED2_SAFETY_FACTORS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_Safety_Factors] PRIMARY KEY CLUSTERED 
(
	[SafetyFactorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SITES]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SITES](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_529B8E6A_SITES_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_529B8E6A_SITES_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_SITES] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_204_DM_HTHA]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_204_DM_HTHA](
	[Susceptibility] [varchar](50) NULL,
	[No Inspection] [int] NULL,
	[1D] [int] NULL,
	[1C] [int] NULL,
	[1B] [int] NULL,
	[2D] [int] NULL,
	[2C] [int] NULL,
	[2B] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_213_DM_IMPACT_EXEMPTION]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_213_DM_IMPACT_EXEMPTION](
	[ComponentThickness] [float] NULL,
	[CurveA] [float] NULL,
	[CurveB] [float] NULL,
	[CurveC] [float] NULL,
	[CurveD] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_214_DM_NOT_PWHT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_214_DM_NOT_PWHT](
	[Tmin-Tref] [float] NULL,
	[6.4] [float] NULL,
	[12.7] [float] NULL,
	[25.4] [float] NULL,
	[38.1] [float] NULL,
	[50.8] [float] NULL,
	[63.5] [float] NULL,
	[76.2] [float] NULL,
	[88.9] [float] NULL,
	[101.6] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_215_DM_PWHT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_215_DM_PWHT](
	[Tmin-Tref] [float] NULL,
	[6.4] [float] NULL,
	[12.7] [float] NULL,
	[25.4] [float] NULL,
	[38.1] [float] NULL,
	[50.8] [float] NULL,
	[63.5] [float] NULL,
	[76.2] [float] NULL,
	[88.9] [float] NULL,
	[101.6] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_3B21_SI_CONVERSION]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_3B21_SI_CONVERSION](
	[conversionFactory] [int] NULL,
	[SIUnits] [float] NULL,
	[USUnits] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_511_512_CA_GAS_TOXIC]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_511_512_CA_GAS_TOXIC](
	[Toxic] [varchar](50) NULL,
	[ContinuousReleasesDuration] [varchar](50) NULL,
	[a] [float] NULL,
	[b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_511_DFB_THIN]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_511_DFB_THIN](
	[art] [float] NULL,
	[E] [int] NULL,
	[insp] [int] NULL,
	[D] [int] NULL,
	[C] [int] NULL,
	[B] [int] NULL,
	[A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM](
	[art] [float] NULL,
	[E] [int] NULL,
	[insp] [int] NULL,
	[D] [int] NULL,
	[C] [int] NULL,
	[B] [int] NULL,
	[A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_513_CA_TOXIC]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_513_CA_TOXIC](
	[Toxic] [varchar](50) NULL,
	[ReleaseType] [varchar](50) NULL,
	[ContinuousReleasesDuration] [varchar](50) NULL,
	[a] [float] NULL,
	[b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1](
	[Fluid] [varchar](50) NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[NBP] [float] NULL,
	[Ambient] [varchar](50) NULL,
	[ideal] [int] NULL,
	[A] [float] NULL,
	[B] [float] NULL,
	[C] [float] NULL,
	[D] [float] NULL,
	[E] [float] NULL,
	[Auto] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_58_CA_COMPONENT_DM]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_58_CA_COMPONENT_DM](
	[Fluid] [varchar](50) NULL,
	[CAINL_gas_a] [float] NULL,
	[CAINL_gas_b] [float] NULL,
	[CAINL_liquid_a] [float] NULL,
	[CAINL_liquid_b] [float] NULL,
	[CAIL_gas_a] [float] NULL,
	[CAIL_gas_b] [float] NULL,
	[CAIL_liquid_a] [float] NULL,
	[CAIL_liquid_b] [float] NULL,
	[IAINL_gas_a] [float] NULL,
	[IAINL_gas_b] [float] NULL,
	[IAINL_liquid_a] [float] NULL,
	[IAINL_liquid_b] [float] NULL,
	[IAIL_gas_a] [float] NULL,
	[IAIL_gas_b] [float] NULL,
	[IAIL_liquid_a] [float] NULL,
	[IAIL_liquid_b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON](
	[Fluid] [varchar](50) NULL,
	[CAINL_gas_a] [float] NULL,
	[CAINL_gas_b] [float] NULL,
	[CAINL_liquid_a] [float] NULL,
	[CAINL_liquid_b] [float] NULL,
	[CALL_gas_a] [float] NULL,
	[CALL_gas_b] [float] NULL,
	[CALL_liquid_a] [float] NULL,
	[CALL_liquid_b] [float] NULL,
	[IAINL_gas_a] [float] NULL,
	[IAINL_gas_b] [float] NULL,
	[IAINL_liquid_a] [float] NULL,
	[IAINL_liquid_b] [float] NULL,
	[IAIL_gas_a] [float] NULL,
	[IAIL_gas_b] [float] NULL,
	[IAIL_liquid_a] [float] NULL,
	[IAIL_liquid_b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_64_DM_LINNING_INORGANIC]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_64_DM_LINNING_INORGANIC](
	[YearsSinceLastInspection] [int] NULL,
	[Strip lined alloy] [float] NULL,
	[Castable refractory] [float] NULL,
	[Castable refractory severe condition] [float] NULL,
	[Glass lined] [float] NULL,
	[Acid Brick] [float] NULL,
	[Fibreglass] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_65_DM_LINNING_ORGANIC]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_65_DM_LINNING_ORGANIC](
	[YearInService] [int] NULL,
	[MoreThan6Years] [float] NULL,
	[WithinLast6Years] [float] NULL,
	[WithinLast3Years] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_71_PROPERTIES_STORAGE_TANK]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_71_PROPERTIES_STORAGE_TANK](
	[Fluid] [varchar](50) NULL,
	[Level 1 Consequence Analysis Representative Fluid] [varchar](50) NULL,
	[Molecular Weight] [float] NULL,
	[Liquid Density] [float] NULL,
	[Liquid Density Viscosity] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC](
	[Soil Type] [varchar](50) NULL,
	[Hydraulic Conductivity for Water Lower Bound (in s)] [float] NULL,
	[Hydraulic Conductivity for Water Upper Bound (in s)] [float] NULL,
	[Soil Porosity] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_74_SCC_DM_PWHT]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_74_SCC_DM_PWHT](
	[SVI] [int] NULL,
	[E] [int] NULL,
	[1D] [int] NULL,
	[1C] [int] NULL,
	[1B] [int] NULL,
	[1A] [int] NULL,
	[2D] [int] NULL,
	[2C] [int] NULL,
	[2B] [int] NULL,
	[2A] [int] NULL,
	[3D] [int] NULL,
	[3C] [int] NULL,
	[3B] [int] NULL,
	[3A] [int] NULL,
	[4D] [int] NULL,
	[4C] [int] NULL,
	[4B] [int] NULL,
	[4A] [int] NULL,
	[5D] [int] NULL,
	[5C] [int] NULL,
	[5B] [int] NULL,
	[5A] [int] NULL,
	[6D] [int] NULL,
	[6C] [int] NULL,
	[6B] [int] NULL,
	[6A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY](
	[Location] [int] NULL,
	[Description] [varchar](50) NULL,
	[Low] [float] NULL,
	[Medium] [float] NULL,
	[High] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THICKNESS_READING]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THICKNESS_READING](
	[ThicknessID] [int] IDENTITY(1,1) NOT NULL,
	[PointID] [int] NOT NULL,
	[ThicknessDate] [datetime] NULL,
	[Orientation] [nvarchar](50) NULL,
	[MaxReading] [float] NULL,
	[ThicknessReading] [float] NULL,
	[CorrosionRate] [float] NULL,
	[ValidReading] [bit] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_THICKNESS_READING] PRIMARY KEY CLUSTERED 
(
	[ThicknessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UNIT_DESCRIPTOR]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIT_DESCRIPTOR](
	[UnitDescriptorID] [int] NOT NULL,
	[UnitCode] [nvarchar](20) NOT NULL,
	[UnitDescriptor] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_C8FBE8AD_UNIT_DESCRIPTOR_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_C8FBE8AD_UNIT_DESCRIPTOR_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_UNIT_DESCRIPTOR] PRIMARY KEY CLUSTERED 
(
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UNITS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNITS](
	[UnitID] [int] NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[SelectedUnit] [nvarchar](20) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_82E97375_UNITS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_82E97375_UNITS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_UNITS] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_PERMISSION_LIST]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_PERMISSION_LIST](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Permission] [nvarchar](50) NOT NULL,
	[Container] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[ObjectType] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[SortOrder] [decimal](5, 3) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_PERMISSIONS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_PERMISSIONS](
	[UserPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Permission] [nvarchar](50) NULL,
	[Allowed] [bit] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_USER_PERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[UserPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 12/13/2018 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UserID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[UserGroupName] [nvarchar](50) NULL,
	[ADAuthentication] [bit] NOT NULL CONSTRAINT [DF_USERS_ADAuthentication]  DEFAULT ((0)),
	[SysUser] [bit] NOT NULL CONSTRAINT [DF_USERS_SysUser]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_USERS_IsActive]  DEFAULT ((0)),
	[LicenseKey] [nvarchar](100) NULL,
	[Password] [nvarchar](500) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_7423B8AA_USERS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_7423B8AA_USERS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'COLBTM', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'8f367ee5-106c-40da-b58c-14be87d1a478')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'COLMID', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'd251b150-502c-4e70-a6a7-1b9e70cc8044')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'COLTOP', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'0d413ac7-5da4-4261-af62-0d2b069eca80')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'COMPC', 8E-06, 2E-05, 2E-06, 0, 3E-05, 10000, 20000, 100000, 300000, 2, 3, 7, 14, CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'1446c960-d935-426d-991c-19ebaca81f02')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'COMPR', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 10000, 50000, 100000, 2, 3, 7, 14, CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'3b2c942d-3c72-40b5-80fb-58002c873461')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'COURSE-1', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'69fea803-3680-4f20-8248-4f02b44ba732')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'COURSE-10', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'008a5863-fd12-4a17-b3ff-d3de996a911a')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'COURSE-2', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'7f54bead-6d86-4799-bb82-6c4b283c23b7')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'COURSE-3', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'ad3cf4fd-bf8f-409d-a782-61b3f0d2c19d')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'COURSE-4', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'4c5fb420-b657-4cd1-89a8-b8c82d0cba55')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'COURSE-5', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'bd46567c-b0b9-4c34-a73f-29cc42365092')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'COURSE-6', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'a433736b-115a-4e49-a855-70b2c83174f9')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'COURSE-7', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'84e5dda8-4ce4-4a84-8b8e-5e45a14a8ec1')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'COURSE-8', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'0e6864bb-d001-4056-b867-9417f4d0002b')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'COURSE-9', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'8127af16-2ad1-4ad6-b4f1-4ba92598bbd7')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'DRUM', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'b47a6ecf-075a-4c47-b128-f8eea31afb36')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'FILTER', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 4000, 10000, 0, 1, 1, 1, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'fa3eca33-a01a-4ed5-bae0-1e3aca4b65f3')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'FINFAN', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.270' AS DateTime), NULL, NULL, NULL, N'05c0f09d-c404-4349-9fd9-5c0646dee025')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'HEXSS', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'4f3d0334-c20e-4df6-a03f-dbb4ab1dbfda')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'HEXTS', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'ecee073e-9930-41be-a628-d689e878bced')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'HEXTUBE', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'dcf64e75-3d8a-457e-93b5-6d0ccb899808')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'KODRUM', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'15aa5480-ab20-4c34-9979-0fc2a8e37299')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'PIPE-1', 2.8E-05, 0, 0, 2.6E-06, 3.06E-05, 5, 0, 0, 20, 0, 0, 0, 1, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'b000e3b9-f54f-416c-b681-c067e1e94c1f')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'PIPE-10', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 40, 80, 240, 0, 2, 3, 4, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'22e7d2f8-5640-40b8-bca2-254e4b1eeca2')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'PIPE-12', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 60, 120, 360, 0, 3, 4, 4, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'4769c418-e2ba-417d-83f2-e0f46f415d76')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'PIPE-16', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 80, 160, 500, 0, 3, 4, 5, CAST(N'2016-04-29 22:30:34.273' AS DateTime), NULL, NULL, NULL, N'b1070193-69e2-46f2-8614-7a5cd3a1c1eb')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'PIPE-2', 2.8E-05, 0, 0, 2.6E-06, 3.06E-05, 5, 0, 0, 40, 0, 0, 0, 1, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'764d39c2-19fa-4d42-8dbf-a2ca40b8070c')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'PIPE-4', 8E-06, 2E-05, 0, 2.6E-06, 3.06E-05, 5, 10, 0, 60, 0, 1, 0, 2, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'e2642865-36ba-4395-a384-790a34ba5a9c')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'PIPE-6', 8E-06, 2E-05, 0, 2.6E-06, 3.06E-05, 5, 20, 0, 120, 0, 1, 2, 3, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'739d87a6-9995-412b-8667-77879c26cb35')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'PIPE-8', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 30, 60, 180, 0, 2, 3, 3, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'e4611bad-ac18-4cf5-b892-e45a1e49407a')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'PIPEGT16', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10, 120, 240, 700, 1, 4, 5, 7, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'd46a1761-ca24-4f29-86d4-d950ac2d7c01')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'PUMP1S', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 5000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'e4149206-2842-4026-aef2-d2202fa71cfd')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'PUMP2S', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 5000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'8dc435a2-149e-472e-b091-e1f57a5aae30')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'PUMPR', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 10000, 0, 0, 0, 0, CAST(N'2016-04-29 22:30:34.277' AS DateTime), NULL, NULL, NULL, N'fa80e2eb-b64e-4ded-b244-7c5414a1155d')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'REACTOR', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 24000, 40000, 80000, 4, 6, 6, 14, CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'6e2612b4-a314-4f2c-b82d-3ec6777a2996')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'TANKBOTTOM', 0.00072, 0, 0, 2E-06, 0.000722, 5000, 0, 0, 120000, 5, 0, 0, 50, CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'610f536e-71e6-4c4f-a99f-08b7d44ab7e2')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'OTHER', 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'38c8f18c-3060-4863-9412-e3cc6dc71279')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'TANKROOFFIXED', 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'3440dd22-3e30-4cc1-8761-955c02be5119')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'TANKROOFFLOAT', 0.00072, 0, 0, 2E-06, 0.000722, 5000, 0, 0, 120000, 5, 0, 0, 50, CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'e1ad35f7-6068-4c00-a7eb-68edc9362ef4')
SET IDENTITY_INSERT [dbo].[COMPONENT_MASTER] ON 

INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (209, N'Mèo.Mèo', 216, 6, N'eee', N'No Desc', 0, 0, 3, CAST(N'2018-04-17 11:21:13.220' AS DateTime), N'hoang', CAST(N'2018-05-15 16:16:16.083' AS DateTime), N'maipham', N'442b579f-5de7-4f16-937c-35b452736c3b')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (210, N'1111', 217, 3, N'Component Hoang', N'No Desc', 0, 0, 3, CAST(N'2018-04-17 11:21:13.263' AS DateTime), N'hoang', NULL, NULL, N'c06de2e5-ac0c-4a94-8a2a-fce8a44d0752')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (211, N'666666', 218, 12, N'jjjjjjjjj', N'', 0, 0, 36, CAST(N'2018-04-26 16:58:10.097' AS DateTime), N'maipham', NULL, NULL, N'7684554c-7511-4d0a-bb63-6f8f2c5eb18c')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (212, N'111', 219, 10, N'xay ngô', N'', 0, 0, 3, CAST(N'2018-06-13 15:45:40.127' AS DateTime), N'maipham', NULL, NULL, N'72b6aa21-8572-4dd2-8599-ee81c4d0e00c')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (213, N'115', 220, 8, N'', N'', 0, 0, 8, CAST(N'2018-06-13 16:21:30.390' AS DateTime), N'maipham', NULL, NULL, N'5ef8972c-9e96-4318-ba87-ef8c7b6faf88')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (214, N'demo', 221, 1, N'Line', N'', 0, 1, 3, CAST(N'2018-12-03 14:35:36.477' AS DateTime), N'maipham', NULL, NULL, N'bd7b2b2c-5ba6-4cc5-8720-47445e2c27bb')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (215, N'48212', 222, 12, N'', N'', 0, 1, 7, CAST(N'2018-12-07 09:02:21.620' AS DateTime), N'maipham', CAST(N'2018-12-07 09:03:35.140' AS DateTime), N'maipham', N'1af87eb1-48a1-4b89-a6cf-b8aa133893d5')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (216, N'4444', 223, 4, N'Visual suryo', N'C#', 0, 1, 4, CAST(N'2018-12-07 10:04:59.620' AS DateTime), N'maipham', NULL, NULL, N'6f74d12c-6429-4bcb-8aa9-f858e5a6d220')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (217, N'6666', 224, 3, N'Component Hoang', N'No Desc', 0, 0, 3, CAST(N'2018-12-07 10:04:59.630' AS DateTime), N'maipham', NULL, NULL, N'f88360b0-87a9-4d14-bef0-020a65e5757b')
SET IDENTITY_INSERT [dbo].[COMPONENT_MASTER] OFF
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Cylindrical Section', N'CylindricalSection', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'431a3cd2-1ed4-41fc-bdb3-03eb5687a810')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Elliptical Head', N'EllipticalHead', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'c270826c-cd8b-4160-8b91-0c19a5f73ed8')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Torispherical Head', N'TorisphericalHead', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'8d74f262-55b5-496a-b1c9-55162b6a3cc8')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Bend / Elbow', N'Elbow', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'cd9396b9-cee9-4ac7-88e8-4e1b34244be0')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Cylindrical Shell', N'CylindricalShell', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'2fa79eb7-3954-4adf-a92f-6f28deaae5f3')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Shell', N'Shell', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'394826f0-3f91-4d5d-8b33-dfb0afc9089f')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Spherical Shell', N'SphericalShell', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'e9985678-27e2-475f-ab94-8c638cdcf5c2')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Hemispherical Head', N'HemisphericalHead', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'26fdb3ab-e59d-44d0-8e1b-781aa5835905')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Reducer', N'Reducer', CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'e63c291d-2775-4d1f-9a31-de93b31ec1bc')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Tank Bottom', N'TankBottom', CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'a99c003b-5dd0-470e-98aa-7e3c0db27dfc')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'Nozzle', N'Nozzle', CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'fb58d4ea-f7f5-4767-b32d-01f9b1359d9d')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Fixed Roof', N'TANKROOFFIXED', CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'db6c4eb6-dc6f-4d64-8627-98785d1305f6')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Floating Roof', N'TANKROOFFLOAT', CAST(N'2016-04-29 22:30:34.267' AS DateTime), NULL, NULL, NULL, N'e88452b3-cbc6-4466-ba1d-5ebb5dd18bf7')
SET IDENTITY_INSERT [dbo].[DESIGN_CODE] ON 

INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'M010', NULL, CAST(N'2017-09-20 14:14:45.060' AS DateTime), N'TUNG\Tung', NULL, NULL, N'8277d093-947c-404a-ab72-479afeb7f290')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'M0101', N'', CAST(N'2017-11-02 15:17:12.990' AS DateTime), NULL, NULL, NULL, N'b6fe1506-1abe-435f-a201-afb26fe2f4b4')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Design Code', N'', CAST(N'2017-11-02 17:25:26.243' AS DateTime), NULL, NULL, NULL, N'c9272382-96ec-464a-a4fb-e6cae0219c44')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'ddd', N'', CAST(N'2017-11-02 17:26:23.963' AS DateTime), NULL, NULL, NULL, N'226ce773-412e-45a8-9cfc-88c58c60140f')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'rer', N'', CAST(N'2017-11-02 17:26:31.923' AS DateTime), NULL, NULL, NULL, N'51e418d6-bbeb-45fc-b5a6-cc529f1adead')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Div II America', N'', CAST(N'2017-11-06 23:37:16.467' AS DateTime), NULL, NULL, NULL, N'ede1a85e-0572-40e8-ad87-262f25295f0c')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Div II', N'', CAST(N'2017-11-23 10:07:43.787' AS DateTime), NULL, CAST(N'2018-12-07 10:04:57.350' AS DateTime), NULL, N'585e721d-97cf-435b-a9fb-b4824bd5f806')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Lab 411 Code', N'', CAST(N'2017-11-23 15:53:32.290' AS DateTime), NULL, CAST(N'2018-12-07 10:04:57.357' AS DateTime), NULL, N'43ac0c1f-344c-4c2f-8bd5-d06c6e1483ca')
SET IDENTITY_INSERT [dbo].[DESIGN_CODE] OFF
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'1. Mechanical and Metallurgical Mechanisms', CAST(N'2016-04-29 22:30:34.260' AS DateTime), NULL, NULL, NULL, N'63f5c333-f986-452f-a28f-2d1137b7053b')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'2. Uniform or Localized Metal Loss', CAST(N'2016-04-29 22:30:34.260' AS DateTime), NULL, NULL, NULL, N'e2816271-6375-4ae8-b809-07b5c1cf5b9d')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'3. High Temperature Corrosion', CAST(N'2016-04-29 22:30:34.260' AS DateTime), NULL, NULL, NULL, N'de3b4a48-79d3-41a8-b2b2-e17ce67e2da5')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'4. Environmental-Assisted Mechanisms', CAST(N'2016-04-29 22:30:34.260' AS DateTime), NULL, NULL, NULL, N'fa46dbfb-99cb-442f-8913-53f270877f49')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'5. Others', CAST(N'2016-04-29 22:30:34.263' AS DateTime), NULL, NULL, NULL, N'2d61392a-ef78-4d7a-8101-e3d47a484982')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'885F Embrittlement', 1, 1, N'dm885F', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'20a0bf36-d3b1-408b-b7c6-e26b729f8073')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Brittle Fracture', 2, 1, N'dmBrittleFracture', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'1234551b-b3b2-4283-82d1-206180ebb3d9')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Cavitation', 3, 1, N'dmCavitation', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'98040c01-5ef3-4a97-8d44-b91e92117310')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Creep Rupture', 4, 1, N'dmCreepRupture', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'e4aa43ba-1729-4f3c-abb7-e369ae9f9f0b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Dissimilar Metal Weld Cracking', 5, 1, N'dmDissimilarMetalWeldCracking', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'5bc22f24-343e-4ec2-8622-619078b05957')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Erosion/Erosion-Corrosion', 6, 1, N'dmErosionCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'5824df8c-5399-4e36-8067-c2e3a0444865')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Graphitisation', 7, 1, N'dmGraphitisation', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'16af8d6b-4af8-4432-9987-d38aa4cfed77')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Internal Thinning', 1, 2, N'dmInternalThinning', 1, N'Mixed', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'd41efe71-30af-42ce-89cf-f6aae3ee0bc8')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Internal Lining Degradation', 2, 2, N'dmInternalLiningDegradation', 1, N'Mixed', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'fccebcfe-2d44-4a74-a4ed-362a6c0ca4de')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Vibration-Induced Mechanical Fatigue', 10, 1, N'dmPipingMechanicalFatigue', 1, N'Mixed', CAST(N'2016-04-29 22:30:34.323' AS DateTime), NULL, NULL, NULL, N'096a58e4-02cb-4da5-b1e7-2e99985d7ab3')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Refractory Degradation', 11, 1, N'dmRefractoryDegradation', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'd080fe1c-2a18-4d1e-9180-b62760bf6fce')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Reheat Cracking', 12, 1, N'dmReheatCracking', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'9bb17526-2f61-4e67-b554-134564261788')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'Short Term Overheating', 13, 1, N'dmShortTermOverheating', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'69394ed9-e6f3-4707-bdc8-e63b5ca6df2c')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Sigma Phase Embrittlement', 14, 1, N'dmSigmaPhaseEmbrittlement', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'6d72c0cb-761a-4929-a0e4-558015aa8b4b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Spheroidisation (Softening)', 15, 1, N'dmSpheroidisation', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'c02ae920-c05f-4614-9276-421f19b5e923')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'Steam Blanketing', 16, 1, N'dmSteamBlanketing', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'18e098f5-6833-469f-888b-78df944a18a3')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'Strain Aging', 17, 1, N'dmStrainAging', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'aa8f710a-4508-4345-9d38-dd423f789a84')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'Temper Embrittlement', 18, 1, N'dmTemperEmbrittlement', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'a1a4aa2c-78f4-423d-9d8f-2a92149d0b57')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'Thermal Fatigue', 19, 1, N'dmThermalFatigue', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'7df6a6d3-e9f0-4b61-85be-1e7270ec2a99')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'Thermal Shock', 20, 1, N'dmThermalShock', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'373d37c9-9071-4f73-853b-e9d8cffc4a77')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Other Mechanical or Metallurgical', 22, 1, N'dmMechanicalMetallurgical', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.327' AS DateTime), NULL, NULL, NULL, N'a1ea524d-d971-4160-8827-ca98630c3002')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'Amine Corrosion', 23, 2, N'dmAmineCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'b12f454b-78b3-4a35-ac22-63b35c18a825')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Ammonium Bisulphide Corrosion', 24, 2, N'dmAmmoniumBisulphideCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'5cdb917b-1a95-4f83-8c4c-71175792db0a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'Ammonium Chloride Corrosion', 25, 2, N'dmAmmoniumChlorideCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'8b1d80c4-0b25-434d-90b6-5149eb0dbfca')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Atmospheric Corrosion', 26, 2, N'dmAtmosphericCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'1e9b62b3-1514-4e37-a26e-75ba84bae0bd')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Boiler Water Condensate Corrosion', 27, 2, N'dmBoilerWaterCondensateCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'2dafdf54-df9c-4291-a4e5-54c345b84519')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'Caustic Corrosion', 28, 2, N'dmCausticCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'e384d432-e644-4e93-a684-ef3f547c153e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'Chloride Stress Corrosion Under Insulation', 29, 2, N'dmChlorideStressCorrosionUnderInsulation', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'f933cf1f-6c69-4092-99ac-0e711f1ed321')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'CO2 Corrosion', 30, 2, N'dmCO2Corrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'53fe3221-c09f-4fb1-abf0-a4669965bbbd')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'Cooling Water Corrosion', 31, 2, N'dmCoolingWaterCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'59a14bc4-2f4f-4f39-93c2-d1b099e6343d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Corrosion Under Insulation', 32, 2, N'dmCorrosionUnderInsulation', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'd478d672-a773-44a8-92a3-3cb85510f284')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Dealloying', 33, 2, N'dmDealloying', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'8041ea08-466d-46da-b443-baffae0d259e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'External Corrosion', 34, 2, N'dmExternalDamageFerriticComponent', 1, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'00214991-de00-403d-b82e-85364cd510d4')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'Flue Gas Dew Point Corrosion', 35, 2, N'dmFlueGasDewPointCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.330' AS DateTime), NULL, NULL, NULL, N'03c0ba29-c9f8-485d-9897-d54207f0898e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'Galvanic Corrosion', 36, 2, N'dmGalvanicCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'bd95010d-ce13-4ad2-8abc-76ba83244d36')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'Graphite Corrosion', 37, 2, N'dmGraphiteCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'0a40687e-a4b1-4e87-88bc-6ed004d1f8e1')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'High Temperature H2/H2S Corrosion', 38, 2, N'dmHighTemperatureH2_H2SCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'beafd7b5-bff0-4133-ba02-d629d3a5a2da')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'Hydrochloric Acid Corrosion', 39, 2, N'dmHydrochloricAcidCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'14b0876d-9351-4dfa-bf98-b97db17fdadd')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'Hydrofluoric Acid Corrosion', 40, 2, N'dmHydrofluoricAcidCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'fe99baa4-bc9f-455b-9327-b01a25cd7e86')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'Microbiologically-Induced Corrosion', 41, 2, N'dmMicrobiologicallyInducedCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'3deaadef-a4b9-47c4-b7b6-8778a52aad7e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'Naphthenic Acid Corrosion', 42, 2, N'dmNaphthenicAcidCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'0a8ffec1-d7be-438b-bae9-4d815d9ff62a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'Phenol (Carbonic Acid) Corrosion', 43, 2, N'dmPhenolCarbonicAcidCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'ef99206e-4d67-4b02-a02b-6f72c8b7df97')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'Soil Corrosion', 44, 2, N'dmSoilCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'77515850-881d-4b60-a0cf-657a851929d1')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'Sour Water Corrosion', 45, 2, N'dmSourWaterCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'6dc41d0f-dc5d-41d4-bdcd-3344df98386a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'Sulphuric Acid Corrosion', 46, 2, N'dmSulphuricAcidCorrosion', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.333' AS DateTime), NULL, NULL, NULL, N'3d58a6fb-f5a0-4414-9ac3-b4dcda5ce730')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'Titanium Hydriding', 47, 2, N'dmTitaniumHydriding', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'0019f5d1-7daf-4ebc-aa6e-f326f97aaa4d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'Other, Metal Loss', 48, 2, N'dmOtherMetalLoss', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'a97d1c11-5260-4f9c-952d-9ae0b2e83353')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'Carburisation', 49, 3, N'dmCarburisation', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'24ca5b67-00c7-430d-93d4-6b0337c320d6')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'Decarburisation', 50, 3, N'dmDecarburisation', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'00f0238c-bb59-44ac-b5ca-77b2fdb63986')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (51, N'Fuel Ash Corrosion', 51, 3, N'dmFuelAshCorrosion', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'bf7ca22e-8379-426a-9ead-8374f629685d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (52, N'Metal Dusting', 52, 3, N'dmMetalDusting', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'b5aeccfd-9055-4785-a4ee-d8ec3018b2ac')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (53, N'Nitriding', 53, 3, N'dmNitriding', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'785a9be2-40d9-464a-83fc-2a752a8b2a25')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (54, N'Oxidation', 54, 3, N'dmOxidation', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'fac5d7d1-3c85-40c4-ae88-d8bcbe041db4')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (55, N'Sulphidation', 55, 3, N'dmSulphidation', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.337' AS DateTime), NULL, NULL, NULL, N'1d83b067-58b2-4f0c-aaf1-a65169729724')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (56, N'Other High Temperature Corrosion', 56, 3, N'dmOtherHighTemperatureCorrosion', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'413b2fed-f781-49ed-9553-c21e58e34da7')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, N'Amine Stress Corrosion Cracking', 57, 4, N'dmAmineStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'f1728f37-3305-400d-87d9-b6e4944306fe')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (58, N'Ammonia Stress Corrosion Cracking', 58, 4, N'dmAmmoniaStressCorrosionCracking', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'a1d37f00-28d0-4e22-b3fb-7059d29fc666')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (59, N'Blistering', 59, 4, N'dmBlistering', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'ad4bc602-e916-49cc-aab6-ce7da235d9e5')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, N'Carbonate Stress Corrosion Cracking', 60, 4, N'dmCarbonateStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'c59c38ef-04c6-4b44-9c6b-1d6f0885732b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, N'Caustic Stress Corrosion Cracking', 61, 4, N'dmCausticStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'54e84a22-6593-4b96-a8f6-9c363de88c85')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, N'Chloride Stress Corrosion Cracking', 62, 4, N'dmChlorideStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'404e92ae-ac72-4bf3-8404-c87d4dc21e5a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, N'Chloride Stress Corrosion Cracking Under Insulation', 63, 4, N'dmChlorideStressCorrosionCrackingUnderInsulation', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'5889fe08-f764-4f43-b4b1-3e1f5c995041')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (64, N'Corrosion Fatigue', 64, 4, N'dmCorrosionFatigue', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'107f07df-da06-4686-ad92-0132a34cc7b4')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (65, N'Deaerator Cracking', 65, 4, N'dmDeaeratorCracking', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'0a244f6b-ba3e-4d28-9988-cc51e56a220d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, N'External Chloride Stress Corrosion Cracking', 66, 4, N'dmExternalChlorideStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'a169f727-2147-4fda-9383-73dbc4cdaf5c')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, N'HF Produced HIC/SOHIC', 67, 4, N'dmHFProducedHIC_SOHIC', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'cf3f47f1-5a02-4283-a4b3-524960e9fa91')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (68, N'High Temperature Hydrogen Attack', 68, 4, N'dmHighTemperatureHydrogenAttack', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'a12468e2-d40b-4e92-b622-d717ebd0f741')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, N'HIC/SOHIC-H2S', 70, 4, N'dmHIC_SOHIC_H2S', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.340' AS DateTime), NULL, NULL, NULL, N'9c1f8a4b-9bbc-4554-bcf4-7ef921a9e614')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, N'Hydrogen Stress Cracking (HF)', 71, 4, N'dmHydrogenStressCrackingHSCHF', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'ac9c4937-0313-4eca-8a6e-38beec74f178')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (71, N'Liquid Metal Embrittlement', 72, 4, N'dmLiquidMetalEmbrittlement', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'175f2d16-9326-47e2-8a76-f5e05c6e1b00')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, N'Polythionic Acid Stress Corrosion Cracking', 73, 4, N'dmPolythionicAcidStressCorrosionCracking', 1, N'Leakage', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'b60ffdda-7fb6-4015-b660-7582ce8b9ae2')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, N'Sulphide Stress Corrosion Cracking (H2S)', 74, 4, N'dmSulphideStressCorrosionCrackingH2S', 1, N'Rupture', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'49103f63-d78d-431d-a0af-12a931132d1e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (74, N'Other Environment-Assisted', 75, 4, N'dmOtherEnvironmentAssisted', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'38c3c575-0442-46c1-88c4-b559ee918659')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (75, N'Aluminium Chloride (General + Localised Corrosion)', 76, 5, N'dmAluminiumChloride', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'15953e64-5e90-447a-a01a-ff8ede08ea95')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (76, N'Ammonia (General + Localised Corrosion)', 77, 5, N'dmAmmonia', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'67647963-5a1d-4673-b376-2fe77d397f7f')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (77, N'Cladding Disbondment', 78, 5, N'dmCladdingDisbondment', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'38b43210-dc86-4794-88e1-c1a539917118')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (78, N'Cyanides (General + Localised Corrosion)', 79, 5, N'dmCyanides', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'47227872-8d4d-4cf6-b15a-925fd2626df5')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (79, N'Formic Acid (General + Localised Corrosion)', 80, 5, N'dmFormicAcid', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'e0ccc090-02f6-49fa-b766-35a5d8188a9b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (80, N'Hydrogen Sulphide (General + Localised Corrosion)', 81, 5, N'dmHydrogenSulphide', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.343' AS DateTime), NULL, NULL, NULL, N'a8fdb1b8-3588-496f-bc97-f0f4e8487bca')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (81, N'Localised Corrosion of Stainless Steel', 82, 5, N'dmLocalisedCorrosionStainlessSteel', 0, N'Leakage', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'cdb80986-e6cd-40d5-946b-9dfa75cbe596')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (82, N'Oxygen (General + Localised Corrosion)', 83, 5, N'dmOxygen', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'b7a9dfb6-79dd-43a5-9d04-e9010b38529f')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (83, N'Polythionic Acid (General + Localised Corrosion)', 84, 5, N'dmPolythionicAcid', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'2d598c6d-03c3-4e8d-acd3-f981e0e78ad6')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (84, N'Under Deposit Attack (Metal Thinning)', 85, 5, N'dmUnderDepositAttackMetalThinning', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'e13ace4b-abfb-4482-a0d3-7449d4ff8993')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (85, N'Water (General + Localised Corrosion)', 86, 5, N'dmWater', 0, N'Mixed', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'a8e9cf6d-b555-49a8-86e5-eb6371871192')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (86, N'Hydrogen Embrittlement', 69, 3, N'dmHydrogenEmbrittlement', 0, N'Rupture', CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'6a68f942-7f45-45cd-a9dc-894c365c2137')
SET IDENTITY_INSERT [dbo].[EQUIPMENT_MASTER] ON 

INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (216, N'nona', 1, N'Pressure Machine', CAST(N'1995-12-12 00:00:00.000' AS DateTime), 8, 238, 205, 7, N'No', N'No', N'No', 1, CAST(N'2018-05-15 17:41:51.000' AS DateTime), N'', CAST(N'2018-04-17 11:21:10.930' AS DateTime), NULL, CAST(N'2018-05-15 17:41:51.323' AS DateTime), NULL, N'f462089f-78c0-44ab-9e25-7a58662d1de9')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (217, N'99', 2, N'Oil Tube', CAST(N'1995-12-12 00:00:00.000' AS DateTime), 8, 246, 212, 6, N'No', N'No', N'No', 1, CAST(N'2018-12-07 10:04:58.000' AS DateTime), N'', CAST(N'2018-04-17 11:21:10.987' AS DateTime), NULL, CAST(N'2018-12-07 10:04:59.020' AS DateTime), NULL, N'd340499e-9c6f-44e3-8385-07c527fda9fc')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (218, N'4444', 11, N'gggg', CAST(N'2000-02-01 00:00:00.000' AS DateTime), 2, 240, 207, 4, N'', N'', N'', 1, CAST(N'2018-04-26 16:57:32.000' AS DateTime), N'', CAST(N'2018-04-26 16:57:32.290' AS DateTime), NULL, NULL, NULL, N'f03a0985-a442-4b08-a978-4fe775ec2bce')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (219, N'Ngao', 7, N'Rose', CAST(N'2018-08-25 00:00:00.000' AS DateTime), 3, 244, 209, 1, N'', N'', N'', 1, CAST(N'2018-06-13 15:43:52.000' AS DateTime), N'', CAST(N'2018-06-13 15:43:52.787' AS DateTime), NULL, NULL, NULL, N'4a5c1124-6d77-4017-8b95-51db6a3bda7e')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (220, N'123', 11, N'', CAST(N'2018-08-25 00:00:00.000' AS DateTime), 2, 244, 209, 6, N'', N'', N'', 1, CAST(N'2018-06-13 16:20:22.000' AS DateTime), N'', CAST(N'2018-06-13 16:20:22.370' AS DateTime), NULL, NULL, NULL, N'264ad78f-f09a-4271-be49-5d26c709a394')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (221, N'1111', 1, N'Ong dau dan', CAST(N'2000-01-02 00:00:00.000' AS DateTime), 6, 238, 210, 1, N'', N'', N'', 1, CAST(N'2018-12-03 14:33:32.000' AS DateTime), N'', CAST(N'2018-12-03 14:33:32.297' AS DateTime), NULL, NULL, NULL, N'bbc76dc9-a17a-45ae-8a9e-a1bcb51ab117')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (222, N'482', 11, N'sangloc', CAST(N'2005-01-07 00:00:00.000' AS DateTime), 2, 245, 211, 6, N'', N'', N'', 1, CAST(N'2018-12-07 09:01:14.000' AS DateTime), N'', CAST(N'2018-12-07 09:01:14.590' AS DateTime), NULL, NULL, NULL, N'050cf5b6-c568-4210-a006-5faf9a96ed7d')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (223, N'23123', 5, N'Storage Tank', CAST(N'1990-10-20 00:00:00.000' AS DateTime), 7, 247, 213, 3, N'No name', N'no name', N'no name', 1, CAST(N'2018-12-07 10:04:57.000' AS DateTime), N'', CAST(N'2018-12-07 10:04:58.357' AS DateTime), NULL, NULL, NULL, N'9b252980-8c90-4413-8649-318ff34872ba')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (224, N'56', 1, N'Oil Tube', CAST(N'1995-12-12 00:00:00.000' AS DateTime), 8, 248, 214, 4, N'No', N'No', N'No', 1, CAST(N'2018-12-07 10:04:57.000' AS DateTime), N'', CAST(N'2018-12-07 10:04:58.400' AS DateTime), NULL, NULL, NULL, N'c4539643-bc79-4007-8398-100bb8d87d63')
SET IDENTITY_INSERT [dbo].[EQUIPMENT_MASTER] OFF
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ACCUM', N'Accumulator', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'708ad146-49bc-4d4f-a414-ce302412ae67')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'AIRCO', N'Air Cooler', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'adfff0d5-22cc-4f57-8907-b3bfcc4eda48')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'COLUM', N'Column', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'7d616eee-9293-4d29-beee-7d0ac23d9cd4')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'VEVES', N'Vertical Vessel', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'dba53d6d-62c7-4326-8710-9baec9fec695')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'SPVES', N'Spherical Vessel', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'7d1a290a-87ee-4cc5-8f58-199994a3ff60')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'FIHEA', N'Fired Heater', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'7c32bcfe-735b-483e-9fda-9dfe8bfc4d9b')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'PIPIN', N'Piping', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'3c3a96dd-dbf6-4196-b572-24e7722db858')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'PUMP', N'Pump', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'bb10e0ba-b41e-41a2-82d8-fd6662734e49')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'PLEXC', N'Plate Exchanger', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'22ca476a-6502-4108-9f5d-1d4aecc9ee76')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'STEXC', N'Shell and Tube Exchanger', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'eb1f59b1-4c71-4d12-afb4-18bbf10068ab')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'TANK', N'Tank', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'9249ed2d-5909-4e45-8bb8-6e25e3df36e5')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'HOVES', N'Horizontal Vessel', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'e16ed0f7-e819-4a32-946c-df28fa47a0ce')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'REVAL', N'Relief Valve', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'cace8f26-ec41-4fbd-a8f3-3e4139e971be')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'TOWER', N'Tower', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'3e46b674-c8eb-4dcf-b409-ad45553282ae')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'FILTE', N'Filter', CAST(N'2016-04-29 22:30:34.287' AS DateTime), NULL, NULL, NULL, N'b87183ee-efaf-4642-a5b9-605ffb1a6ae6')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ObjectField001', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'a5b10f4c-cc94-472b-95ae-c4ea33f9c378')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'ObjectField002', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'512d620f-82b9-4144-839d-521cfb15e52d')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'ObjectField003', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'998400f3-1567-45e8-b811-9a9dce1dcd20')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'ObjectField004', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'31829436-44a1-4e74-85d5-1b50e3226b57')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'ObjectField005', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'a4683934-cfcf-47b0-b43e-114584b27f01')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'ObjectField006', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'5ad507e0-df96-4a44-bb9d-bbcc7bb017c3')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'ObjectField007', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'e0dabe83-ddaa-4f2a-89b6-f92642003878')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'ObjectField008', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'3717f79e-6b4f-46cf-b27e-a4a98a59d661')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'ObjectField009', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'ed084406-1f99-4582-b1e1-92a35b92fe20')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'ObjectField010', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'eca4cdc9-14b4-43b1-9b23-dacb5370ab36')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'ObjectField011', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.363' AS DateTime), NULL, NULL, NULL, N'7b7d2055-3326-46d9-ade5-d37276e4cffd')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'ObjectField012', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'9d2bd3e1-50e2-49d1-bd3f-5d56ad0b9edf')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'ObjectField013', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'b10192de-2bce-4eaa-8920-45461f8c343c')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'ObjectField014', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'0da0d88e-88dd-4629-91bf-7138805baab4')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'ObjectField015', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'9efbacd4-0e1b-4a7f-8cff-2164db65fa39')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'ObjectField016', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'e4616c89-5f76-476c-919c-b1e851b4c7cf')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'ObjectField017', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'6dedd829-0c7f-4db1-a6ed-6bb2dc458d0c')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'ObjectField018', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.367' AS DateTime), NULL, NULL, NULL, N'925f56a5-75f5-44b7-8eaf-bb97f3f288b1')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'ObjectField019', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'b4a92c1c-c20f-4bf5-b5d3-df55a42d813c')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ObjectField020', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'76ae7cbc-dd23-4449-a7f7-abcab6cc0c12')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'ObjectField021', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'576e79e3-de32-4d70-a6ce-67af19a51da8')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'ObjectField022', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'df250b79-1ca6-492d-b346-677f5c7bd25b')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'ObjectField023', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'9dc7371f-81aa-4046-9b20-91c198e55106')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'ObjectField024', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'193fec08-86bf-41b4-8d56-64e483146d82')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ObjectField025', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'0c0a0ffa-e69e-4a45-991e-7a7815389247')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'ObjectField026', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'c4395d8d-549a-4c0b-8e77-3bb982fd37a8')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'ObjectField027', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'6912cfed-7cd0-4429-b156-03239020cec1')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'ObjectField028', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'8200c074-cb87-40b5-9b00-676b3ea0f8f0')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'ObjectField029', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'b5ff6701-e425-450e-9c06-9bfb0cfc1202')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'ObjectField030', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'1e8eea55-8cd9-4020-85c7-0e7783f2dd6c')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'ObjectField031', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.370' AS DateTime), NULL, NULL, NULL, N'2ffc0136-041c-4dbd-b361-f9eee48da1f7')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'ObjectField032', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'76953eaf-3236-4167-b2dd-065dfd4365d9')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'ObjectField033', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'fba8862f-db93-48f4-aeb2-0b71903077ce')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'ObjectField034', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'867f552e-0eb3-4aa6-a621-51a94c6d1bc5')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'ObjectField035', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'6fb312bd-e35d-4a71-881d-49c53c3b521a')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'ObjectField036', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'340ae7ed-eab6-433e-bc7c-bc541e487f9c')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'ObjectField037', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'ff14fb8c-86fe-4412-b1dc-7cfc5c52e817')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'ObjectField038', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'8d1f056d-cf98-48db-a0e4-cec902372369')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'ObjectField039', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'56752407-641f-4e9b-b57a-5025d5ffc83a')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'ObjectField040', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'12c8784e-e91d-4439-8c8b-f267c7515df2')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'ObjectField041', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.373' AS DateTime), NULL, NULL, NULL, N'b45c9dfe-15eb-4887-9b1d-9d6feaa89c58')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'ObjectField042', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'1fac95fa-431e-47fb-b129-76764feee5a4')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'ObjectField043', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'6f4b8af8-5647-412a-ad82-425ed8c514b3')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'ObjectField044', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'b1ed7fa9-6d0e-450e-9af8-3dbd2f1565ab')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'ObjectField045', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'7d93c546-9b90-4967-a26e-9631518e51e7')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'ObjectField046', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'5e343d88-4150-40de-beba-f0dea89b89c6')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'ObjectField047', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'3012e1d2-7c2e-46f1-b13a-b2832706c37b')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'ObjectField048', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'd7005a00-690b-47cc-9661-c158aaf45aaa')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'ObjectField049', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'431b5f23-dadf-4f49-88f1-8cfe43d9a56a')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'ObjectField050', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'7b6fe638-f4e1-4a28-a00a-3e02787e0517')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ObjectField001', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'e1b90f65-80ae-464e-8102-b482b4448b0c')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'ObjectField002', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'd95c71b4-9dbd-43a7-9f40-5b3e218ac061')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'ObjectField003', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.347' AS DateTime), NULL, NULL, NULL, N'3102c71a-d8d2-426c-a431-89f9acd87f37')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'ObjectField004', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'544e8729-a0a8-4245-bd78-8e844a31bbf1')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'ObjectField005', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'725188b5-43f9-44bd-a74b-46795193bdb5')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'ObjectField006', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'e6a9780e-6f42-46e1-984d-4cacc0e3fab8')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'ObjectField007', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'bdc679a1-77fe-45a5-9f14-0fd6220936da')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'ObjectField008', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'c387088a-d990-4844-a53a-d2578207e7d6')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'ObjectField009', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'db9c3363-d4ed-4da0-bdf6-57ba7732f9ed')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'ObjectField010', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'8be78597-15f2-4fab-b01c-5322de1e87b4')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'ObjectField011', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'1f4e1e4e-56b4-4a9b-8cd6-5d82cc2dded3')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'ObjectField012', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'a37e8c34-c680-4a07-833e-2f1ec5a527ef')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'ObjectField013', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'e300d12c-1d83-42c1-bf08-f294d0673d9f')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'ObjectField014', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'0fbbb345-b30b-4497-bd56-0adf65b3b417')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'ObjectField015', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'b5172714-f173-4bcc-8e4e-0d325443d3c6')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'ObjectField016', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'17d0d0fb-dcd6-410a-ab39-7adf0f654c5a')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'ObjectField017', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.350' AS DateTime), NULL, NULL, NULL, N'8027d134-06b5-4159-bd0b-27c7bd812a5d')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'ObjectField018', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'4a9a19a3-2f37-4f83-9d44-736e6822d3f1')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'ObjectField019', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'0cef5fe9-22fb-4d65-9f89-43db2bfa36ee')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ObjectField020', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'8a9175a3-5a65-415d-b1cc-461c015067ef')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'ObjectField021', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'68a9f9eb-8f50-436c-bf77-7d638598eabf')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'ObjectField022', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'9140dfda-0531-4308-8544-531d378ff4aa')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'ObjectField023', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'b009c5c2-1cfd-499a-84dc-320183a0323b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'ObjectField024', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'ba14fe03-c824-465e-a5a2-50782bab1da9')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ObjectField025', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'88f3e279-ceb8-4e29-b52e-7223a4f028a4')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'ObjectField026', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.353' AS DateTime), NULL, NULL, NULL, N'12f541c6-4de8-4d3f-b818-1bc90c0df312')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'ObjectField027', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'b8e120e9-d33c-4220-82d5-2b29e0a0459b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'ObjectField028', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'2d6888e5-bf82-4910-9f1f-edcceb1a9479')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'ObjectField029', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'72fe80a6-8fdd-432a-ba3f-5aef9ad4d440')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'ObjectField030', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'240734d7-b620-46bf-965e-81195e7dc80b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'ObjectField031', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'a664517e-9360-4e8f-8133-8d88fe763b6c')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'ObjectField032', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'5f20d290-eb7a-45ff-a7d3-698edf0c3794')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'ObjectField033', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'2834835d-bc46-4b86-ba27-6df2547ac198')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'ObjectField034', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'f93a2e6f-519c-410a-87e2-858d02e0c19f')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'ObjectField035', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'df363faf-439c-437b-a647-435258ed5924')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'ObjectField036', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'6588a719-b7cb-485b-8cf1-d00bc10d0d4e')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'ObjectField037', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.357' AS DateTime), NULL, NULL, NULL, N'324f656a-c164-4497-b137-66cc28c054c5')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'ObjectField038', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'85369df7-23a9-404c-b7be-f7db26d42c9b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'ObjectField039', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'e9922544-9df8-49ec-bda0-ffad1db49014')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'ObjectField040', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'7e5ec50b-e5da-4f10-a92f-ee0a3726ab6d')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'ObjectField041', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'a03bfb4e-1de6-41cf-81ef-96f0d867319c')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'ObjectField042', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'85a7b07b-1067-4c20-9fc2-895c01ab8b1e')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'ObjectField043', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'0262eb12-8c5a-46c2-b2f2-6f072eba589b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'ObjectField044', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'bcbeba21-775e-40fd-9909-26aac3dc4b27')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'ObjectField045', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'1cf3bc4c-93bc-4917-b0d5-a2c2bb59b3ee')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'ObjectField046', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'c49b99a8-2d09-47b8-b2aa-dfbd2cc07bea')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'ObjectField047', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'e57fb677-0dee-4028-994c-38aab0c147ac')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'ObjectField048', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'48aea2a3-1f8a-41e4-929f-6ad12106fdb5')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'ObjectField049', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'daa95266-541c-44ee-826d-7fa660e4edc6')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'ObjectField050', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2016-04-29 22:30:34.360' AS DateTime), NULL, NULL, NULL, N'54ee7667-3e41-4585-b8e8-7e1b0e454ce4')
SET IDENTITY_INSERT [dbo].[FACILITY] ON 

INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (205, 238, N'HuhaHuha', 2, CAST(N'2018-04-17 11:21:07.757' AS DateTime), NULL, CAST(N'2018-05-15 16:14:55.210' AS DateTime), NULL, N'58801424-485a-426f-bd1c-31c9cc087e21')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (206, 239, N'ENR-LAB', 3, CAST(N'2018-04-17 11:21:07.847' AS DateTime), NULL, CAST(N'2018-04-24 15:31:10.823' AS DateTime), NULL, N'fed0d2fe-95e9-49e7-bdb7-8438ae300648')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (207, 240, N'trtrt', 0.1, CAST(N'2018-04-26 16:56:34.953' AS DateTime), NULL, NULL, NULL, N'976cec3d-01b7-431e-a4de-58855a0dbd5d')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (208, 243, N'fff', 0.1, CAST(N'2018-05-30 11:07:34.483' AS DateTime), NULL, NULL, NULL, N'024635f5-c49e-4523-b24c-c121cabf0133')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (209, 244, N'HN', 0.1, CAST(N'2018-06-13 15:19:10.830' AS DateTime), NULL, CAST(N'2018-06-13 15:20:47.100' AS DateTime), NULL, N'e82e4080-ea26-4dcc-be52-61b5952a24b1')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (210, 238, N'Cortek', 2, CAST(N'2018-12-03 14:29:51.317' AS DateTime), NULL, NULL, NULL, N'151fba52-9f74-48e2-a31c-8053d140302e')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (211, 245, N'Honda', 2, CAST(N'2018-12-07 08:57:17.517' AS DateTime), NULL, CAST(N'2018-12-07 09:01:30.300' AS DateTime), NULL, N'80d1ebab-3b39-4e87-93c4-128895598b91')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (212, 246, N'U23', 21, CAST(N'2018-12-07 10:04:55.230' AS DateTime), NULL, NULL, NULL, N'ccbc80a4-30d0-441d-bf34-4a5f8efe70f4')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (213, 247, N'Lab411', 11, CAST(N'2018-12-07 10:04:56.067' AS DateTime), NULL, NULL, NULL, N'539de48e-851c-4791-af4d-d444bc7b7c2a')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (214, 248, N'Hoang', 21, CAST(N'2018-12-07 10:04:56.073' AS DateTime), NULL, NULL, NULL, N'62c574c7-1a37-4400-aa8f-078701e6d0e4')
SET IDENTITY_INSERT [dbo].[FACILITY] OFF
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (205, 0.2, 0.2, 0.02, 0.04, 0.04, 1000, 1000000, CAST(N'2018-04-17 11:21:07.800' AS DateTime), NULL, CAST(N'2018-05-15 16:14:55.433' AS DateTime), NULL, N'9fe93cb4-bcb1-4622-99a7-644a94130fdb')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (206, 0.4, 0.1, 0.02, 0.004, 0.001, 1200, 2000000, CAST(N'2018-04-17 11:21:07.887' AS DateTime), NULL, CAST(N'2018-04-23 15:34:27.903' AS DateTime), NULL, N'a51b11ad-a69c-4275-9f43-fecd46ee78e3')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (207, 1, 1, 1, 1, 1, 12345, 1200000, CAST(N'2018-04-26 16:56:35.033' AS DateTime), NULL, NULL, NULL, N'4e4e33ca-ae33-49b8-a8da-a86f57050dbd')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (208, 1, 1, 0, 1, 1, 340, 222, CAST(N'2018-05-30 11:07:34.670' AS DateTime), NULL, NULL, NULL, N'4fc5daac-9259-4814-a021-e9f4fc474210')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (210, 0.1, 0.2, 0.2, 0.004, 0.004, 1000, 1000000, CAST(N'2018-12-03 14:29:52.747' AS DateTime), NULL, NULL, NULL, N'e7692370-8aeb-4469-ab20-97d484170d17')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (211, 0.23, 0.4, 0.1, 0.02, 0.01, 1000, 500000, CAST(N'2018-12-07 08:57:17.693' AS DateTime), NULL, CAST(N'2018-12-07 09:01:30.500' AS DateTime), NULL, N'3828424f-45b0-4aad-85bf-e59e041c6aac')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (212, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-07 10:04:56.060' AS DateTime), NULL, NULL, NULL, N'4459cb02-eaa9-4099-a5d1-48182d29c3ad')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (213, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-07 10:04:56.070' AS DateTime), NULL, NULL, NULL, N'a6a4ff8c-3612-4486-9e67-cb24dc63a9d4')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (214, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-07 10:04:56.073' AS DateTime), NULL, NULL, NULL, N'52516a04-0e3e-4281-bc72-587e50c98359')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Visual', N'imVisual', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'843cc806-0e0e-404f-8cb2-c2f0e96cb16b')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Magnetic', N'imMagnetic', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'c7b01692-fab9-4b72-aa70-1a6de705fd0f')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Penetrant', N'imPenetrant', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'f3d7b56a-7505-4244-8d46-d5b4c538d327')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Radiography', N'imRadiography', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'cef94f21-669f-4112-bf27-8a1961d473f2')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Ultrasonic', N'imUltrasonic', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'b4fc69fe-dd25-42b2-affb-fdc9f668cc28')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Eddy Current', N'imEddyCurrent', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'd0729400-a309-4c60-95be-ba0581fe05af')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Thermography', N'imThermography', CAST(N'2016-04-29 22:30:34.280' AS DateTime), NULL, NULL, NULL, N'4b0fd391-900f-4dff-b6f5-8a857fecd06f')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Acoustic Emission', N'imAcoustic', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'f2ddae5c-8bd1-470a-ad60-eedee90ec49d')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Metallurgical', N'imMetallurgical', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'818936cb-e4fe-4237-aaca-45662b5fa5d4')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Monitoring', N'imMonitoring', CAST(N'2016-04-29 22:30:34.283' AS DateTime), NULL, NULL, NULL, N'f48bec34-5850-43fa-b169-8ece862b399f')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Endoscopy', N'itEndoscopy', 1, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'd7e3b145-65fa-4882-b6f0-ab76da9564d4')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Hydrotesting', N'itHydrotesting', 1, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'966cc717-c39f-48ad-91a5-f1df513b91c1')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Naked Eye', N'itNakedEye', 1, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'aff61ae1-ff49-4c19-982d-eff64580bdd9')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Video', N'itVideo', 1, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'c792e686-a994-44cd-aa48-ccaec842bc6c')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Magnetic Fluorescent Inspection', N'itFluorescent', 2, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'761d0650-dd03-4388-8866-9e857b41d43b')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Magnetic Flux Leakage', N'itFluxLeakage', 2, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'ba2b504b-a7a5-4304-9269-08981aa3cea1')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Magnetic Particle Inspection', N'itParticle', 2, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'e7c16c34-555c-4c65-89f1-bcec353085b8')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Liquid Penetrant Inspection', N'itLiquidPenetrant', 3, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'16f672dc-8d69-4cf3-8244-3ab99753e252')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Penetrant Leak Detection', N'itLeakDetectPetn', 3, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'934acba7-b0e2-478b-b354-ffaee32349af')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Compton Scatter', N'itCompton', 4, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'2abbcaeb-142d-4790-b651-34895e46bdc5')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Gamma Radiography', N'itGamma', 4, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'4e90edbf-f21c-46df-97cf-56a10c3de2ee')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Real-time Radiography', N'itRealTimeRadio', 4, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'09fdc4ab-7c8b-4ff6-b1b1-7b6f2996ae69')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'X-Radiography', N'itXRadio', 4, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'ce7116fb-eddc-43e3-a571-620412f90513')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Angled Compression Wave', N'itCompWave', 5, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'd950f7f6-85da-43b3-9911-8a542a1ebbfc')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Angled Shear Wave', N'itShearWave', 5, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'8997f460-a0d0-4afb-97d8-31d68529dd01')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'A-scan Thickness Survey', N'itAScan', 5, CAST(N'2016-04-29 22:30:34.313' AS DateTime), NULL, NULL, NULL, N'724c0c3e-873c-40a3-bdd6-c66cdbaf44cb')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'B-scan', N'itBScan', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'ef62bdea-45c6-43ab-9cdc-762fc2abd63c')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'Chime', N'itChime', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'2ac8c1ba-dfd3-4195-8c61-e031fec21e5a')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'C-scan', N'itCScan', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'f6a04afd-e3dd-4518-9473-6aae6af8a446')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'Digital Ultrasonic Thickness Gauge', N'itDUTG', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'2d8fefa6-5627-4688-8e4a-6896b1f131ae')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'Lorus', N'itLorus', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'b88fa0a8-de63-4621-9e0c-945f67874ff7')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Surface Waves', N'itSurfaceWave', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'2af77f64-8dd9-4eef-90d8-82e3829fbe12')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'Teletest', N'itTeletest', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'b63d941c-5a4e-440a-8fba-78b9478e73f7')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'TOFD', N'itTOFD', 5, CAST(N'2016-04-29 22:30:34.317' AS DateTime), NULL, NULL, NULL, N'6fc2338b-3d42-4de2-b42f-55c113e5fb2e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ACFM', N'itACFM', 6, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'5999f188-3928-4647-a7cc-e0afaa68cb15')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Low frequency', N'itLowFreq', 6, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'62d49cc4-8f1c-49ce-b419-e401d0d6cc90')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Pulsed', N'itPulsed', 6, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'ff9a1cbb-3984-4225-95c9-870717b08346')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'Remote field', N'itRemoteField', 6, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'0a3edc3c-a8f8-455a-a4ff-a845f7c17e79')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'Standard (flat coil)', N'itFlatCoil', 6, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'92972328-e969-4010-8422-3bd2ea9389fa')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'Passive Thermography', N'itPassiveThermo', 7, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'bfcce562-5487-4605-b2e7-d0896bf089da')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'Transient Thermography', N'itTransientThermo', 7, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'5262c491-a040-4cb6-9297-009df6a76b7e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Crack Detection', N'itCrackDetect', 8, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'893afa3f-ff60-49a1-8d01-737e090e9197')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Leak Detection', N'itLeakDetect', 8, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'68ce50c6-6cb3-4052-81a0-bda613db0127')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'Hardness Surveys', N'itHardSurvey', 9, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'0669b105-25b6-43f7-9d8a-1d01e9ec94cf')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'Microstructure Replication', N'itMicroReplicate', 9, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'4d72538c-8f84-4ab0-aa85-f34278f52fb0')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'On-line Monitoring', N'itOnlineMon', 10, CAST(N'2016-04-29 22:30:34.320' AS DateTime), NULL, NULL, NULL, N'1112996d-bdf4-4eb0-9a62-7437bfba6a62')
SET IDENTITY_INSERT [dbo].[MANUFACTURER] ON 

INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'CRBM', CAST(N'2017-09-20 14:15:00.023' AS DateTime), N'TUNG\Tung', NULL, NULL, N'3248ec51-d59c-4469-a80c-490bfcf197ff')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'VuNA', CAST(N'2017-09-25 10:18:13.763' AS DateTime), N'Vu Nguyen Anh', NULL, N'Nguyen Anh VU', N'5ff2634b-77e6-4535-b94a-9693fdb1ae81')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'N/A', CAST(N'2017-11-23 10:07:43.547' AS DateTime), NULL, CAST(N'2018-12-07 10:04:57.037' AS DateTime), NULL, N'f4b23d5d-7498-448e-ad57-93f1415a0860')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Hung Yen', CAST(N'2017-11-23 15:53:31.440' AS DateTime), NULL, CAST(N'2018-12-07 10:04:56.990' AS DateTime), NULL, N'74933744-c4cc-4dfd-9a07-578238bb273c')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Lab411', CAST(N'2018-01-11 11:12:28.593' AS DateTime), NULL, CAST(N'2018-04-12 14:44:50.493' AS DateTime), NULL, N'937deead-d69c-4232-a80c-311d96843bff')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Viet Nam', CAST(N'2018-02-01 10:40:35.523' AS DateTime), NULL, CAST(N'2018-12-07 10:04:57.040' AS DateTime), NULL, N'881348af-2ac9-4a8d-a11b-0b00baf4a969')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Vung Tau', CAST(N'2018-04-17 11:11:25.737' AS DateTime), NULL, CAST(N'2018-04-24 15:31:13.583' AS DateTime), NULL, N'96f911b3-c006-427d-b79c-40e78c1aa6e2')
SET IDENTITY_INSERT [dbo].[MANUFACTURER] OFF
SET IDENTITY_INSERT [dbo].[REPORT_TEMPLATE] ON 

INSERT [dbo].[REPORT_TEMPLATE] ([TemplateID], [TemplateName], [TemplateDescription], [OriginalFile], [ReportIdentifier], [ReportID], [ReportType], [ReportVersion], [Predefined], [TemplateBinary], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Standard Equipment', N'Standard RiskWISE Equipment Report', N'NIL', NULL, N'NIL', N'Equipment', N'NIL', 1, NULL, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'54c8ffec-0919-4f8f-b468-1d6d78e0e336')
INSERT [dbo].[REPORT_TEMPLATE] ([TemplateID], [TemplateName], [TemplateDescription], [OriginalFile], [ReportIdentifier], [ReportID], [ReportType], [ReportVersion], [Predefined], [TemplateBinary], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Standard Component', N'Standard RiskWISE Component Report', N'NIL', NULL, N'NIL', N'Component', N'NIL', 1, NULL, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'62a390b7-8255-479b-b92f-33cca2ad67db')
SET IDENTITY_INSERT [dbo].[REPORT_TEMPLATE] OFF
SET IDENTITY_INSERT [dbo].[RW_ASSESSMENT] ON 

INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (249, 217, 210, CAST(N'2017-11-23 00:00:00.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), CAST(N'2018-04-17 11:21:15.540' AS DateTime), NULL, CAST(N'2018-12-07 10:05:01.920' AS DateTime), NULL, N'a3f9755a-ad97-4513-be4a-d2ffa38cf4b1', N'New Proposal 2', 1)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (250, 218, 211, CAST(N'2018-04-26 16:58:14.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-04-26 16:58:14.000' AS DateTime), N'', CAST(N'2018-04-26 16:58:14.000' AS DateTime), CAST(N'2018-04-26 16:58:14.090' AS DateTime), NULL, NULL, NULL, N'a1c87251-d286-4a16-8d3d-141bcb2a7926', N'New Record Test', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (251, 219, 212, CAST(N'2018-06-13 15:46:15.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-06-13 16:10:15.000' AS DateTime), N'', CAST(N'2018-06-13 16:10:15.000' AS DateTime), CAST(N'2018-06-13 15:46:15.770' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.430' AS DateTime), NULL, N'f2df8898-bfa8-41cc-8c5d-8ca897f8ab29', N'New Proposal 3', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (252, 220, 213, CAST(N'2018-06-13 16:21:58.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-06-13 16:21:58.000' AS DateTime), N'', CAST(N'2018-06-13 16:21:58.000' AS DateTime), CAST(N'2018-06-13 16:21:58.610' AS DateTime), NULL, NULL, NULL, N'f06e6ff4-6f79-49a2-b0b1-97191edc416b', N'New Proposal 4', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (254, 222, 215, CAST(N'2018-12-07 09:03:46.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-07 09:03:46.000' AS DateTime), N'', CAST(N'2018-12-07 09:03:46.000' AS DateTime), CAST(N'2018-12-07 09:03:46.473' AS DateTime), NULL, NULL, NULL, N'17065eef-40fa-443a-b3ed-e1f06a64cbba', N'New Proposal 6', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (255, 223, 216, CAST(N'2012-10-20 00:00:00.000' AS DateTime), 0, 72, 1, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), CAST(N'2018-12-07 10:05:00.920' AS DateTime), NULL, NULL, NULL, N'502bd8cc-2c4d-4e79-afff-da288c7a2410', N'New Proposal 1', 1)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (256, 224, 217, CAST(N'2017-11-23 00:00:00.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), N'', CAST(N'2018-12-07 10:05:00.000' AS DateTime), CAST(N'2018-12-07 10:05:01.027' AS DateTime), NULL, NULL, NULL, N'ee6f9b08-6014-4125-b63d-8088ea321d38', N'New Proposal 1', 1)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (257, 221, 214, CAST(N'2018-12-07 10:13:09.000' AS DateTime), 0, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-11 13:53:15.000' AS DateTime), N'', CAST(N'2018-12-11 13:53:15.000' AS DateTime), CAST(N'2018-12-07 10:13:09.440' AS DateTime), NULL, CAST(N'2018-12-11 13:53:21.867' AS DateTime), NULL, N'7d5c5ec2-65bc-4165-80c2-e76a590d91b7', N'New Proposal 7', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (258, 216, 209, CAST(N'2018-12-12 14:32:10.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-12 14:38:57.000' AS DateTime), N'', CAST(N'2018-12-12 14:38:57.000' AS DateTime), CAST(N'2018-12-12 14:32:11.030' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.383' AS DateTime), NULL, N'cf91e715-39e3-49e1-92c8-b4c927cb2b28', N'New Proposal 8', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (259, 216, 209, CAST(N'2018-12-12 14:45:20.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-13 15:35:48.000' AS DateTime), N'', CAST(N'2018-12-13 15:35:48.000' AS DateTime), CAST(N'2018-12-12 14:45:20.567' AS DateTime), NULL, CAST(N'2018-12-13 15:36:03.823' AS DateTime), NULL, N'a97c27d3-9f06-4c6d-b94f-d363da61d8ab', N'New Proposal 9', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (260, 221, 214, CAST(N'2018-12-12 14:45:31.000' AS DateTime), 0, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2018-12-12 14:55:33.000' AS DateTime), N'', CAST(N'2018-12-12 14:55:33.000' AS DateTime), CAST(N'2018-12-12 14:45:31.277' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.477' AS DateTime), NULL, N'0e423afe-93d1-4e81-a502-30ef80449248', N'New Proposal 10', 0)
SET IDENTITY_INSERT [dbo].[RW_ASSESSMENT] OFF
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (228, N'Gas', 0, 0.2, 0, 65.93094, 140.6509, 0, 0, 5318.56, 15427.84, 722.305, 86.50032, 0, 21555.21, N'B')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (234, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (235, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (236, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (237, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (239, N'Gas', 0, 0.15, 0, 400.0495, 908.4329, 0, 0, 29019.61, 48005.95, 571.2957, 1155.527, 0, 78752.38, N'B')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (245, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (249, N'Gas', 0, 0.15, 0, 515.2632, 904.47, 0, 0, 0, 6183159, 2707328, 2261175, 0, 11151660, N'E')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (251, N'', 0, 0.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000000, N'E')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (257, N'Gas', 0, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000000, N'E')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (258, N'Gas', 0, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000000, N'E')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (259, N'', 0, 0.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000000, N'E')
INSERT [dbo].[RW_CA_LEVEL1] ([ID], [Release_Phase], [fact_di], [fact_mit], [fact_ait], [CA_cmd], [CA_inj_flame], [CA_inj_toxic], [CA_inj_ntnf], [FC_cmd], [FC_affa], [FC_prod], [FC_inj], [FC_envi], [FC_total], [FCOF_Category]) VALUES (260, N'Gas', 0, 0.2, 0, 0, 0, 0, 0, 24183.01, 0, 0, 0, 0, 100000000, N'E')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (242, 0, 0, 0, 24.8872, 99.51739, 6368.956, 61699380, 1, 1, 1, 1, 24.8872, 99.51739, 1048.862, 449.5125, 0.4490634, 45, 2247.562, 0, 0, 0, 0, 0, 85.18398, 0.4041571, 1.892978, 0.00898127, 2.271574, 0.01077752, 5.300338, 0.02514755, 28583.96, 135.6172, 28719.58, 12, 90389.61, 0, 119109.2, N'C')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (243, 4.752E-08, 3.353866E-08, 3.387743E-08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147590900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59833.8, 0, 59833.8, N'B')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (244, 4.752E-08, 3.353866E-08, 3.387743E-08, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147590900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59833.8, 0, 59833.8, N'B')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 0, 1, 0, 0, 1, CAST(N'2017-10-20 00:00:00.000' AS DateTime), N'Medium coating quality', N'Foam Glass', N'Above average', 0, N'Poor', N'Glass lined', 15, 1, CAST(N'2018-04-17 11:21:28.193' AS DateTime), NULL, CAST(N'2018-12-07 10:05:05.360' AS DateTime), NULL, N'54e7ee26-be9e-4fe6-8107-dc2467f0ba11')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, 0, 0, 0, 0, 0, CAST(N'2018-04-26 16:58:14.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, CAST(N'2018-04-26 16:58:14.313' AS DateTime), NULL, NULL, NULL, N'e670b9bf-eba3-4b71-b792-afcd4019da2f')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 0, 0, 0, 0, 0, CAST(N'2018-06-13 15:46:15.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, CAST(N'2018-06-13 15:46:16.260' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.687' AS DateTime), NULL, N'd91d6a3a-763b-4e9e-b8f3-533df7ec2703')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, 0, 0, 0, 0, 0, CAST(N'2018-06-13 16:21:58.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, CAST(N'2018-06-13 16:21:58.630' AS DateTime), NULL, NULL, NULL, N'1fc1abf8-a3ee-4642-bd4a-c00a693bd1d3')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, 0, 0, 0, 0, 0, CAST(N'2018-12-07 09:03:46.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, CAST(N'2018-12-07 09:03:46.980' AS DateTime), NULL, NULL, NULL, N'67b8b63c-4240-4d29-b7b2-9e5e34614895')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, 0, 0, 1, 1, 1, CAST(N'2017-10-20 00:00:00.000' AS DateTime), N'Medium coating quality', N'Calcium Silicate', N'Below average', 1, N'Good', N'Castable refractory', 12, 0, CAST(N'2018-12-07 10:05:05.340' AS DateTime), NULL, NULL, NULL, N'8bc99107-eece-4473-9b28-df2dadcae049')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, 0, 1, 0, 0, 1, CAST(N'2017-10-20 00:00:00.000' AS DateTime), N'Medium coating quality', N'Foam Glass', N'Above average', 0, N'Poor', N'Glass lined', 15, 1, CAST(N'2018-12-07 10:05:05.343' AS DateTime), NULL, NULL, NULL, N'da20ad06-5611-4938-8a77-7e9b12a8148d')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 0, 0, 1, 0, 0, CAST(N'2018-12-07 10:13:09.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0.1, 0, CAST(N'2018-12-07 10:13:09.503' AS DateTime), NULL, CAST(N'2018-12-11 13:53:22.030' AS DateTime), NULL, N'6ff44d05-4a62-40dd-8702-0bc9e08bc9b6')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 0, 0, 1, 0, 0, CAST(N'2018-12-12 14:32:11.000' AS DateTime), N'', N'', N'', 1, N'', N'', 0.003, 0, CAST(N'2018-12-12 14:32:11.277' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.687' AS DateTime), NULL, N'fdba008d-f13d-4f70-b112-f854b8e56e51')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 0, 0, 0, 0, 0, CAST(N'2018-12-12 14:45:20.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, CAST(N'2018-12-12 14:45:20.600' AS DateTime), NULL, CAST(N'2018-12-13 15:36:04.190' AS DateTime), NULL, N'a1cd66ac-6f17-41f0-88fe-ea81ae608c1f')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 0, 0, 1, 0, 0, CAST(N'2018-12-12 14:45:31.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0.29, 0, CAST(N'2018-12-12 14:45:31.287' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.567' AS DateTime), NULL, N'a1cbec40-bb51-4ff3-8740-45b86f1697f9')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 99, 29, 29, 28, 0.5, N'All branches greater than 2" Nominal OD', N'Saddle in fittings', N'Between 200 and 237', 0, 0, N'Above average', N'Engineering Analysis', 0, N'None', 1, 0.5, N'More than 10', N'Broken gussets or gussets welded directly to pipe', N'Greater than one', N'Moderate', 0, N'13 to 52 weeks', 1, 0, 0, 0, N'', CAST(N'2018-04-17 11:21:18.787' AS DateTime), NULL, CAST(N'2018-12-07 10:05:02.970' AS DateTime), NULL, N'0b419a0c-1d79-44b4-acf6-203c7dfbbf3e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', 0, 0, 0, 0, N'', CAST(N'2018-04-26 16:58:14.293' AS DateTime), NULL, NULL, NULL, N'dea7e3ad-9ebf-4b94-b71e-f2be9e95a86e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 33, 0, 3, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', 0, 0, 0, 0, N'', CAST(N'2018-06-13 15:46:16.150' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.580' AS DateTime), NULL, N'517d29fc-873a-47db-b97b-9642e44004e1')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', 0, 0, 0, 0, N'', CAST(N'2018-06-13 16:21:58.627' AS DateTime), NULL, NULL, NULL, N'89bab779-d765-4ce4-958e-76ae3af6ead8')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', 0, 0, 0, 0, N'', CAST(N'2018-12-07 09:03:46.887' AS DateTime), NULL, NULL, NULL, N'82719376-112b-49a6-beba-8027b3ea14b1')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, 99, 19, 19, 17, 0.29, N'All branches greater than 2" Nominal OD', N'Piping tee weldolets', N'Between 200 and 237', 0, 0, N'Average', N'Experience', 0, N'PRV chatter', 1, 0.5, N'6 to 10', N'Good condition', N'None', N'Minor', 0, N'2 to 13 weeks', 1, 0, 0, 0, N'', CAST(N'2018-12-07 10:05:02.927' AS DateTime), NULL, NULL, NULL, N'b1e56fe3-546d-4e1b-865e-1a30897ef46f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, 99, 29, 29, 28, 0.5, N'All branches greater than 2" Nominal OD', N'Saddle in fittings', N'Between 200 and 237', 0, 0, N'Above average', N'Engineering Analysis', 0, N'None', 1, 0.5, N'More than 10', N'Broken gussets or gussets welded directly to pipe', N'Greater than one', N'Moderate', 0, N'13 to 52 weeks', 1, 0, 0, 0, N'', CAST(N'2018-12-07 10:05:02.940' AS DateTime), NULL, NULL, NULL, N'3e096022-34a6-4169-b7b7-17174c9edffd')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 99, 19.5, 18, 17.68, 0.25, N'Any branch less than or equal to 2" Nominal OD', N'Saddle in fittings', N'Between 200 and 237', 0, 0, N'Average', N'Experience', 0, N'None', 0, 0.2, N'6 to 10', N'Broken gussets or gussets welded directly to pipe', N'', N'Moderate', 0, N'Less than 2 weeks', 0, 0, 0, 0, N'', CAST(N'2018-12-07 10:13:09.500' AS DateTime), NULL, CAST(N'2018-12-11 13:53:21.910' AS DateTime), NULL, N'c5c2253d-ab57-45d6-a81f-fab59789387f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 99, 13.6, 16, 14, 0, N'All branches greater than 2" Nominal OD', N'Saddle in fittings', N'Between 200 and 237', 0, 0, N'Average', N'Experience', 0, N'None', 0, 5, N'6 to 10', N'Missing or damage supports, improper support', N'Greater than one', N'Moderate', 0, N'Less than 2 weeks', 0, 0, 0, 0, N'', CAST(N'2018-12-12 14:32:11.270' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.573' AS DateTime), NULL, N'7200cf0b-5c8b-4ff3-bd98-7e1b518d58b1')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 99, 19.05, 19.05, 17.68, 0.29, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0.5, N'', N'', N'', N'', 0, N'', 0, 0, 0, 0, N'', CAST(N'2018-12-12 14:45:20.597' AS DateTime), NULL, CAST(N'2018-12-13 15:36:04.010' AS DateTime), NULL, N'5208cec8-d80e-41bc-84f0-2ac0ee7bee2c')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [TrampElements], [ShellHeight], [ReleasePreventionBarrier], [ConcreteFoundation], [SeverityOfVibration], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 99, 19.05, 19.05, 16.68, 0.29, N'Any branch less than or equal to 2" Nominal OD', N'None', N'Below 200', 0, 0, N'Above average', N'None', 0, N'Valve with high pressure drop', 0, 0.5, N'More than 10', N'Broken gussets or gussets welded directly to pipe', N'Greater than one', N'Moderate', 0, N'13 to 52 weeks', 0, 0, 0, 0, N'', CAST(N'2018-12-12 14:45:31.287' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.533' AS DateTime), NULL, N'bf26ca9e-8156-4b69-86f5-94baf72e13fe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 1, 1, N'', 0, 0, 0, 0, 0, 1381, 1381, 1381, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.810' AS DateTime), NULL, NULL, NULL, N'809e4cdc-71f7-4521-be94-264f09583a4b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.753' AS DateTime), NULL, NULL, NULL, N'51040ac5-5bfa-4b47-b903-1f3eeca37ef5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 8, 1, N'', 0, 0, 0, 0, 0, 472.5, 472.5, 540, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.190' AS DateTime), NULL, NULL, NULL, N'7fb4c2d5-886f-4b82-a407-972ee31032dc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 9, 1, N'', 0, 0, 0, 0, 0, 63, 119, 119, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.240' AS DateTime), NULL, NULL, NULL, N'38f1d20a-8785-4412-8e52-a6fe6df0ff54')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.867' AS DateTime), NULL, NULL, NULL, N'2fcf7135-afff-45cf-892b-614fa152f5c1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.837' AS DateTime), NULL, NULL, NULL, N'01c4a6cb-ecbf-4260-90f1-2c03e0c29bb4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.783' AS DateTime), NULL, NULL, NULL, N'0077396d-2b71-4393-a3d7-2daa51048d67')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 32, 1, N'', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.640' AS DateTime), NULL, NULL, NULL, N'cae18220-773e-4f1a-bea1-2057b64e0a5b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 34, 1, N'', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.613' AS DateTime), NULL, NULL, NULL, N'691c5dc1-7777-4f18-bef9-a9b67256f6dd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.357' AS DateTime), NULL, NULL, NULL, N'8ba97754-f924-4e2b-a700-757ecdb213cb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.473' AS DateTime), NULL, NULL, NULL, N'c11a603e-1d3b-41d2-b685-7da00f1d875d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.310' AS DateTime), NULL, NULL, NULL, N'2bdcb36b-943e-4f2c-b150-6855fb90d42c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.530' AS DateTime), NULL, NULL, NULL, N'c2181843-ecd1-4d1a-bab6-f403d34b812e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.697' AS DateTime), NULL, NULL, NULL, N'6d3435b8-4f5a-4265-898e-ec50f21fb97b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.670' AS DateTime), NULL, NULL, NULL, N'3ea3ef09-e9ca-47d4-afa8-4a4707a08f9f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.587' AS DateTime), NULL, NULL, NULL, N'5b41d7c4-7bfa-4839-8523-5c94eb090057')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.727' AS DateTime), NULL, NULL, NULL, N'6d59e747-e604-4b77-85a2-37d2b81f394a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.443' AS DateTime), NULL, NULL, NULL, N'201a34c7-db9d-4183-9e50-33a9a8077f4f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.560' AS DateTime), NULL, NULL, NULL, N'19fa7e96-fff2-48a1-991c-c11b36af7b8e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.503' AS DateTime), NULL, NULL, NULL, N'2e689cd8-4c9d-4646-b52f-f03b99cfc22e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2033-04-24 14:57:33.000' AS DateTime), CAST(N'2018-04-24 14:57:33.420' AS DateTime), NULL, NULL, NULL, N'9fba008e-8502-4b48-abb8-e63e756f2bf4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.360' AS DateTime), NULL, NULL, NULL, N'4c2cbf63-8e07-4375-94fa-370d1fcd344e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.360' AS DateTime), NULL, NULL, NULL, N'50ffc1dc-e273-4f97-9b35-701fc390421d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 8, 1, N'', 0, 0, 0, 0, 0, 5700, 5700, 5700, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:17.000' AS DateTime), CAST(N'2018-06-13 16:10:18.097' AS DateTime), NULL, NULL, NULL, N'eea047af-f008-427e-9669-ea03afa73135')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.157' AS DateTime), NULL, NULL, NULL, N'aa2a669a-6ea4-4062-8ed4-960f938ed170')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 10, 1, N'', 0, 0, 0, 0, 0, 4, 4, 4, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.363' AS DateTime), NULL, NULL, NULL, N'14c149c0-f43e-45b6-9f2c-2ab8d920bfc4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.360' AS DateTime), NULL, NULL, NULL, N'678d7ff6-d729-46f0-9069-4acd5ecf849f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.360' AS DateTime), NULL, NULL, NULL, N'04847c73-69cf-490f-a419-2b11d1930980')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 32, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.350' AS DateTime), NULL, NULL, NULL, N'c130f35d-5a97-4868-829f-772c4ee29937')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 34, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.167' AS DateTime), NULL, NULL, NULL, N'dd558877-d7d8-4719-a6ec-dae4c6dc721a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.160' AS DateTime), NULL, NULL, NULL, N'10325281-a207-4cc5-94ca-7edcb41eb1e5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.163' AS DateTime), NULL, NULL, NULL, N'a3aed8e0-a341-47fd-8de7-b8888c6f5a96')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.160' AS DateTime), NULL, NULL, NULL, N'4ef916b7-fc2c-448f-8015-f1cd933730dd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.167' AS DateTime), NULL, NULL, NULL, N'ac990412-b8fc-4e07-a0ad-27e43579b035')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.357' AS DateTime), NULL, NULL, NULL, N'a5a50eed-740b-4905-9677-8b602d3de3c3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.353' AS DateTime), NULL, NULL, NULL, N'256e46c9-3772-4f28-a727-86343f87072a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.167' AS DateTime), NULL, NULL, NULL, N'66973d65-7364-4c99-a227-4256c0ea27ca')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.357' AS DateTime), NULL, NULL, NULL, N'2d2558d2-1abe-48ae-bcb5-f3095ab217ad')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.163' AS DateTime), NULL, NULL, NULL, N'bc5cf5c4-cd01-4b5c-8570-343bd25b43f7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.167' AS DateTime), NULL, NULL, NULL, N'331e9341-2f92-4c34-bddf-793083e67e69')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.163' AS DateTime), NULL, NULL, NULL, N'3c6fc3c9-e7f5-4e29-9576-07366b890974')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2018-08-25 00:00:00.000' AS DateTime), CAST(N'2019-06-13 16:10:18.000' AS DateTime), CAST(N'2018-06-13 16:10:18.160' AS DateTime), NULL, NULL, NULL, N'b97e673f-39a2-48a7-abb1-a44e8f2d313a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.883' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.720' AS DateTime), NULL, N'd14bbc5f-f4be-4c1d-b346-921ec01ed12f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.870' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.623' AS DateTime), NULL, N'cc20ff4e-64c0-4c7c-80fe-c309808177f2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 8, 1, N'', 0, 0, 0, 0, 0, 325, 375, 450, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.713' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.480' AS DateTime), NULL, N'eebef251-07e8-4941-adb4-80edfea820e7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.807' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.490' AS DateTime), NULL, N'3a6d7a67-0164-48b0-9c4b-b3d15f8a2f9d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.890' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.740' AS DateTime), NULL, N'f51f1014-16c9-4b74-be4b-e3be39d58c0c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.887' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.730' AS DateTime), NULL, N'd6b5b0cf-4632-4bc9-808e-5a2cf5161fa7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.873' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.707' AS DateTime), NULL, N'a9792d1c-c9d8-4dd3-8906-066aaa6b7b52')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 32, 1, N'', 0, 0, 0, 0, 0, 20, 20, 20, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.860' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.590' AS DateTime), NULL, N'588c6b12-154a-4008-9fa7-94968e7709bd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.857' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.580' AS DateTime), NULL, N'9381b7fe-7554-41bf-8cca-bcb20dd22148')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.830' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.507' AS DateTime), NULL, N'4980d592-2d59-456b-b332-24e145babdc2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.837' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.533' AS DateTime), NULL, N'bbf99669-5450-4051-8942-5f908217fa63')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.823' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.500' AS DateTime), NULL, N'833dbda7-7e07-42fa-b648-d642f12ad280')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.847' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.550' AS DateTime), NULL, N'98038adc-54eb-46cd-b0f5-2f5dcbd11d2e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.867' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.607' AS DateTime), NULL, N'eee8db11-7604-46de-b12f-121da904e237')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.863' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.597' AS DateTime), NULL, N'fce24263-47ab-48c5-ba8d-e1c30ae83d52')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.853' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.573' AS DateTime), NULL, N'44473274-f53a-4fa1-a7fa-520aa41f36c4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.870' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.613' AS DateTime), NULL, N'd0bbb4b8-d5a6-4a23-a736-bfad3a4bd627')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.833' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.523' AS DateTime), NULL, N'a2e70ae0-c5e7-4979-bad6-0abff9c0f78f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.850' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.557' AS DateTime), NULL, N'26a1aef0-ddec-4508-a7e9-7cc23e2a200f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 72, 1, N'', 0, 0, 0, 0, 0, 25.41663, 29.8786, 34.40219, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.840' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.540' AS DateTime), NULL, N'5d75b2ef-e90c-44b5-8b62-b16a3b9ef275')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-11 13:53:18.000' AS DateTime), CAST(N'2018-12-11 13:46:21.830' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.517' AS DateTime), NULL, N'd5ab13fb-6c22-45b9-9a66-b67579ff9069')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.310' AS DateTime), NULL, NULL, NULL, N'07f6c410-3ef4-4043-9ee9-e455add4dc80')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.307' AS DateTime), NULL, NULL, NULL, N'ebb73b0c-cff0-4dab-a805-d7136c46fdba')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 8, 1, N'', 0, 0, 0, 0, 0, 950, 950, 950, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.263' AS DateTime), NULL, NULL, NULL, N'6c0b2f20-8a10-4656-b06b-5a103f0334b2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.277' AS DateTime), NULL, NULL, NULL, N'4cb9a557-6472-440e-8104-fc3280757551')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.313' AS DateTime), NULL, NULL, NULL, N'f5d14000-f96d-403b-84e8-e01498b619f1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.310' AS DateTime), NULL, NULL, NULL, N'56a8af2e-40fe-4c74-8735-3fbb79aa38c3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.307' AS DateTime), NULL, NULL, NULL, N'2eba71ff-819c-436f-a4db-6f0f3ae5624e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 32, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.300' AS DateTime), NULL, NULL, NULL, N'f1af42b0-c7c8-4ec6-8fea-d0e5340bf82f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.297' AS DateTime), NULL, NULL, NULL, N'ff0a4518-cf06-4e89-a630-a8ba08e8e66c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.283' AS DateTime), NULL, NULL, NULL, N'1b953b87-771f-4f75-94b3-4f0b9602161b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.290' AS DateTime), NULL, NULL, NULL, N'0b22c259-ff9f-46c9-83ce-ccf7c6a9befe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.280' AS DateTime), NULL, NULL, NULL, N'e7d5292b-6e9b-4d52-91c5-6b7d88d96421')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.293' AS DateTime), NULL, NULL, NULL, N'43ac5c3e-851f-4350-87f8-d1ca987138cb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.303' AS DateTime), NULL, NULL, NULL, N'4908e341-b6f7-4816-8e19-e889c18e25ff')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.300' AS DateTime), NULL, NULL, NULL, N'461a0caa-44ed-4ea8-8e5c-9975b766f91b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.297' AS DateTime), NULL, NULL, NULL, N'54b71228-af5d-4768-bb9d-a10acc52413f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.303' AS DateTime), NULL, NULL, NULL, N'ba8a4bb4-8ffd-4938-a16b-8719a25038c3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.287' AS DateTime), NULL, NULL, NULL, N'c7edea10-61c7-491d-b048-9ca918e0c165')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.293' AS DateTime), NULL, NULL, NULL, N'0e6a9771-fd24-4cd2-ad8b-2cc10c8403b2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 72, 1, N'', 0, 0, 0, 0, 0, 31.50039, 36.04442, 40.64126, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.290' AS DateTime), NULL, NULL, NULL, N'a6d856b1-7adf-4798-be1e-42877f682963')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:39:02.000' AS DateTime), CAST(N'2018-12-12 14:39:02.287' AS DateTime), NULL, NULL, NULL, N'eaadbfad-4a32-4d1b-856f-0f99f4b638a4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.510' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.680' AS DateTime), NULL, N'6530611b-0326-4519-8748-64bb4e389c78')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.507' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.557' AS DateTime), NULL, N'198ac685-d4f8-4620-8acb-4b4820a6bc3a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 8, 1, N'', 0, 0, 0, 0, 0, 650, 750, 900, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:52.000' AS DateTime), CAST(N'2018-12-13 15:05:46.387' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.130' AS DateTime), NULL, N'181f1258-6645-4e9e-9dff-ce486073fdb7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.403' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.173' AS DateTime), NULL, N'757d7292-c3d7-411e-b6b0-da8b0f7b22b3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.517' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.700' AS DateTime), NULL, N'd22a1e10-107f-4d00-83f7-a2913fd89b25')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.513' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.690' AS DateTime), NULL, N'97f2cc9d-e270-43a7-9705-094118ffc30e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.510' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.570' AS DateTime), NULL, N'db2925b3-d67a-46ec-962e-3598d315ca32')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 32, 1, N'', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.497' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.513' AS DateTime), NULL, N'716713ba-7653-49fe-bf8a-ae847d434511')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.493' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.503' AS DateTime), NULL, N'73d2ffa3-581e-40cf-bbdd-9f8bea20a7d6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.407' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.283' AS DateTime), NULL, N'4d6777bd-b511-4d60-a720-cf3cb6b9f596')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.480' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.370' AS DateTime), NULL, N'621c64a8-4a9a-4cb8-9782-1acca0dfe4fa')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.407' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.273' AS DateTime), NULL, N'ce5cedaf-d132-46c2-a96e-06f90d43b317')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.487' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.437' AS DateTime), NULL, N'91707fbf-69bb-4880-b99f-d75c662284c7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.500' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.537' AS DateTime), NULL, N'78dd5fa4-748e-48aa-8930-69a3ca8fdd18')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.500' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.527' AS DateTime), NULL, N'4d873120-0de8-4aa3-be72-730db864f8d3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.490' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.457' AS DateTime), NULL, N'd5f4c34a-74ec-4d7f-ab6b-4ff21e70d829')
GO
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.503' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.547' AS DateTime), NULL, N'711fa406-7eea-4a6c-bd7b-61071cdd251c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.410' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.357' AS DateTime), NULL, N'c8a3e1c4-ef22-4c30-9e60-22aa55e0757e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.490' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.450' AS DateTime), NULL, N'1f892763-08db-4580-82c0-d33cc1f59a21')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.483' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.427' AS DateTime), NULL, N'9ec784ed-1c57-43dc-825e-4287db863f6c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'1995-12-12 00:00:00.000' AS DateTime), CAST(N'2019-12-13 15:35:53.000' AS DateTime), CAST(N'2018-12-13 15:05:46.410' AS DateTime), NULL, CAST(N'2018-12-13 15:35:53.333' AS DateTime), NULL, N'1c59ee04-a619-4dff-96d0-19d6f4143df2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.960' AS DateTime), NULL, NULL, NULL, N'abbda544-8092-447e-8ca2-2d003fe102da')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.957' AS DateTime), NULL, NULL, NULL, N'421be90a-8529-4ad4-9946-d5efa412ab41')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 8, 1, N'', 0, 0, 0, 0, 0, 975, 1125, 1350, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.917' AS DateTime), NULL, NULL, NULL, N'c52ee885-9860-4c3f-be88-af0a20b6d13f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.933' AS DateTime), NULL, NULL, NULL, N'd518923b-051a-41d3-ad95-1ad5f6bff605')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.960' AS DateTime), NULL, NULL, NULL, N'479cab70-2e92-48b9-9166-136cd471a1c8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.960' AS DateTime), NULL, NULL, NULL, N'b089e177-00f2-4437-85f7-5b620a5a0297')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.957' AS DateTime), NULL, NULL, NULL, N'b1122fbb-8a32-4097-a230-e8a17ae8e577')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 32, 1, N'', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.950' AS DateTime), NULL, NULL, NULL, N'2f4ff983-846b-4973-a1e8-28342867fb25')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.950' AS DateTime), NULL, NULL, NULL, N'824a2306-eb7e-49b6-a218-271279c48074')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.940' AS DateTime), NULL, NULL, NULL, N'08cf4d30-b568-4452-a969-8ecbe11ef627')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.943' AS DateTime), NULL, NULL, NULL, N'04fcd794-9f76-451a-b2fd-0a72e072293d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.937' AS DateTime), NULL, NULL, NULL, N'eb1df76e-c47f-480e-a89e-97a4f405a0f3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.947' AS DateTime), NULL, NULL, NULL, N'7243c4b2-8e8a-4fab-a741-71c88563a231')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.953' AS DateTime), NULL, NULL, NULL, N'5420bb58-280c-4bf6-8d8c-b5965b254025')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.953' AS DateTime), NULL, NULL, NULL, N'e8f17485-8209-40ac-9db6-eaeac9056443')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.950' AS DateTime), NULL, NULL, NULL, N'313ed6ba-4c32-4f59-913b-0e51b2e88eef')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.957' AS DateTime), NULL, NULL, NULL, N'e20328e8-1a7f-4d99-b637-b1b1417c48da')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.940' AS DateTime), NULL, NULL, NULL, N'73fa2dcc-1d91-48ee-9b9a-a2812408d11a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.947' AS DateTime), NULL, NULL, NULL, N'e26197a3-273a-42e4-bff5-d019ef1d00fe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.943' AS DateTime), NULL, NULL, NULL, N'62284257-25be-43cd-96de-3d5a182ef238')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2000-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-12 14:55:36.000' AS DateTime), CAST(N'2018-12-12 14:55:36.940' AS DateTime), NULL, NULL, NULL, N'6a297330-0a9a-4873-9cbf-7baa57c9e961')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, CAST(N'1995-12-12 00:00:00.000' AS DateTime), 0, 1, 1, 1, 1, N'Severe', 1, 0, 0, 1, 18, N'Amine low velocity corrosion - Key process variable', 1, 1, 0, 1, 0, 21, N'Solution Annealed', 0, 2000, N'', N'', 0, N'', 0, 0, CAST(N'2018-04-17 11:21:16.647' AS DateTime), NULL, CAST(N'2018-12-07 10:05:02.557' AS DateTime), NULL, N'f506fff9-28ca-4827-b4ab-8558c7a30fac')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, CAST(N'2000-02-01 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2018-04-26 16:58:14.270' AS DateTime), NULL, NULL, NULL, N'097b97ea-d814-424b-988a-fd2d4d420c5f')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, CAST(N'2018-08-25 00:00:00.000' AS DateTime), 0, 0, 1, 1, 0, N'Severe', 1, 0, 1, 1, 22, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'Solution Annealed', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2018-06-13 15:46:16.043' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.527' AS DateTime), NULL, N'f6896a95-5c48-4b6f-a307-3bbcecd72bb6')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, CAST(N'2018-08-25 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2018-06-13 16:21:58.623' AS DateTime), NULL, NULL, NULL, N'00817d3a-9050-4cfe-bdc0-dc1f2189c4a4')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, CAST(N'2005-01-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-07 09:03:46.767' AS DateTime), NULL, NULL, NULL, N'cf0c3a05-0ffb-483f-a63c-08e0f06b14e8')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, CAST(N'1990-10-20 00:00:00.000' AS DateTime), 1, 0, 0, 1, 1, N'Arid/dry', 0, 0, 0, 1, 15, N'Amine high velocity corrosion - Corrosion coupons', 1, 0, 1, 1, 0, 11, N'Stabilised After Welding', 1, 1000, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-07 10:05:02.373' AS DateTime), NULL, NULL, NULL, N'8382e322-616b-4976-b753-2c117aa91ae0')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, CAST(N'1995-12-12 00:00:00.000' AS DateTime), 0, 1, 1, 1, 1, N'Severe', 1, 0, 0, 1, 18, N'Amine low velocity corrosion - Key process variable', 1, 1, 0, 1, 0, 21, N'Solution Annealed', 0, 2000, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-07 10:05:02.453' AS DateTime), NULL, NULL, NULL, N'2b1b8961-0331-4bf4-8199-03463f61cbd9')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, CAST(N'2000-01-02 00:00:00.000' AS DateTime), 0, 0, 1, 0, 0, N'', 0, 0, 0, 0, 30, N'Amine low velocity corrosion - Corrosion coupons', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 100, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-07 10:13:09.493' AS DateTime), NULL, CAST(N'2018-12-11 13:53:21.890' AS DateTime), NULL, N'e50d0349-707d-4b07-b876-eb1e4a426649')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, CAST(N'1995-12-12 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 30, N'Amine low velocity corrosion - Corrosion coupons', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 300, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-12 14:32:11.253' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.530' AS DateTime), NULL, N'42a7e9dd-59cb-4c5b-b43b-062f45dcebb2')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, CAST(N'1995-12-12 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-12 14:45:20.590' AS DateTime), NULL, CAST(N'2018-12-13 15:36:03.910' AS DateTime), NULL, N'1fb9c161-84d0-4196-a198-ea06bf7fc652')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, CAST(N'2000-01-02 00:00:00.000' AS DateTime), 1, 0, 1, 1, 0, N'', 0, 0, 0, 0, 45, N'Sour water high velocity corrosion - Electrical resistance probes', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 100, N'', N'', 0, N'', 0, 0, CAST(N'2018-12-12 14:45:31.287' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.520' AS DateTime), NULL, N'c88d4dfb-1028-4e37-bf95-483d1e68a1ef')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 10, 30, 40, 50, 60, 10, 80, 90, 20, 10, CAST(N'2018-04-17 11:21:20.663' AS DateTime), NULL, CAST(N'2018-12-07 10:05:03.613' AS DateTime), NULL, N'b08bb179-2882-4944-b2c9-37e849f7eaab')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-04-26 16:58:14.407' AS DateTime), NULL, NULL, NULL, N'dc936227-15c1-4c59-9e94-7fa704a9ec64')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-06-13 15:46:16.637' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.673' AS DateTime), NULL, N'dadce616-65e6-4047-ac68-e9fd5804bfe1')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-06-13 16:21:58.653' AS DateTime), NULL, NULL, NULL, N'20bd0b80-a4d8-4dc1-acd9-ea9fdec3c311')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-07 09:03:47.183' AS DateTime), NULL, NULL, NULL, N'93631182-5d4f-4f50-9b3b-91adb301c65d')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, 10, 30, 40, 50, 60, 10, 80, 90, 20, 10, CAST(N'2018-12-07 10:05:03.580' AS DateTime), NULL, NULL, NULL, N'b6ee6cae-3bf9-4761-a4b8-8970469bec64')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, 10, 30, 40, 50, 60, 10, 80, 90, 20, 10, CAST(N'2018-12-07 10:05:03.583' AS DateTime), NULL, NULL, NULL, N'85f01d97-0d50-4999-bdb1-0f9f5a5ea465')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 2, 2, 0, 0, 90, 0, 0, 0, 0, 0, CAST(N'2018-12-07 10:13:09.523' AS DateTime), NULL, CAST(N'2018-12-11 13:53:22.023' AS DateTime), NULL, N'a2e85254-0ddf-45e5-8527-de042c2cf574')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 2, 2, 0, 0, 90, 0, 0, 0, 0, 0, CAST(N'2018-12-12 14:32:11.320' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.657' AS DateTime), NULL, N'5f12ac77-0708-4cc4-a032-6a06892ef2ba')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-12 14:45:20.613' AS DateTime), NULL, CAST(N'2018-12-13 15:36:04.153' AS DateTime), NULL, N'd766cf42-7465-41ac-ba4b-cf1362bd93e5')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, CAST(N'2018-12-12 14:45:31.290' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.557' AS DateTime), NULL, N'8f7cb083-7a2b-4796-bc5e-6ea39390f74b')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 11151662, N'E', 0, 0, 12000, 50000, 0.000500000023748726, 5000000, 0, CAST(N'2018-04-24 14:57:32.053' AS DateTime), NULL, NULL, NULL, N'3fbd5f0c-a7d5-4ee3-a395-e89bb6cc45bb')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 100000000, N'E', 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-06-13 16:10:17.893' AS DateTime), NULL, NULL, NULL, N'bef52f8b-2d9f-4ee8-8145-6b2b67509a8a')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 100000000, N'E', 0, 0, 2000, 50000, 0.0020000000949949, 500000, 0, CAST(N'2018-12-11 13:46:20.787' AS DateTime), NULL, CAST(N'2018-12-11 13:53:18.423' AS DateTime), NULL, N'1cb9bc7d-00d5-4d3c-93c6-9a1787af5007')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 100000000, N'E', 0, 0, 50000, 500000, 0.0500000007450581, 20000, 0, CAST(N'2018-12-12 14:39:02.070' AS DateTime), NULL, NULL, NULL, N'3f444d3a-8fbe-42e9-846a-59869e62ccf6')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 100000000, N'E', 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-13 15:05:45.707' AS DateTime), NULL, CAST(N'2018-12-13 15:35:52.340' AS DateTime), NULL, N'b6531ad7-1834-4817-b7f4-d45f9902c133')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 100000000, N'E', 0, 0, 2000, 50000, 0.00499999988824129, 500000, 0, CAST(N'2018-12-12 14:55:36.880' AS DateTime), NULL, NULL, NULL, N'3b03f086-5c0c-4a81-a0e3-a9c505614745')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, 63, 119, 119, 0, 0, 0, 1, 1, 1, 1381, 1381, 1381, 0, 0, 0, 0, 0, 0, 3, N'', 3.06E-05, 63, 119, 119, 64, 120, 120, 1445, 1501, 1501, 0.132651, 0.1377918, 0.1377918, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2018-04-24 14:55:52.430' AS DateTime), NULL, NULL, NULL, N'cfd924cb-0911-45be-9485-3358122e8164')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, 5700, 5700, 5700, 0, 0, 0, 1900, 1900, 1900, 4, 4, 4, 0, 0, 0, 4, 4, 4, 0.1, N'', 3.06E-05, 5700, 5700, 5700, 7600, 7600, 7600, 7608, 7608, 7608, 0.02328048, 0.02328048, 0.02328048, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2018-06-13 16:10:17.577' AS DateTime), NULL, NULL, NULL, N'07cf6caf-2a7c-4848-8d27-5714917e96d0')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, 325, 375, 450, 25.41663, 29.8786, 34.40219, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, N'', 3.06E-05, 325, 375, 450, 345, 395, 470, 370.4166, 424.8786, 429.4022, 0.0226695, 0.02600257, 0.02627941, 0, 0, 0, 0, 0, 0, 0, N'4', N'4', N'4', 0, N'', 0, CAST(N'2018-12-11 13:46:19.270' AS DateTime), NULL, CAST(N'2018-12-11 13:53:16.473' AS DateTime), NULL, N'f175a4c9-dc21-4550-8e56-077e220d3726')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, 950, 950, 950, 31.50039, 36.04442, 40.64126, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, N'', 3.06E-05, 1900, 1900, 1900, 2850, 2850, 2850, 2881.5, 2886.044, 2890.641, 0.1763478, 0.1766259, 0.1769073, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2018-12-12 14:38:59.890' AS DateTime), NULL, NULL, NULL, N'c2597a59-6b44-4769-9827-65ad9f789dad')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, 650, 750, 900, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, N'', 3.06E-05, 650, 750, 900, 651, 751, 901, 651, 751, 751, 0.0398412, 0.0459612, 0.0459612, 0, 0, 0, 0, 0, 0, 0, N'4', N'4', N'4', 0, N'', 0, CAST(N'2018-12-13 15:05:45.290' AS DateTime), NULL, CAST(N'2018-12-13 15:35:51.770' AS DateTime), NULL, N'f4d3e5b1-a3e7-4f2b-bbf5-5b3ad95caa30')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, 975, 1125, 1350, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, N'', 3.06E-05, 975, 1125, 1350, 976, 1126, 1351, 976, 1126, 1126, 0.0597312, 0.0689112, 0.0689112, 0, 0, 0, 0, 0, 0, 0, N'4', N'5', N'5', 0, N'', 0, CAST(N'2018-12-12 14:55:34.987' AS DateTime), NULL, NULL, NULL, N'26ec2d65-d305-43d3-9913-05914352263c')
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (213, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (214, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (215, N'C13-C16', N'Liquid', N'', N'C', N'C', N'Fire water deluge system and monitors', 44, 555, 6655, 0, 0.02, 0, 143, 134553, 34112, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (228, N'C1-C2', N'Liquid', N'', N'C', N'C', N'Fire water deluge system and monitors', 234, 123, 12344, 0, 0.005, 0, 111, 341234, 12355, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (234, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (235, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (236, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (237, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (239, N'C1-C2', N'Liquid', N'', N'C', N'C', N'', 120, 212, 280000, 0, 0.006, 0, 89, 181982, 21322, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (240, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (241, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (245, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (246, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (247, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (249, N'C1-C2', N'Liquid', N'', N'C', N'C', N'', 12000, 5000000, 0, 0, 0.0005, 0, 50000, 181528, 36564, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (251, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (255, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (256, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (257, N'C1-C2', N'Vapor', N'', N'C', N'C', N'Inventory blowdown, couple with isolation system classification B or higher', 2000, 500000, 0, 0, 0.002, 0, 50000, 12468, 24154, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (258, N'C1-C2', N'Vapor', N'', N'C', N'C', N'Inventory blowdown, couple with isolation system classification B or higher', 50000, 20000, 0, 0, 0.05, 0, 500000, 2150, 212, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (259, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (260, N'C1-C2', N'Vapor', N'', N'C', N'C', N'Fire water deluge system and monitors', 2000, 500000, 0, 0, 0.005, 0, 50000, 12400, 24000, 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (216, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (217, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (218, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (238, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (242, 45, 12, 20, 1, N'High', 10, 20, 30, N'Coarse', N'Light Diesel Oil', N'C9-C12', 5, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (243, 45, 12, 20, 1, N'High', 10, 20, 30, N'Coarse', N'Light Diesel Oil', N'C9-C12', 5, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (244, 45, 12, 20, 1, N'High', 10, 20, 30, N'Coarse', N'Light Diesel Oil', N'C9-C12', 5, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (250, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (252, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
INSERT [dbo].[RW_INPUT_CA_TANK] ([ID], [FLUID_HEIGHT], [SHELL_COURSE_HEIGHT], [TANK_DIAMETTER], [Prevention_Barrier], [Environ_Sensitivity], [P_lvdike], [P_onsite], [P_offsite], [Soil_Type], [TANK_FLUID], [API_FLUID], [SW], [ProductionCost]) VALUES (254, 0, 0, 0, 0, N'', 0, 0, 0, N'', N'', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[RW_INSPECTION_HISTORY] ON 

INSERT [dbo].[RW_INSPECTION_HISTORY] ([ID], [InspectionPlanName], [InspectionCoverageName], [EquipmentNumber], [ComponentNumber], [DM], [InspectionType], [InspectionDate], [InspectionEffective]) VALUES (1033, N'lab', N'1', N'4444', N'666666', N'Internal Thinning', N'Angled Shear Wave', CAST(N'2000-05-11 00:00:00.000' AS DateTime), N'B')
INSERT [dbo].[RW_INSPECTION_HISTORY] ([ID], [InspectionPlanName], [InspectionCoverageName], [EquipmentNumber], [ComponentNumber], [DM], [InspectionType], [InspectionDate], [InspectionEffective]) VALUES (1034, N'lab', N'1', N'99', N'1111', N'HIC/SOHIC-H2S', N'Chime', CAST(N'2000-05-11 00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[RW_INSPECTION_HISTORY] ([ID], [InspectionPlanName], [InspectionCoverageName], [EquipmentNumber], [ComponentNumber], [DM], [InspectionType], [InspectionDate], [InspectionEffective]) VALUES (1035, N'lab', N'1', N'99', N'1111', N'High Temperature Hydrogen Attack', N'B-scan', CAST(N'2000-05-11 00:00:00.000' AS DateTime), N'C')
INSERT [dbo].[RW_INSPECTION_HISTORY] ([ID], [InspectionPlanName], [InspectionCoverageName], [EquipmentNumber], [ComponentNumber], [DM], [InspectionType], [InspectionDate], [InspectionEffective]) VALUES (1036, N'lab', N'1', N'99', N'1111', N'Internal Thinning', N'Crack Detection', CAST(N'2000-05-11 00:00:00.000' AS DateTime), N'B')
INSERT [dbo].[RW_INSPECTION_HISTORY] ([ID], [InspectionPlanName], [InspectionCoverageName], [EquipmentNumber], [ComponentNumber], [DM], [InspectionType], [InspectionDate], [InspectionEffective]) VALUES (1037, N'lab', N'1', N'111', N'111', N'Amine Corrosion', N'Angled Shear Wave', CAST(N'2000-05-11 00:00:00.000' AS DateTime), N'B')
SET IDENTITY_INSERT [dbo].[RW_INSPECTION_HISTORY] OFF
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, N'Inox', 100, 200, 100, 60, 11, 60, N'Ultra Low < 0.002%', N'Sub Critical PWHT', 160, N'L Grade 300 series Stainless Steels', N'C-0.5Mo (Annealed)', 0, 0, 0, 0, 1, 1, 1, 500, 0, CAST(N'2018-04-17 11:21:26.250' AS DateTime), NULL, CAST(N'2018-12-07 10:05:04.960' AS DateTime), NULL, N'991fc57b-5deb-4198-b526-eae6cba01afb')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, N'', 0, 0, 0, 0, 0, 0, N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-04-26 16:58:14.343' AS DateTime), NULL, NULL, NULL, N'048cedd1-c2c4-40d8-9f5b-315f21b1ad1b')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, N'', 0, 0, 0, 0, 0, 0, N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-06-13 15:46:16.387' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.710' AS DateTime), NULL, N'1b1205bc-81c8-4e2d-926f-dfa01e116b00')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, N'', 0, 0, 0, 0, 0, 0, N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-06-13 16:21:58.640' AS DateTime), NULL, NULL, NULL, N'c5393eca-0497-4156-93cb-6ad78885b568')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, N'', 0, 0, 0, 0, 0, 0, N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-07 09:03:47.057' AS DateTime), NULL, NULL, NULL, N'7ee999d3-7628-42a9-9826-14a365a1f728')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, N'Feraric', 200, 2000, 100, 50, 11, 60, N'Low 0.002 - 0.01%', N'Normalised Temper', 150, N'Regular 300 series Stainless Steels and Alloys 600 and 800', N'2.25Cr-1Mo', 1, 1, 1, 1, 1, 1, 1, 400, 0, CAST(N'2018-12-07 10:05:04.780' AS DateTime), NULL, NULL, NULL, N'132e41ec-7f40-44a9-a1cf-c009339bae73')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, N'Inox', 100, 200, 100, 60, 11, 60, N'Ultra Low < 0.002%', N'Sub Critical PWHT', 160, N'L Grade 300 series Stainless Steels', N'C-0.5Mo (Annealed)', 0, 0, 0, 0, 1, 1, 1, 500, 0, CAST(N'2018-12-07 10:05:04.833' AS DateTime), NULL, NULL, NULL, N'8e7d87da-3d95-47a5-804d-975411f28dd7')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, N'', 1300, 120, -1, 2.3, 3.17, 10, N'Low 0.002 - 0.01%', N'None', 2, N'', N'', 0, 0, 0, 0, 0, 1, 0, 600, 0, CAST(N'2018-12-07 10:13:09.510' AS DateTime), NULL, CAST(N'2018-12-11 13:53:22.043' AS DateTime), NULL, N'3f466a9f-dd01-4a18-866a-f1d7556bd87b')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, N'', 21212, 212, 1, 0, 300, 1, N'Low 0.002 - 0.01%', N'Annealed', 212, N'', N'', 0, 0, 0, 0, 0, 1, 0, 0, 0, CAST(N'2018-12-12 14:32:11.297' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.737' AS DateTime), NULL, N'f1def536-6c3a-41b6-b599-4303b0e3422b')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, N'', 0, 0, 0, 0, 0, 0, N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2018-12-12 14:45:20.603' AS DateTime), NULL, CAST(N'2018-12-13 15:36:04.270' AS DateTime), NULL, N'cfbfe3d7-2fa0-4097-baea-88f726f751a3')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [AllowableStress], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, N'', 12000, 1000, 17, 1, 3.17, 1, N'', N'Normalised Temper', 21, N'', N'', 0, 0, 0, 0, 0, 0, 0, 240, 1, CAST(N'2018-12-12 14:45:31.290' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.577' AS DateTime), NULL, N'ec238f9a-772f-45d4-bf71-070327952020')
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (249, NULL, 1494635, 1514086, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608, 1536608)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (251, 0, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824, 2326824)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (257, 1000000, 2582007, 2591111, 2600257, 2609446, 3077674, 3086942, 3096246, 3105587, 3573962, 3583371, 3592812, 3602285, 4070789, 4080322, 4089884)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (258, 1000000, 17644010, 17653290, 17662590, 17671930, 17681310, 17690730, 17700170, 17709640, 17719150, 17728690, 17738250, 17747840, 17757460, 17767110, 17776780)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (259, 1000000, 3984120, 4596120, 4596120, 4596120, 5514120, 5514120, 5514120, 6432120, 6432120, 6432120, 7350120, 7350120, 7350120, 8268120, 8268120)
INSERT [dbo].[RW_RISK_GRAPH] ([ID], [risktarget], [risk1], [risk2], [risk3], [risk4], [risk5], [risk6], [risk7], [risk8], [risk9], [risk10], [risk11], [risk12], [risk13], [risk14], [risk15]) VALUES (260, 1000000, 6891120, 6891120, 6891120, 8268120, 8268120, 8268120, 8268120, 9645120, 9645120, 9645120, 11022120, 11022120, 11022120, 11022120, 12399120)
INSERT [dbo].[RW_SETTINGS] ([ID], [DefaultAssessmentMethod], [SchemaVersion], [UnlockCode], [CompanyName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 3, N'5.0.1', NULL, NULL, CAST(N'2016-04-29 22:30:34.377' AS DateTime), NULL, NULL, NULL, N'73804365-e1cb-4be2-8d2b-ab7769db6743')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (249, N'Sulfinol', 1, 1, 1, 1, 100, 300, 0, 0, 1, N'Low Lean Amine', 0, 20, 0, 400, 0, 2000, 1, 1, 900, 2000, 20, -2, 400, 0, 10, 0, 20, N'', 0, 10, N'', 0, 0, 0, 0, CAST(N'2018-04-17 11:21:24.280' AS DateTime), NULL, CAST(N'2018-12-07 10:05:04.270' AS DateTime), NULL, N'4fcb3a9c-68dd-4132-95a5-62b9bdeb8253')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (250, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-04-26 16:58:14.363' AS DateTime), NULL, NULL, NULL, N'7f48533b-a6c0-4a2e-bde9-f63c10b530a2')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (251, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-06-13 15:46:16.560' AS DateTime), NULL, CAST(N'2018-06-13 16:10:33.603' AS DateTime), NULL, N'20cc6768-3d3a-4cd7-8aaa-c6c742802201')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (252, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-06-13 16:21:58.647' AS DateTime), NULL, NULL, NULL, N'9081cb09-7367-4166-a1bd-ef738cccf5e2')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (254, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-12-07 09:03:47.103' AS DateTime), NULL, NULL, NULL, N'58666585-fe5d-4681-925c-23c19cce4c66')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (255, N'Diglycolamine DGA', 1, 0, 0, 1, 100, 300, 1, 1, 1, N'High Rich Amine', 0, 20, 1, 400, 0, 2000, 0, 1, 10000, 1000, 30, -1, 500, 0, 2, 0, 30, N'', 0, 8, N'', 0, 0, 0, 0, CAST(N'2018-12-07 10:05:04.230' AS DateTime), NULL, NULL, NULL, N'6997df6d-6010-40ec-b8a3-4541fcb5f8b0')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (256, N'Sulfinol', 1, 1, 1, 1, 100, 300, 0, 0, 1, N'Low Lean Amine', 0, 20, 0, 400, 0, 2000, 1, 1, 900, 2000, 20, -2, 400, 0, 10, 0, 20, N'', 0, 10, N'', 0, 0, 0, 0, CAST(N'2018-12-07 10:05:04.230' AS DateTime), NULL, NULL, NULL, N'4760f0fc-405f-4a86-88f7-ea26a0246a9c')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (257, N'Diglycolamine DGA', 1, 1, 0, 1, 1000, 0, 0, 0, 1, N'Low Lean Amine', 0, 0, 1, 100, 1, 1000, 1, 1, 500, 100, 200, 27, 800, 0, 2, 0, 10, N'', 0, 5, N'', 0, 0, 0, 0, CAST(N'2018-12-07 10:13:09.517' AS DateTime), NULL, CAST(N'2018-12-11 13:53:21.923' AS DateTime), NULL, N'850017d7-008e-4ad6-9e9d-704e5656149c')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (258, N'Diethanolamine DEA', 1, 1, 0, 1, 12, 0, 0, 0, 1, N'None', 0, 0.1, 1, 5, 1, 1000, 1, 1, 12, 120, 900, -1, 170, 0, 5, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-12-12 14:32:11.303' AS DateTime), NULL, CAST(N'2018-12-12 14:39:04.627' AS DateTime), NULL, N'1b29fe52-548d-4944-8c2f-e9996aa468be')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (259, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, CAST(N'2018-12-12 14:45:20.610' AS DateTime), NULL, CAST(N'2018-12-13 15:36:04.087' AS DateTime), NULL, N'0e6c2164-6126-43a9-bd44-d44606a092fe')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [TankFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (260, N'Diglycolamine DGA', 0, 0, 1, 0, 1000, 0, 0, 0, 0, N'Low Lean Amine', 0, 80, 0, 1000, 0, 10000, 0, 0, 1000, 100, 200, 20, 0, 0, 12, 0, 1, N'', 0, 5, N'', 0, 0, 0, 0, CAST(N'2018-12-12 14:45:31.290' AS DateTime), NULL, CAST(N'2018-12-12 14:55:42.547' AS DateTime), NULL, N'82ce29c3-69d4-47d0-bd1f-d0d903a5e301')
INSERT [dbo].[SAFETY_FACTORS] ([SafetyFactorID], [SafetyFactorName], [A], [B], [C], [D], [E], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Scaled Full-Life', 1, 1, 1, 1, 1, CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'f03c51d2-7a4e-44ef-8a0a-e179c08eddfd')
SET IDENTITY_INSERT [dbo].[SITES] ON 

INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (238, N'Hanoi', CAST(N'2018-04-17 11:21:06.687' AS DateTime), NULL, CAST(N'2018-04-24 15:31:07.967' AS DateTime), NULL, N'f722f635-f276-48aa-9581-f4f6abff36f4')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (239, N'Sai Gon', CAST(N'2018-04-17 11:21:06.750' AS DateTime), NULL, CAST(N'2018-04-24 15:31:08.040' AS DateTime), NULL, N'a0d6ae96-5292-482b-9bc2-3c1dda2cb01b')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (240, N'hghg', CAST(N'2018-04-26 16:56:04.710' AS DateTime), NULL, NULL, NULL, N'bb3da2e4-7f79-4173-a683-2db64515821b')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (242, N'ahoeooeieoeieoe...._____11111111', CAST(N'2018-05-15 17:33:29.797' AS DateTime), NULL, NULL, NULL, N'337195db-1586-4982-bf3d-a87d0db05be9')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (243, N'Hà Tây', CAST(N'2018-05-30 11:05:57.100' AS DateTime), NULL, NULL, NULL, N'8fa03926-84b6-487d-9c16-9ce03c5c34f6')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (244, N'Hello', CAST(N'2018-06-13 15:17:36.440' AS DateTime), NULL, NULL, NULL, N'e082815a-f921-4de5-82d3-52d61051545f')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (245, N'HoaBinh', CAST(N'2018-12-07 08:42:22.417' AS DateTime), NULL, NULL, NULL, N'514a77e8-c80f-4e26-a5c3-798354bb89a0')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (246, N'Cortek', CAST(N'2018-12-07 10:04:54.707' AS DateTime), NULL, NULL, NULL, N'fbb2146d-d984-4251-9f92-b4d3b0d37b72')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (247, N'Site Moi', CAST(N'2018-12-07 10:04:54.713' AS DateTime), NULL, NULL, NULL, N'ed15ca7d-87a2-45be-9311-753a1aa17bda')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (248, N'Technology', CAST(N'2018-12-07 10:04:54.717' AS DateTime), NULL, NULL, NULL, N'd17737be-5d38-4d4b-be54-d85c6808a8d4')
SET IDENTITY_INSERT [dbo].[SITES] OFF
INSERT [dbo].[TBL_204_DM_HTHA] ([Susceptibility], [No Inspection], [1D], [1C], [1B], [2D], [2C], [2B]) VALUES (N'Damage', 0, 2000, 2000, 2000, 2000, 2000, 2000)
INSERT [dbo].[TBL_204_DM_HTHA] ([Susceptibility], [No Inspection], [1D], [1C], [1B], [2D], [2C], [2B]) VALUES (N'High', 2000, 1800, 1200, 800, 1600, 800, 400)
INSERT [dbo].[TBL_204_DM_HTHA] ([Susceptibility], [No Inspection], [1D], [1C], [1B], [2D], [2C], [2B]) VALUES (N'Low', 20, 18, 12, 8, 16, 8, 4)
INSERT [dbo].[TBL_204_DM_HTHA] ([Susceptibility], [No Inspection], [1D], [1C], [1B], [2D], [2C], [2B]) VALUES (N'Medium', 200, 180, 120, 80, 160, 80, 40)
INSERT [dbo].[TBL_204_DM_HTHA] ([Susceptibility], [No Inspection], [1D], [1C], [1B], [2D], [2C], [2B]) VALUES (N'Not', 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.25, 18, -20, -55, -55)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.3125, 18, -20, -55, -55)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.375, 18, -20, -55, -55)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.4375, 24.2, -14, -40.5, -55)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.5, 31.6, -6.9, -32.2, -55)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.5625, 38.2, -0.6, -27.2, -51)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.625, 44, 5.2, -22.8, -47.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.6875, 49.2, 10.4, -18.7, -44.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.75, 53.9, 15.1, -15, -41.1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.8125, 58.2, 19.5, -11.6, -38.1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.875, 62.1, 23.5, -8.6, -35.3)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (0.9375, 65.6, 27.2, -5.7, -32.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1, 68.9, 30.6, -3.1, -30.1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.0625, 71.9, 33.8, -0.7, -27.8)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.125, 74.6, 36.7, 1.6, -25.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.1875, 77.2, 39.4, 3.7, -23.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.25, 79.6, 42, 5.8, -21.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.3125, 81.8, 44.4, 7.7, -19.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.375, 83.8, 46.6, 9.6, -17.6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.4375, 85.8, 48.7, 11.4, -15.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.5, 87.6, 50.7, 13.1, -14.3)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.5625, 89.2, 52.5, 14.8, -12.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.625, 90.8, 54.3, 16.4, -11.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.6875, 92.3, 55.9, 17.9, -9.8)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.75, 93.7, 57.5, 19.4, -8.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.8125, 95.1, 58.9, 20.9, -7.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.875, 96.3, 60.3, 22.3, -5.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (1.9375, 97.5, 61.7, 23.7, -4.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2, 98.6, 63, 25, -3.6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.0625, 99.7, 64.2, 26.3, -2.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.125, 100.7, 65.3, 27.5, -1.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.1875, 101.7, 66.4, 28.7, -0.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.25, 102.6, 67.5, 29.9, 0.6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.3125, 103.5, 68.5, 31, 1.6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.375, 104.3, 69.5, 32.1, 2.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.4375, 105.1, 70.5, 33.2, 3.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.5, 105.8, 71.4, 34.3, 4.3)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.5625, 106.5, 72.3, 35.3, 5.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.625, 107.2, 73.2, 36.3, 6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.6875, 107.9, 74, 37.2, 6.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.75, 108.5, 74.8, 38.2, 7.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.8125, 109.1, 75.6, 39.1, 8.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.875, 109.7, 76.4, 39.9, 9.3)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (2.9375, 110.2, 77.2, 40.8, 10.1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3, 110.8, 77.9, 41.7, 10.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.0625, 111.3, 78.7, 42.5, 11.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.125, 111.7, 79.4, 43.3, 12.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.1875, 112.2, 80.1, 44, 13.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.25, 112.6, 80.8, 44.8, 13.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.3125, 113.1, 81.5, 45.5, 14.7)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.375, 113.5, 82.1, 46.3, 15.4)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.4375, 113.9, 82.8, 47, 16.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.5, 114.2, 83.5, 47.7, 16.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.5625, 114.6, 84.1, 48.3, 17.6)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.625, 114.9, 84.8, 49, 18.3)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.6875, 115.3, 85.4, 49.6, 19.1)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.75, 115.6, 86, 50.2, 19.8)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.8125, 115.9, 86.7, 50.9, 20.5)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.875, 116.2, 87.3, 51.4, 21.2)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (3.9375, 116.4, 87.9, 52, 21.9)
INSERT [dbo].[TBL_213_DM_IMPACT_EXEMPTION] ([ComponentThickness], [CurveA], [CurveB], [CurveC], [CurveD]) VALUES (4, 116.7, 88.5, 52.6, 22.5)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-73, 4, 61, 579, 1436, 2336, 3160, 3883, 4509, 5000)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-62, 3, 46, 474, 1239, 2080, 2873, 3581, 4203, 4746)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-51, 2, 30, 350, 988, 1740, 2479, 3160, 3769, 4310)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-40, 2, 16, 220, 697, 1317, 1969, 2596, 3176, 3703)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-29, 1.2, 7, 109, 405, 850, 1366, 1897, 2415, 2903)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-18, 0.9, 3, 39, 175, 424, 759, 1142, 1545, 1950)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-7, 0.1, 1.3, 10, 49, 143, 296, 500, 741, 1008)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (4, 0, 0.7, 2, 9, 29, 69, 133, 224, 338)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (16, 0, 0, 1, 2, 4, 9, 19, 36, 60)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (27, 0, 0, 0, 0.8, 1.1, 2, 2, 4, 6)
INSERT [dbo].[TBL_214_DM_NOT_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (38, 0, 0, 0, 0, 0, 0, 0.9, 1.1, 1.2)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-73, 0, 1.3, 9, 46, 133, 277, 472, 704, 962)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-62, 0, 1.2, 7, 34, 102, 219, 382, 582, 810)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-51, 0, 1.1, 5, 22, 68, 153, 277, 436, 623)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-40, 0, 0.9, 3, 12, 38, 90, 171, 281, 416)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-29, 0, 0.4, 2, 5, 17, 41, 83, 144, 224)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-18, 0, 0, 1.1, 2, 6, 14, 29, 53, 88)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-7, 0, 0, 0.6, 1.2, 2, 4, 7, 13, 23)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (4, 0, 0, 0, 0.5, 1.1, 1.3, 2, 3, 4)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (16, 0, 0, 0, 0, 0, 0.5, 0.9, 1.1, 1.3)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (27, 0, 0, 0, 0, 0, 0, 0, 0, 0.2)
INSERT [dbo].[TBL_215_DM_PWHT] ([Tmin-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (38, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (1, 31623, 12)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (2, 1000, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (3, 4536, 10000)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (4, 2.205, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (5, 25.2, 55.6)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (6, 55.6, 100)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (7, 1, 10.763)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (8, 0.0929, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (9, 0.123, 0.6)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (10, 9.744, 63.32)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (11, 0.145, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (12, 1.8, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (13, 6.29, 0.178)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (14, 1, 3600)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (15, 4.685, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (16, 30.89, 70)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (17, 0.001481, 0.00723)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (18, 0.005, 0.0164)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (19, 1.085, 1.015)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (20, 1.013, 0.147)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (21, 5328, 9590)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (22, 5.8, 14.62)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (23, 0.45, 0.346)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (24, 2.6, 2.279)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (25, 0.0296, 0.0438)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (26, 100, 14.5)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (27, 1, 0.3967)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (28, 1000, 6895)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (29, 0.00043, 0.000185)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (30, 9.76E-08, 6.43E-07)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (31, 864, 7200)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (32, 0.543, 107)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (33, 0.0815, 16.03)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (34, 86.4, 183000)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (35, 2.382, 0.0259)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (36, 30.5, 100)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'10', 846.3, 1.181)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'15', 1053, 1.18)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'20', 1256, 1.178)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'25', 1455, 1.176)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'30', 1650, 1.174)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'35', 1842, 1.172)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'40', 2029, 1.169)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'45', 2213, 1.166)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'5', 636.7, 1.183)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'50', 2389, 1.161)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'55', 2558, 1.155)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'60', 2714, 1.145)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Ammonia', N'Instantaneous Releases', 2.684, 0.9011)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'10', 3518, 1.095)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'15', 3798, 1.092)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'20', 4191, 1.089)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'25', 4694, 1.085)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'30', 5312, 1.082)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'35', 6032, 1.077)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'40', 6860, 1.072)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'45', 7788, 1.066)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'5', 3350, 1.097)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'50', 8798, 1.057)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'55', 9890, 1.046)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'60', 10994, 1.026)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Chlorine', N'Instantaneous Releases', 3.528, 1.177)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'10', 1.2411, 3.9686)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'20', 1.241, 4.0948)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'40', 1.237, 4.238)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'5', 1.2297, 4.3626)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'60', 1.2266, 4.4365)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'H2S', N'Instantaneous Releases', 0.9674, 2.784)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'10', 1.1401, 3.5683)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'20', 1.1031, 3.8431)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'40', 1.0816, 4.104)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'5', 1.0942, 4.3295)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'60', 1.1031, 4.4576)
INSERT [dbo].[TBL_511_512_CA_GAS_TOXIC] ([Toxic], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HF Acid', N'Instantaneous Releases', 1.4056, 33606)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 3, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 4, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 5, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.02, 1, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 3, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 4, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 5, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.04, 1, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 3, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 4, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 5, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.06, 1, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 3, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 4, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 5, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.08, 1, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 1, 2, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 2, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 3, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 4, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 5, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 2, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 1, 5, 3, 2, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 2, 4, 2, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 3, 3, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 4, 2, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 5, 2, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.12, 6, 6, 1, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 1, 17, 10, 6, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 2, 13, 6, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 3, 10, 3, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 4, 7, 2, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 5, 5, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.14, 20, 6, 4, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 1, 70, 50, 20, 3)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 2, 50, 20, 4, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 3, 40, 10, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 4, 30, 5, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 5, 20, 2, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.16, 90, 6, 14, 1, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 1, 200, 130, 70, 7)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 2, 170, 70, 10, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 3, 130, 35, 3, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 4, 100, 15, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 5, 70, 7, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.18, 250, 6, 50, 3, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 1, 300, 210, 110, 15)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 2, 290, 120, 20, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 3, 260, 60, 5, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 4, 180, 20, 2, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 5, 120, 10, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 400, 6, 100, 6, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 1, 450, 290, 150, 20)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 2, 350, 170, 30, 2)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 3, 240, 80, 6, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 4, 200, 30, 2, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 5, 150, 15, 2, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 520, 6, 120, 7, 1, 1)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 1, 550, 400, 200, 30)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 2, 400, 200, 40, 4)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 3, 320, 110, 9, 2)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 4, 240, 50, 4, 2)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 5, 180, 25, 3, 2)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 650, 6, 150, 10, 2, 2)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 1, 650, 550, 300, 80)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 2, 600, 300, 80, 10)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 3, 540, 150, 20, 5)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 4, 440, 90, 10, 4)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 5, 350, 70, 6, 4)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 750, 6, 280, 40, 5, 4)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 1, 800, 700, 400, 130)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 2, 700, 400, 120, 30)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 3, 600, 200, 50, 10)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 4, 500, 140, 20, 8)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 5, 400, 110, 10, 8)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 900, 6, 350, 90, 9, 8)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 1, 900, 810, 500, 200)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 2, 800, 500, 160, 40)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 3, 700, 270, 60, 20)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 4, 600, 200, 30, 15)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 5, 500, 160, 20, 15)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 1050, 6, 400, 130, 20, 15)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 1, 1100, 970, 600, 270)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 2, 1000, 600, 200, 60)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 3, 900, 380, 80, 40)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 4, 800, 270, 50, 40)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 5, 700, 210, 40, 40)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 1200, 6, 600, 180, 40, 40)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 1, 1200, 1130, 700, 350)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 2, 1100, 750, 300, 100)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 3, 1000, 500, 130, 90)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 4, 900, 350, 100, 90)
GO
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 5, 800, 260, 90, 90)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 6, 700, 240, 90, 90)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 1, 1400, 1250, 850, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 2, 1300, 900, 400, 230)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 3, 1200, 620, 250, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 4, 1000, 450, 220, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 5, 900, 360, 210, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 6, 800, 300, 210, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 1, 1700, 1400, 1000, 700)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 2, 1600, 1105, 670, 530)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 3, 1300, 880, 550, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 4, 1200, 700, 530, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 5, 1100, 840, 500, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 6, 1000, 600, 500, 500)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.05, 4, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 14, 1, 3, 1, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.15, 32, 1, 8, 2, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 56, 1, 18, 6, 2, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 87, 1, 32, 11, 4, 3)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 125, 1, 53, 21, 9, 6)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 170, 1, 80, 36, 16, 12)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 222, 1, 115, 57, 29, 21)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 281, 1, 158, 86, 47, 36)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 347, 1, 211, 124, 73, 58)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 420, 1, 273, 173, 109, 89)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 500, 1, 346, 234, 158, 133)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 587, 1, 430, 309, 222, 192)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.7, 681, 1, 527, 401, 305, 270)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.75, 782, 1, 635, 510, 409, 370)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.8, 890, 1, 757, 638, 538, 498)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.85, 1005, 1, 893, 789, 696, 658)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.9, 1126, 1, 1044, 963, 888, 856)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.95, 1255, 1, 1209, 1163, 1118, 1098)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (1, 1390, 1, 1390, 1390, 1390, 1390)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'AlCl3', N'Gas', N'All', 3.4531, 0.9411)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'3', 9.55, 1.15)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'5', 60.09, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'10', 189.42, 1.13)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'20', 651.49, 1.11)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'40', 1252.67, 1.17)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'60', 1521.89, 1.21)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'3', 47.39, 1.09)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'5', 123.67, 1.15)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'10', 531.45, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'20', 224.55, 1.18)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'40', 950.92, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'60', 2118.87, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'3', 13230.9, 1.25)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'5', 17146, 1.25)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'10', 23851.3, 1.24)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'20', 31185, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'40', 35813.7, 1.22)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'60', 38105.8, 1.22)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'3', 1114.96, 1.08)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'5', 2006.1, 1.02)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'10', 2674.47, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'20', 4112.65, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'40', 6688.99, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'60', 9458.29, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'3', 1071.74, 0.7)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'5', 1466.57, 0.68)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'10', 1902.9, 0.68)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'20', 2338.76, 0.72)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'40', 3621.1, 0.7)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'60', 4070.48, 0.71)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'3', 430, 0.98)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'5', 610.31, 1.04)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'10', 1340.93, 1.07)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'20', 3020.54, 1.08)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'40', 6110.67, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'60', 9455.68, 1.13)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'3', 3095.33, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'5', 5918.49, 1.29)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'10', 12129.3, 1.24)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'20', 27459.6, 1.27)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'40', 63526.4, 1.3)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'60', 96274.2, 1.31)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'3', 733.39, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'5', 1520.02, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'10', 4777.72, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'20', 14727.5, 1.16)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'40', 42905, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'60', 77287.7, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'3', 793.04, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'5', 846.54, 1.09)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'10', 1011.9, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'20', 1026.06, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'40', 1063.8, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'60', 1252.57, 1.03)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'1.5', 0.8954, 1.171)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'3', 1.7578, 1.181)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'5', 4.0002, 1.122)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'10', 7.54, 1.111)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'20', 24.56, 0.971)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'40', 31.22, 0.995)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'60', 59.67, 0.899)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'10', 0.6857, 1.105)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'20', 3.6389, 1.065)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'40', 9.8422, 1.132)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'60', 23.513, 1.104)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'1.5', 0.5085, 1.222)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'3', 2.972, 1.207)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'5', 7.9931, 1.271)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'10', 47.69, 1.2909)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'20', 237.57, 1.2849)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'40', 1088.4, 1.1927)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'60', 1767.5, 1.203)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'3', 0.0008, 1.913)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'5', 0.0864, 1.217)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'10', 0.1768, 1.2203)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'20', 0.4172, 1.2164)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'40', 0.9537, 1.2097)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'60', 1.2289, 1.2522)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'5', 2.4084, 1.198)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'10', 9.0397, 1.111)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'20', 17.425, 1.114)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'40', 34.255, 1.118)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'60', 367.06, 0.9855)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Acid', 18, 62.3, 212, N'Liquid', 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'AlCl3', 133.5, 152, 382, N'Powder', 1, 43400, 39700, 417, 24000, 0, 1036)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C1-C2', 23, 15.639, -193, N'Gas', 1, 12.3, 0.115, -2.87E-05, -1.3E-09, 0, 1036)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C13-C16', 205, 47.728, 502, N'Liquid', 1, -11.7, 1.39, -0.000772, 1.67E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C17-C25', 280, 48.383, 651, N'Liquid', 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C25+', 422, 56.187, 981, N'Liquid', 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C3-C4', 51, 33.61, -6.3, N'Gas', 1, 2.632, 0.3188, -13470, 1.466E-08, 0, 696)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C5', 72, 39.03, 97, N'Liquid', 1, -3.626, 0.4873, -0.00026, 5.3E-08, 0, 544)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C6-C8', 100, 42.702, 210, N'Liquid', 1, -5.146, 0.6762, -0.000365, 7.658E-08, 0, 433)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C9-C12', 149, 45.823, 364, N'Liquid', 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 406)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'CO', 28, 50, -312, N'Gas', 2, 29100, 8770, 3090, 8460, 1540, 1128)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'DEE', 74, 45, 95, N'Liquid', 2, 86200, 255000, 1540, 144000, -689, 320)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EE', 90, 58, 275, N'Liquid', 2, 32500, 300000, 1170, 208000, 473, 455)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EEA', 132, 61, 313, N'Liquid', 2, 106000, 240000, 659, 150000, 1970, 715)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EG', 62, 69, 387, N'Liquid', 2, 63000, 146000, 1670, 97300, 774, 745)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EO', 44, 55, 51, N'Gas', 2, 33500, 121000, 1610, 82400, 737, 804)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'H2', 2, 4.433, -423, N'Gas', 1, 27.1, 0.00927, -1.38E-05, 7.65E-09, 0, 752)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'H2S', 34, 61.993, -75, N'Gas', 1, 31.9, 0.00144, 2.43E-05, -1.18E-08, 0, 500)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'HCl', 36, 74, -121, N'Gas', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'HF', 20, 60.37, 68, N'Gas', 1, 29.1, 0.000661, -2.03E-06, 2.5E-09, 0, 32000)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Methanol', 32, 50, 149, N'Liquid', 2, 39300, 87900, 1920, 53700, 897, 867)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Nitric Acid', 63, 95, 250, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'NO2', 90, 58, 275, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Phosgene', 99, 86, 181, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'PO', 58, 52, 93, N'Liquid', 2, 49500, 174000, 1560, 115000, 702, 840)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Pyrophoric', 149, 45.823, 364, N'Liquid', 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Steam', 18, 62.3, 212, N'Gas', 3, 33400, 26800, 2610, 8900, 1170, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Styrene', 104, 42.7, 293, N'Liquid', 2, 89300, 215000, 772, 99900, 2440, 914)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'TDI', 174, 76, 484, N'Liquid', 0, 0, 0, 0, 0, 0, 1148)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Water', 18, 62.3, 212, N'Liquid', 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Aromatics', 64.14, 0.963, 353.5, 0.883, 1344, 0.937, 487.7, 0.268, 18.08, 0.686, 0.14, 0.935, 512.6, 0.713, 1.404, 0.935)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C1-C2', 8.669, 0.98, 0, 0, 55.13, 0.95, 0, 0, 6.469, 0.67, 0, 0, 163.7, 0.62, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C13-C16', 0, 0, 12.11, 0.9, 0, 0, 196.7, 0.92, 0, 0, 0.086, 0.88, 0, 0, 1.714, 0.88)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C17-C25', 0, 0, 3.785, 0.9, 0, 0, 165.5, 0.92, 0, 0, 0.021, 0.91, 0, 0, 1.068, 0.91)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C25+', 0, 0, 2.098, 0.91, 0, 0, 103, 0.9, 0, 0, 0.006, 0.99, 0, 0, 0.284, 0.99)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C3-C4', 10.13, 1, 0, 0, 64.23, 1, 0, 0, 4.59, 0.72, 0, 0, 79.94, 0.63, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C5', 5.115, 0.99, 100.6, 0.89, 62.41, 1, 0, 0, 2.214, 0.73, 0.271, 0.85, 41.38, 0.61, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C6-C8', 5.846, 0.98, 34.17, 0.89, 63.98, 1, 103.4, 0.95, 2.188, 0.66, 0.749, 0.78, 41.49, 0.61, 8.18, 0.55)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C9-C12', 2.419, 0.98, 24.6, 0.9, 76.98, 0.95, 110.3, 0.95, 1.111, 0.66, 0.559, 0.76, 42.28, 0.61, 0.848, 0.53)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'CO', 0.04, 1.752, 0, 0, 0, 0, 0, 0, 10.97, 0.667, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'DEE', 9.072, 1.134, 164.2, 1.106, 67.42, 1.033, 976, 0.649, 24.51, 0.667, 0.981, 0.919, 0, 0, 1.09, 0.919)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EE', 2.595, 1.005, 35.45, 1, 0, 0, 0, 0, 6.119, 0.667, 14.79, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EEA', 0, 1.035, 23.96, 1, 0, 0, 0, 0, 1.261, 0.667, 14.13, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EG', 1.548, 0.973, 22.12, 1, 0, 0, 0, 0, 1.027, 0.667, 14.13, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EO', 6.712, 1.069, 0, 0, 0, 0, 0, 0, 21.46, 0.667, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2', 13.13, 0.992, 0, 0, 86.02, 1, 0, 0, 9.605, 0.657, 0, 0, 216.5, 0.618, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2S', 6.554, 1, 0, 0, 38.11, 0.89, 0, 0, 22.63, 0.63, 0, 0, 53.72, 0.61, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'HF', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Methanol', 0.005, 0.909, 340.4, 0.934, 0, 0, 0, 0, 4.425, 0.667, 0.363, 0.9, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'PO', 3.277, 1.114, 257, 0.96, 0, 0, 0, 0, 10.32, 0.667, 0.629, 0.869, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Pyrophoric', 2.419, 0.98, 24.6, 0.9, 76.98, 0.95, 110.3, 0.95, 1.111, 0.66, 0.559, 0.76, 42.28, 0.61, 0.848, 0.53)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Styrene', 3.952, 1.097, 21.1, 1, 80.11, 1.055, 0, 0, 1.804, 0.667, 14.36, 1, 83.68, 0.713, 143.6, 1)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Aromatics', 12.76, 0.963, 66.01, 0.883, 261.9, 0.937, 56, 0.268, 2.889, 0.686, 0.027, 0.935, 83.68, 0.713, 0.273, 0.935)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C1-C2', 21.83, 0.96, 0, 0, 143.2, 0.92, 0, 0, 12.46, 0.67, 0, 0, 473.9, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C13-C16', 0, 0, 34.36, 0.89, 0, 0, 539.4, 0.9, 0, 0, 0.242, 0.88, 0, 0, 4.843, 0.88)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C17-C25', 0, 0, 10.7, 0.89, 0, 0, 458, 0.9, 0, 0, 0.061, 0.91, 0, 0, 3.052, 0.9)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C25+', 0, 0, 6.196, 0.89, 0, 0, 303.6, 0.9, 0, 0, 0.016, 0.99, 0, 0, 0.833, 0.99)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C3-C4', 25.64, 1, 0, 0, 171.4, 1, 0, 0, 9.702, 0.75, 0, 0, 270.4, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C5', 12.71, 1, 290.1, 0.89, 166.1, 1, 0, 0, 4.82, 0.76, 0.79, 0.85, 146.7, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C6-C8', 3.49, 0.96, 96.88, 0.89, 169.7, 1, 252.8, 0.92, 4.216, 0.67, 2.186, 0.78, 147.2, 0.63, 31.89, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C9-C12', 5.755, 0.96, 70.03, 0.89, 188.6, 0.92, 269.4, 0.92, 2.035, 0.66, 1.609, 0.76, 151, 0.63, 2.847, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'CO  ', 5.491, 0.991, 0, 0, 0, 0, 0, 0, 16.91, 0.692, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'DEE', 26.76, 1.025, 236.7, 1.219, 241.5, 0.997, 488.9, 0.864, 31.71, 0.682, 8.333, 0.814, 128.3, 0.657, 9.258, 0.814)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EE', 7.107, 0.969, 8.142, 0.8, 0, 0, 0, 0, 25.36, 0.66, 0.029, 0.927, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EEA', 0, 0.946, 79.66, 0.835, 0, 0, 0, 0, 1.825, 0.687, 0.03, 0.924, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EG', 5.042, 0.947, 59.96, 0.869, 0, 0, 0, 0, 1.435, 0.687, 0.027, 0.922, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EO', 11, 1.105, 0, 0, 0, 0, 0, 0, 34.7, 0.665, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2', 32.05, 0.933, 0, 0, 228.8, 1, 0, 0, 18.43, 0.652, 0, 0, 636.5, 0.621, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2S', 10.65, 1, 0, 0, 73.25, 0.94, 0, 0, 41.43, 0.63, 0, 0, 191.5, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'HF', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Methanol', 0, 1.008, 849.9, 0.902, 0, 0, 0, 0, 6.035, 6.88, 1.157, 0.871, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'PO', 8.239, 1.047, 352.8, 0.84, 0, 0, 0, 0, 13.33, 0.682, 2.732, 0.83, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Pyrophoric', 5.755, 0.96, 70.03, 0.89, 188.6, 0.92, 269.4, 0.92, 2.035, 0.66, 1.609, 0.76, 151, 0.63, 2.847, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Styrene', 12.76, 0.963, 66.01, 0.883, 261.9, 0.937, 56, 0.268, 2.889, 0.686, 0.027, 0.935, 83.68, 0.713, 0.273, 0.935)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (1, 0.3, 0.5, 9, 3, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (2, 0.5, 1, 40, 4, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (3, 0.7, 2, 146, 6, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (4, 1, 4, 428, 7, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (5, 1, 9, 1017, 9, 1, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (6, 2, 16, 1978, 11, 1, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (7, 3, 30, 3000, 13, 1, 2)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (8, 4, 53, 3000, 16, 1, 3)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (9, 6, 89, 3000, 20, 2, 7)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (10, 9, 146, 3000, 25, 3, 13)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (11, 12, 230, 3000, 30, 4, 26)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (12, 16, 351, 3000, 36, 5, 47)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (13, 22, 518, 3000, 44, 7, 82)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (14, 30, 738, 3000, 53, 9, 139)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (15, 40, 1017, 3000, 63, 11, 228)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (16, 53, 1358, 3000, 75, 15, 359)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (17, 69, 1758, 3000, 89, 19, 548)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (18, 89, 2209, 3000, 105, 25, 808)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (19, 115, 2697, 3000, 124, 31, 1151)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (20, 146, 3000, 3000, 146, 40, 1587)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (21, 184, 3000, 3000, 170, 50, 2119)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (22, 230, 3000, 3000, 199, 63, 2743)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (23, 286, 3000, 3000, 230, 78, 3000)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (24, 351, 3000, 3000, 266, 97, 3000)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (25, 428, 3000, 3000, 306, 119, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (1, 30, 1, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (2, 89, 4, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (3, 230, 16, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (4, 518, 53, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (5, 1017, 146, 0.2)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (6, 1758, 351, 1)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (7, 2697, 738, 4)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (8, 3000, 1358, 16)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (9, 3000, 2209, 53)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (10, 3000, 3000, 146)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (11, 3000, 3000, 351)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (12, 3000, 3000, 738)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (13, 3000, 3000, 1358)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (14, 3000, 3000, 2209)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (15, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (16, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (17, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (18, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (19, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (20, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (21, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (22, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (23, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (24, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (25, 3000, 3000, 3000)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Crude Oil', N'C17-C25', 280, 48.383, 7.706E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Fuel Oil', N'C17-C25', 280, 48.383, 7.706E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Gasonline', N'C6-C8', 100, 42.702, 8.383E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Crude Oil', N'C25+', 422, 56.187, 9.6E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Diesel Oil', N'C13-C16', 205, 47.728, 5.129E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Fuel Oil', N'C25+', 422, 56.187, 9.6E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Light Diesel Oil', N'C9-C12', 149, 45.823, 2.169E-05)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Coarse Sand', 0.0394, 0.00394, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Fine Sand', 0.00394, 0.000394, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Very Fine Sand', 0.000394, 3.94E-06, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Silt', 3.94E-06, 3.94E-07, 0.41)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Sandy Clay', 3.94E-07, 3.94E-08, 0.45)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Clay', 3.94E-08, 3.94E-09, 0.5)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Concrete-Asphalt', 3.94E-11, 3.94E-12, 0.99)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (10, 10, 8, 3, 1, 1, 6, 2, 1, 1, 4, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (50, 50, 40, 17, 5, 3, 30, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (100, 100, 80, 33, 10, 5, 60, 20, 4, 1, 40, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (500, 500, 400, 170, 50, 25, 300, 100, 20, 5, 200, 50, 8, 1, 100, 25, 2, 1, 50, 10, 1, 1, 25, 5, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1000, 100, 800, 330, 100, 50, 600, 200, 40, 10, 400, 100, 16, 2, 200, 50, 5, 1, 100, 25, 2, 1, 50, 10, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (5000, 500, 4000, 1670, 250, 250, 3000, 1000, 250, 50, 2000, 500, 80, 10, 1000, 250, 25, 2, 500, 125, 5, 1, 250, 50, 2, 1)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (1, N'C_indike', 10, 10, 10)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (2, N'C_ssonline', 50, 50, 50)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (3, N'C_ssoffline', 100, 250, 500)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (4, N'C_subsoil', 500, 1500, 3000)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (5, N'C_groundwater', 1000, 5000, 10000)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (6, N'C_water', 500, 1500, 5000)
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'BAR', N'bar', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'57a13d98-2f06-437f-9a86-6850fd09b7d3')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Custom', N'Custom Scheme', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'704bcdf1-71f7-4f7b-b955-8a6d2b0b5a17')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'DEG_C', N'°C', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'e7439a8e-2f6b-440e-84a1-a3ff16bed293')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'DEG_F', N'°F', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'd4e76b15-0244-4688-b1c6-58df6209adf1')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'European', N'European Scheme', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'38b60468-bbaf-4667-867d-bf4ca5ba44ee')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'FT3', N'ft³', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'613d3cef-93b3-473f-bb21-b146e79fcade')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'FT3HR', N'ft³/hr', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'4915a3f7-819c-4a68-a5d3-e32112d79a20')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'INCH', N'in', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'df524296-c204-45b1-bb85-f44fd1309d42')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'K', N'K', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'bff55a7e-50ff-4010-bcb2-45411a583df0')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'KG', N'kg', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'7b95365a-2e13-4218-88da-c0893a30a05c')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'KSI', N'KSI', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'f8161f26-4a9b-42fa-b2d2-06d3dfea6e1d')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'LBFFT', N'lbf.ft', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'450537c4-3ad9-4fb9-9e31-36ed34f99926')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'M', N'm', CAST(N'2016-04-29 22:30:34.303' AS DateTime), NULL, NULL, NULL, N'0400a238-493e-4091-9a27-9aaf921e57c4')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'M3', N'm³', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'c430e5eb-f29c-4ec5-b500-271c8947c2e8')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'M3HR', N'm³/hr', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'bbaa8848-d0ac-46f9-851f-fa13bf75eb90')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'MIL', N'mil', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'01f35949-4fe5-4a82-b1ed-06b524acc387')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'MILYR', N'mil/yr', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'5aba07b1-1794-490b-9330-033e8792676b')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'MM', N'mm', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'95852248-099c-41d3-a557-2edeb4fa332f')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'MMYR', N'mm/yr', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'8fce2558-e081-43e0-8702-871c4117cad7')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'MPA', N'MPa', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'12c6275d-2da8-4595-bfe2-f95a6eb6714f')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'MW', N'mW', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'14885264-a1c4-488b-800d-01bea1535f10')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'NCM2', N'N/cm²', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'8983a009-89f5-47c6-9fab-16a482a882a6')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'NM', N'Nm', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'5815ed66-db58-45ea-904c-11497b15941d')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'NM2', N'N/m²', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'348f2944-8a88-4791-be20-d5a66ef05fc5')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'PSI', N'psi', CAST(N'2016-04-29 22:30:34.307' AS DateTime), NULL, NULL, NULL, N'e7cdbe87-d211-4b32-81ac-18a69d40c54c')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'US', N'US Scheme', CAST(N'2016-04-29 22:30:34.310' AS DateTime), NULL, NULL, NULL, N'1327bf2d-c07a-462c-9769-91fc36637474')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Pressure', N'PSI', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'cf1d6658-b05e-4dca-9c5f-121cb68177c7')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Temperature', N'DEG_C', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'08ce27d1-df93-45af-bd39-dec775896b67')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Dimensions', N'MM', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'209f0c0a-7dda-4faf-828f-e04ae342757c')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Volume', N'M3', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'eedd0c46-6ab9-492c-b212-0826ce61b125')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'FlowRate', N'M3HR', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'6bf16253-ec08-4d8e-b249-e2ea293a8332')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Diameter', N'INCH', CAST(N'2016-04-29 22:30:34.297' AS DateTime), NULL, NULL, NULL, N'5bdea015-d75e-4080-9a99-606f4c043291')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Thickness', N'MM', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'392884af-45af-4214-8f59-c056b3b27590')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'MetalLoss', N'MM', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'1f080816-e960-4a78-af2e-819e5fa8e602')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Corrosion', N'MM', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'1092c68c-ed9d-437a-99fc-0d03ce92263b')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Torque', N'LBFFT', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'71a3c25f-ec47-4581-8a04-4527b18a2cec')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Scheme', N'European', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'67a7f580-009a-4580-9462-f113375e18d7')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Stress', N'PSI', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'a2dc69fa-d2ab-4e3a-8c9c-0269f6cfa6aa')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'CorrosionRate', N'MMYR', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'bc9bd7ff-6a63-4cbb-83b9-f1a30464416a')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Meter', N'M', CAST(N'2016-04-29 22:30:34.300' AS DateTime), NULL, NULL, NULL, N'4786bf85-5ece-404e-bf9a-e9fe5cf85ca0')
INSERT [dbo].[USERS] ([UserID], [Title], [FirstName], [LastName], [JobTitle], [Department], [Company], [UserGroupName], [ADAuthentication], [SysUser], [IsActive], [LicenseKey], [Password], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (N'administrator', N'', N'Administrator', N'Administrator', N'', N'', N'', N'Administrators', 0, 1, 1, NULL, N'blfGC81EuE96PYQhKKkm8L/8goKJgzWvejPBgWaW3VI=6YTYtABd8EZtXGW4iTMItixtW3qAZBZ7elmT5wvQI1E=', CAST(N'2016-04-29 22:30:34.380' AS DateTime), NULL, NULL, NULL, N'd4c55074-df04-4fc1-9703-1ea7a0af8913')
/****** Object:  Index [IX_API_COMPONENT_TYPE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_API_COMPONENT_TYPE] ON [dbo].[API_COMPONENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_DETAIL]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_DETAIL] ON [dbo].[COMPONENT_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_MASTER]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_MASTER] ON [dbo].[COMPONENT_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_MODELLING]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_MODELLING] ON [dbo].[COMPONENT_MODELLING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_TYPE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_TYPE] ON [dbo].[COMPONENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DESIGN_CODE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DESIGN_CODE] ON [dbo].[DESIGN_CODE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_CATEGORY]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_CATEGORY] ON [dbo].[DM_CATEGORY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_EXPECTED_TYPE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_EXPECTED_TYPE] ON [dbo].[DM_EXPECTED_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_ITEMS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_ITEMS] ON [dbo].[DM_ITEMS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_EXTRA_FIELDS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_EXTRA_FIELDS] ON [dbo].[EQUIPMENT_EXTRA_FIELDS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_EquipmentNumber]    Script Date: 12/13/2018 4:02:15 PM ******/
ALTER TABLE [dbo].[EQUIPMENT_MASTER] ADD  CONSTRAINT [UK_EquipmentNumber] UNIQUE NONCLUSTERED 
(
	[EquipmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_MASTER]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_MASTER] ON [dbo].[EQUIPMENT_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION] ON [dbo].[EQUIPMENT_REVISION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION_INSPECTION]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION_INSPECTION] ON [dbo].[EQUIPMENT_REVISION_INSPECTION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION_INSPECTION_COVERAGE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION_INSPECTION_COVERAGE] ON [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_TYPE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_TYPE] ON [dbo].[EQUIPMENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_LOOKUP]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_LOOKUP] ON [dbo].[EXTRA_FIELDS_LOOKUP]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_LOOKUP_COMPONENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_LOOKUP_COMPONENT] ON [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_SETTING]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_SETTING] ON [dbo].[EXTRA_FIELDS_SETTING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_SETTING_COMPONENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_SETTING_COMPONENT] ON [dbo].[EXTRA_FIELDS_SETTING_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FACILITY]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FACILITY] ON [dbo].[FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FACILITY_RISK_TARGET]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FACILITY_RISK_TARGET] ON [dbo].[FACILITY_RISK_TARGET]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_COMPONENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_COMPONENT] ON [dbo].[FILE_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_EQUIPMENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_EQUIPMENT] ON [dbo].[FILE_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_FACILITY]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_FACILITY] ON [dbo].[FILE_FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_GenericFluid]    Script Date: 12/13/2018 4:02:15 PM ******/
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [UK_GenericFluid] UNIQUE NONCLUSTERED 
(
	[GenericFluid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GENERIC_FLUID]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GENERIC_FLUID] ON [dbo].[GENERIC_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GENERIC_MATERIAL]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GENERIC_MATERIAL] ON [dbo].[GENERIC_MATERIAL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IM_ITEMS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IM_ITEMS] ON [dbo].[IM_ITEMS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IM_TYPE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IM_TYPE] ON [dbo].[IM_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_COMPONENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_COMPONENT] ON [dbo].[IMAGE_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_EQUIPMENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_EQUIPMENT] ON [dbo].[IMAGE_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_FACILITY]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_FACILITY] ON [dbo].[IMAGE_FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_COVERAGE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_COVERAGE] ON [dbo].[INSPECTION_COVERAGE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_COVERAGE_DETAIL]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_COVERAGE_DETAIL] ON [dbo].[INSPECTION_COVERAGE_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_COVERAGE_EQUIPMENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_COVERAGE_EQUIPMENT] ON [dbo].[INSPECTION_COVERAGE_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_PLAN]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_PLAN] ON [dbo].[INSPECTION_PLAN]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ITEM_LIST_CONFIG]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ITEM_LIST_CONFIG] ON [dbo].[ITEM_LIST_CONFIG]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MANUFACTURER]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MANUFACTURER] ON [dbo].[MANUFACTURER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_POINTS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_POINTS] ON [dbo].[POINTS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_REPORT_TEMPLATE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_REPORT_TEMPLATE] ON [dbo].[REPORT_TEMPLATE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_REPORT_TEMPLATE_COMPONENT_DEFAULT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_REPORT_TEMPLATE_COMPONENT_DEFAULT] ON [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_ASSESSMENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_ASSESSMENT] ON [dbo].[RW_ASSESSMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_CF_MASTER]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_CF_MASTER] ON [dbo].[RW_CF_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_COATING]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_COATING] ON [dbo].[RW_COATING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_COMPONENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_COMPONENT] ON [dbo].[RW_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_CORROSION_RATE_TANK]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_CORROSION_RATE_TANK] ON [dbo].[RW_CORROSION_RATE_TANK]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_DAMAGE_MECHANISM]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_DAMAGE_MECHANISM] ON [dbo].[RW_DAMAGE_MECHANISM]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EQUIPMENT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EQUIPMENT] ON [dbo].[RW_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EXTCOR_TEMPERATURE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EXTCOR_TEMPERATURE] ON [dbo].[RW_EXTCOR_TEMPERATURE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EXTRA_FIELDS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EXTRA_FIELDS] ON [dbo].[RW_EXTRA_FIELDS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF] ON [dbo].[RW_FULL_COF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_FLUID]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_FLUID] ON [dbo].[RW_FULL_COF_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_HOLE_SIZE]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_HOLE_SIZE] ON [dbo].[RW_FULL_COF_HOLE_SIZE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_INPUT]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_INPUT] ON [dbo].[RW_FULL_COF_INPUT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_FCOF]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_FCOF] ON [dbo].[RW_FULL_FCOF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_POF]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_POF] ON [dbo].[RW_FULL_POF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_LF_DETAIL]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_LF_DETAIL] ON [dbo].[RW_LF_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_LF_MASTER]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_LF_MASTER] ON [dbo].[RW_LF_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_MATERIAL]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_MATERIAL] ON [dbo].[RW_MATERIAL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_POINTS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_POINTS] ON [dbo].[RW_POINTS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRIMARY_FLUID]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRIMARY_FLUID] ON [dbo].[RW_PRIMARY_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_REVISION_INSPECTION]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_REVISION_INSPECTION] ON [dbo].[RW_REVISION_INSPECTION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_RISK_TARGET]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_RISK_TARGET] ON [dbo].[RW_RISK_TARGET]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_SAFETY_FACTOR]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_SAFETY_FACTOR] ON [dbo].[RW_SAFETY_FACTOR]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_SECONDARY_FLUID]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_SECONDARY_FLUID] ON [dbo].[RW_SECONDARY_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_rw_settings]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_rw_settings] ON [dbo].[RW_SETTINGS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_STREAM]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_STREAM] ON [dbo].[RW_STREAM]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_THICKNESS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_THICKNESS] ON [dbo].[RW_THICKNESS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SAFETY_FACTORS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SAFETY_FACTORS] ON [dbo].[SAFETY_FACTORS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SITES]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SITES] ON [dbo].[SITES]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_THICKNESS_READING]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_THICKNESS_READING] ON [dbo].[THICKNESS_READING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UNIT_DESCRIPTOR]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UNIT_DESCRIPTOR] ON [dbo].[UNIT_DESCRIPTOR]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UNITS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UNITS] ON [dbo].[UNITS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USER_PERMISSION_LIST]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USER_PERMISSION_LIST] ON [dbo].[USER_PERMISSION_LIST]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [KEY_USER_PERMISSIONS]    Script Date: 12/13/2018 4:02:15 PM ******/
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [KEY_USER_PERMISSIONS] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[Category] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USER_PERMISSIONS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USER_PERMISSIONS] ON [dbo].[USER_PERMISSIONS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USERS]    Script Date: 12/13/2018 4:02:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USERS] ON [dbo].[USERS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] ADD  CONSTRAINT [DF_0ED19940_COMPONENT_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] ADD  CONSTRAINT [DF_0ED19940_COMPONENT_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] ADD  CONSTRAINT [DF_5EB1F3E7_COMPONENT_MODELLING_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] ADD  CONSTRAINT [DF_5EB1F3E7_COMPONENT_MODELLING_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[DM_EXPECTED_TYPE] ADD  CONSTRAINT [DF_E784683A_DM_EXPECTED_TYPE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[DM_EXPECTED_TYPE] ADD  CONSTRAINT [DF_E784683A_DM_EXPECTED_TYPE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] ADD  CONSTRAINT [DF_E61F626A_EQUIPMENT_EXTRA_FIELDS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] ADD  CONSTRAINT [DF_E61F626A_EQUIPMENT_EXTRA_FIELDS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_IsReviewed]  DEFAULT ((0)) FOR [IsReviewed]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_3F4D9EE3_EQUIPMENT_REVISION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_3F4D9EE3_EQUIPMENT_REVISION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_INSPECTION_CarriedOut]  DEFAULT ((0)) FOR [CarriedOut]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EFC554CD_EQUIPMENT_REVISION_INSPECTION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EFC554CD_EQUIPMENT_REVISION_INSPECTION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_B787C8EA_EQUIPMENT_REVISION_INSPECTION_COVERAGE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_B787C8EA_EQUIPMENT_REVISION_INSPECTION_COVERAGE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] ADD  CONSTRAINT [DF_9D9A2BA1_EXTRA_FIELDS_LOOKUP_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] ADD  CONSTRAINT [DF_9D9A2BA1_EXTRA_FIELDS_LOOKUP_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] ADD  CONSTRAINT [DF_6DCD04AE_EXTRA_FIELDS_LOOKUP_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] ADD  CONSTRAINT [DF_6DCD04AE_EXTRA_FIELDS_LOOKUP_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_COMPONENT] ADD  CONSTRAINT [DF_3C403670_FILE_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_COMPONENT] ADD  CONSTRAINT [DF_3C403670_FILE_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] ADD  CONSTRAINT [DF_D78C71C4_FILE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] ADD  CONSTRAINT [DF_D78C71C4_FILE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_FACILITY] ADD  CONSTRAINT [DF_E10E1F44_FILE_FACILITY_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_FACILITY] ADD  CONSTRAINT [DF_E10E1F44_FILE_FACILITY_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [DF_75A8642D_GENERIC_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [DF_75A8642D_GENERIC_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_IsPTA]  DEFAULT ((0)) FOR [IsPTA]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_IsHTHA]  DEFAULT ((0)) FOR [IsHTHA]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_Austenitic]  DEFAULT ((0)) FOR [Austenitic]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_Temper]  DEFAULT ((0)) FOR [Temper]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_CarbonLowAlloy]  DEFAULT ((0)) FOR [CarbonLowAlloy]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_NickelBased]  DEFAULT ((0)) FOR [NickelBased]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_ChromeMoreEqual12]  DEFAULT ((0)) FOR [ChromeMoreEqual12]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_0B9DE2E7_GENERIC_MATERIAL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_0B9DE2E7_GENERIC_MATERIAL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] ADD  CONSTRAINT [DF_0D98ED13_IMAGE_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] ADD  CONSTRAINT [DF_0D98ED13_IMAGE_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] ADD  CONSTRAINT [DF_3797396D_IMAGE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] ADD  CONSTRAINT [DF_3797396D_IMAGE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] ADD  CONSTRAINT [DF_8B0D053C_IMAGE_FACILITY_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] ADD  CONSTRAINT [DF_8B0D053C_IMAGE_FACILITY_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_50172D67_INSPECTION_COVERAGE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_50172D67_INSPECTION_COVERAGE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] ADD  CONSTRAINT [DF_INSPECTION_COVERAGE_DETAIL_CarriedOut]  DEFAULT ((0)) FOR [CarriedOut]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] ADD  CONSTRAINT [DF_316DF396_INSPECTION_COVERAGE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] ADD  CONSTRAINT [DF_316DF396_INSPECTION_COVERAGE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_PLAN] ADD  CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_PLAN] ADD  CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[ITEM_LIST_CONFIG] ADD  CONSTRAINT [DF_3C77DB65_ITEM_LIST_CONFIG_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ITEM_LIST_CONFIG] ADD  CONSTRAINT [DF_3C77DB65_ITEM_LIST_CONFIG_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[POINTS] ADD  CONSTRAINT [DF_79597FAC_POINTS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[POINTS] ADD  CONSTRAINT [DF_79597FAC_POINTS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] ADD  CONSTRAINT [DF_9B53B128_REPORT_TEMPLATE_ASSESSMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] ADD  CONSTRAINT [DF_9B53B128_REPORT_TEMPLATE_ASSESSMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] ADD  CONSTRAINT [DF_77013026_REPORT_TEMPLATE_COMPONENT_DEFAULT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] ADD  CONSTRAINT [DF_77013026_REPORT_TEMPLATE_COMPONENT_DEFAULT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] ADD  CONSTRAINT [DF_4D94F99E_REPORT_TEMPLATE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] ADD  CONSTRAINT [DF_4D94F99E_REPORT_TEMPLATE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_CF_MASTER] ADD  CONSTRAINT [DF_BFD5846B_RW_CF_MASTER_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_CF_MASTER] ADD  CONSTRAINT [DF_BFD5846B_RW_CF_MASTER_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK] ADD  CONSTRAINT [DF_715B05F7_RW_CORROSION_RATE_TANK_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK] ADD  CONSTRAINT [DF_715B05F7_RW_CORROSION_RATE_TANK_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] ADD  CONSTRAINT [DF_025227DC_RW_EXTRA_FIELDS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] ADD  CONSTRAINT [DF_025227DC_RW_EXTRA_FIELDS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF] ADD  CONSTRAINT [DF_3D9B1711_RW_FULL_COF_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF] ADD  CONSTRAINT [DF_3D9B1711_RW_FULL_COF_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] ADD  CONSTRAINT [DF_B856E7FE_RW_FULL_COF_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] ADD  CONSTRAINT [DF_B856E7FE_RW_FULL_COF_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] ADD  CONSTRAINT [DF_239635CB_RW_FULL_COF_HOLE_SIZE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] ADD  CONSTRAINT [DF_239635CB_RW_FULL_COF_HOLE_SIZE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] ADD  CONSTRAINT [DF_8A295264_RW_FULL_COF_INPUT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] ADD  CONSTRAINT [DF_8A295264_RW_FULL_COF_INPUT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] ADD  CONSTRAINT [DF_700255FF_RW_FULL_COF_TANK_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] ADD  CONSTRAINT [DF_700255FF_RW_FULL_COF_TANK_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_RW_LF_DETAIL_IsEL]  DEFAULT ((0)) FOR [IsEL]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_F2D7C887_RW_LF_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_F2D7C887_RW_LF_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_LF_MASTER] ADD  CONSTRAINT [DF_948BAB73_RW_LF_MASTER_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_LF_MASTER] ADD  CONSTRAINT [DF_948BAB73_RW_LF_MASTER_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_POINTS] ADD  CONSTRAINT [DF_A43A97CC_RW_POINTS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_POINTS] ADD  CONSTRAINT [DF_A43A97CC_RW_POINTS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] ADD  CONSTRAINT [DF_D4F81868_RW_PRIMARY_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] ADD  CONSTRAINT [DF_D4F81868_RW_PRIMARY_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] ADD  CONSTRAINT [DF_2F5666E8_RW_REVISION_INSPECTION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] ADD  CONSTRAINT [DF_2F5666E8_RW_REVISION_INSPECTION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] ADD  CONSTRAINT [DF_BA882196_RW_RISK_TARGET_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] ADD  CONSTRAINT [DF_BA882196_RW_RISK_TARGET_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] ADD  CONSTRAINT [DF_C7548A2D_RW_SAFETY_FACTOR_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] ADD  CONSTRAINT [DF_C7548A2D_RW_SAFETY_FACTOR_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] ADD  CONSTRAINT [DF_0E4227CB_RW_SECONDARY_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] ADD  CONSTRAINT [DF_0E4227CB_RW_SECONDARY_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_RW_THICKNESS_Valid]  DEFAULT ((0)) FOR [ValidReading]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_A5EB98BE_RW_THICKNESS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_A5EB98BE_RW_THICKNESS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_THICKNESS_READING_ValidReading]  DEFAULT ((0)) FOR [ValidReading]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_372690BE_THICKNESS_READING_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_372690BE_THICKNESS_READING_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[USER_PERMISSION_LIST] ADD  CONSTRAINT [DF_03381E47_USER_PERMISSION_LIST_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[USER_PERMISSION_LIST] ADD  CONSTRAINT [DF_03381E47_USER_PERMISSION_LIST_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [DF_FFE19599_USER_PERMISSIONS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [DF_FFE19599_USER_PERMISSIONS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_DETAIL_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] CHECK CONSTRAINT [FK_COMPONENT_DETAIL_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_API_COMPONENT_TYPE] FOREIGN KEY([APIComponentTypeID])
REFERENCES [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID])
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_API_COMPONENT_TYPE]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_COMPONENT_TYPE] FOREIGN KEY([ComponentTypeID])
REFERENCES [dbo].[COMPONENT_TYPE] ([ComponentTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_COMPONENT_TYPE]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MODELLING_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] CHECK CONSTRAINT [FK_COMPONENT_MODELLING_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[DM_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_DM_ITEMS_DM_CATEGORY] FOREIGN KEY([DMCategoryID])
REFERENCES [dbo].[DM_CATEGORY] ([DMCategoryID])
GO
ALTER TABLE [dbo].[DM_ITEMS] CHECK CONSTRAINT [FK_DM_ITEMS_DM_CATEGORY]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_EXTRA_FIELDS_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] CHECK CONSTRAINT [FK_EQUIPMENT_EXTRA_FIELDS_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_DESIGN_CODE1] FOREIGN KEY([DesignCodeID])
REFERENCES [dbo].[DESIGN_CODE] ([DesignCodeID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_DESIGN_CODE1]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_EQUIPMENT_TYPE] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_EQUIPMENT_TYPE]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_FACILITY]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_MANUFACTURER] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[MANUFACTURER] ([ManufacturerID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_MANUFACTURER]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_SITES1] FOREIGN KEY([SiteID])
REFERENCES [dbo].[SITES] ([SiteID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_SITES1]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_DM_ITEMS]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION] FOREIGN KEY([RevisionID])
REFERENCES [dbo].[EQUIPMENT_REVISION] ([RevisionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION_INSPECTION] FOREIGN KEY([RevisionID], [CoverageDetailID])
REFERENCES [dbo].[EQUIPMENT_REVISION_INSPECTION] ([RevisionID], [CoverageDetailID])
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION_INSPECTION]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_IM_TYPE]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_COVERAGE_EQUIPMENT_REVISION] FOREIGN KEY([RevisionID])
REFERENCES [dbo].[EQUIPMENT_REVISION] ([RevisionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_COVERAGE_EQUIPMENT_REVISION]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP]  WITH CHECK ADD  CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_EXTRA_FIELDS_SETTING] FOREIGN KEY([ExtraFieldID])
REFERENCES [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID])
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] CHECK CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_EXTRA_FIELDS_SETTING]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_COMPONENT_EXTRA_FIELDS_SETTING_COMPONENT] FOREIGN KEY([ExtraFieldID])
REFERENCES [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID])
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] CHECK CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_COMPONENT_EXTRA_FIELDS_SETTING_COMPONENT]
GO
ALTER TABLE [dbo].[FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_FACILITY_SITES] FOREIGN KEY([SiteID])
REFERENCES [dbo].[SITES] ([SiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FACILITY] CHECK CONSTRAINT [FK_FACILITY_SITES]
GO
ALTER TABLE [dbo].[FACILITY_RISK_TARGET]  WITH CHECK ADD  CONSTRAINT [FK_FACILITY_RISK_TARGET_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FACILITY_RISK_TARGET] CHECK CONSTRAINT [FK_FACILITY_RISK_TARGET_FACILITY]
GO
ALTER TABLE [dbo].[FILE_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_FILE_COMPONENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_COMPONENT] CHECK CONSTRAINT [FK_FILE_COMPONENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_FILE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] CHECK CONSTRAINT [FK_FILE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[FILE_FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_FILE_FACILITY_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_FACILITY] CHECK CONSTRAINT [FK_FILE_FACILITY_FACILITY]
GO
ALTER TABLE [dbo].[IM_TYPE]  WITH CHECK ADD  CONSTRAINT [FK_IM_TYPE_IM_ITEMS] FOREIGN KEY([IMItemID])
REFERENCES [dbo].[IM_ITEMS] ([IMItemID])
GO
ALTER TABLE [dbo].[IM_TYPE] CHECK CONSTRAINT [FK_IM_TYPE_IM_ITEMS]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_COMPONENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] CHECK CONSTRAINT [FK_IMAGE_COMPONENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] CHECK CONSTRAINT [FK_IMAGE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_FACILITY_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] CHECK CONSTRAINT [FK_IMAGE_FACILITY_FACILITY]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_INSPECTION_PLAN] FOREIGN KEY([PlanID])
REFERENCES [dbo].[INSPECTION_PLAN] ([PlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_INSPECTION_PLAN]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_DM_ITEMS]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_IM_TYPE]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_INSPECTION_COVERAGE] FOREIGN KEY([CoverageID])
REFERENCES [dbo].[INSPECTION_COVERAGE] ([CoverageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_INSPECTION_COVERAGE]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_INSPECTION_COVERAGE] FOREIGN KEY([CoverageID])
REFERENCES [dbo].[INSPECTION_COVERAGE] ([CoverageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_INSPECTION_COVERAGE]
GO
ALTER TABLE [dbo].[POINTS]  WITH CHECK ADD  CONSTRAINT [FK_POINTS_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POINTS] CHECK CONSTRAINT [FK_POINTS_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[RW_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_ASSESSMENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_ASSESSMENT] CHECK CONSTRAINT [FK_RW_ASSESSMENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[RW_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_ASSESSMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
GO
ALTER TABLE [dbo].[RW_ASSESSMENT] CHECK CONSTRAINT [FK_RW_ASSESSMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[RW_CF_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_RW_CF_MASTER_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_CF_MASTER] CHECK CONSTRAINT [FK_RW_CF_MASTER_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_COATING]  WITH CHECK ADD  CONSTRAINT [FK_RW_COATING_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_COATING] CHECK CONSTRAINT [FK_RW_COATING_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_COMPONENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_COMPONENT] CHECK CONSTRAINT [FK_RW_COMPONENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK]  WITH CHECK ADD  CONSTRAINT [FK_RW_CORROSION_RATE_TANK_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK] CHECK CONSTRAINT [FK_RW_CORROSION_RATE_TANK_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM]  WITH CHECK ADD  CONSTRAINT [FK_RW_DAMAGE_MECHANISM_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM] CHECK CONSTRAINT [FK_RW_DAMAGE_MECHANISM_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM]  WITH CHECK ADD  CONSTRAINT [FK_RW_DAMAGE_MECHANISM_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM] CHECK CONSTRAINT [FK_RW_DAMAGE_MECHANISM_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_EQUIPMENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EQUIPMENT] CHECK CONSTRAINT [FK_RW_EQUIPMENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EXTCOR_TEMPERATURE]  WITH CHECK ADD  CONSTRAINT [FK_RW_EXTCOR_TEMPERATURE_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EXTCOR_TEMPERATURE] CHECK CONSTRAINT [FK_RW_EXTCOR_TEMPERATURE_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS]  WITH CHECK ADD  CONSTRAINT [FK_RW_EXTRA_FIELDS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] CHECK CONSTRAINT [FK_RW_EXTRA_FIELDS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF] CHECK CONSTRAINT [FK_RW_FULL_COF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] CHECK CONSTRAINT [FK_RW_FULL_COF_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_HOLE_SIZE_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] CHECK CONSTRAINT [FK_RW_FULL_COF_HOLE_SIZE_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_INPUT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] CHECK CONSTRAINT [FK_RW_FULL_COF_INPUT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_TANK_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] CHECK CONSTRAINT [FK_RW_FULL_COF_TANK_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_FCOF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_FCOF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_FCOF] CHECK CONSTRAINT [FK_RW_FULL_FCOF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_POF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_POF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_POF] CHECK CONSTRAINT [FK_RW_FULL_POF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_DETAIL_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] CHECK CONSTRAINT [FK_RW_LF_DETAIL_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_DETAIL_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] CHECK CONSTRAINT [FK_RW_LF_DETAIL_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_LF_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_MASTER_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_LF_MASTER] CHECK CONSTRAINT [FK_RW_LF_MASTER_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_RW_MATERIAL_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_MATERIAL] CHECK CONSTRAINT [FK_RW_MATERIAL_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_POINTS]  WITH CHECK ADD  CONSTRAINT [FK_RW_POINTS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_POINTS] CHECK CONSTRAINT [FK_RW_POINTS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRIMARY_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] CHECK CONSTRAINT [FK_RW_PRIMARY_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_IM_TYPE]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_RISK_GRAPH]  WITH CHECK ADD  CONSTRAINT [FK_RW_RISK_GRAPH_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_RISK_GRAPH] CHECK CONSTRAINT [FK_RW_RISK_GRAPH_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET]  WITH CHECK ADD  CONSTRAINT [FK_RW_RISK_TARGET_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] CHECK CONSTRAINT [FK_RW_RISK_TARGET_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR]  WITH CHECK ADD  CONSTRAINT [FK_RW_SAFETY_FACTOR_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] CHECK CONSTRAINT [FK_RW_SAFETY_FACTOR_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_SECONDARY_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] CHECK CONSTRAINT [FK_RW_SECONDARY_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_STREAM]  WITH CHECK ADD  CONSTRAINT [FK_RW_STREAM_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_STREAM] CHECK CONSTRAINT [FK_RW_STREAM_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_THICKNESS]  WITH CHECK ADD  CONSTRAINT [FK_RW_THICKNESS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
GO
ALTER TABLE [dbo].[RW_THICKNESS] CHECK CONSTRAINT [FK_RW_THICKNESS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_THICKNESS]  WITH CHECK ADD  CONSTRAINT [FK_RW_THICKNESS_RW_POINTS] FOREIGN KEY([PointID])
REFERENCES [dbo].[RW_POINTS] ([PointID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_THICKNESS] CHECK CONSTRAINT [FK_RW_THICKNESS_RW_POINTS]
GO
ALTER TABLE [dbo].[THICKNESS_READING]  WITH CHECK ADD  CONSTRAINT [FK_THICKNESS_READING_POINTS] FOREIGN KEY([PointID])
REFERENCES [dbo].[POINTS] ([PointID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[THICKNESS_READING] CHECK CONSTRAINT [FK_THICKNESS_READING_POINTS]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_USER_PERMISSIONS_USERS] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] CHECK CONSTRAINT [FK_USER_PERMISSIONS_USERS]
GO
/****** Object:  StoredProcedure [dbo].[RS_GetIDValue]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RS_GetIDValue] @table_nm varchar(75), @entity_id int, @NextID INT OUTPUT AS BEGIN SET @NextID = NULL IF @entity_id IS NOT NULL BEGIN SET @NextID = (SELECT id_num FROM IDValue WHERE table_nm = @table_nm AND entity_id=@entity_id); UPDATE IDValue SET id_num = ISNULL(@NextID+1, 1) WHERE table_nm = @table_nm AND entity_id=@entity_id; END ELSE BEGIN SET @NextID = (SELECT id_num FROM IDValue WHERE table_nm = @table_nm AND entity_id IS NULL); UPDATE IDValue SET id_num = ISNULL(@NextID+1, 1) WHERE table_nm = @table_nm AND entity_id IS NULL; END END
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateAction]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateAction]( @ACTIONID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateCSI]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateCSI]( @CSIID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateFA]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateFA]( @FAID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateIncident]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateIncident]( @INCIDENTID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateProblem]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateProblem]( @PROBLEMID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASAfterCreateProject]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASAfterCreateProject]( @PROJECTID INT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @RETURN_VALUE = 0 END;
GO
/****** Object:  StoredProcedure [dbo].[XFRACASGetTimeMetrics]    Script Date: 12/13/2018 4:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XFRACASGetTimeMetrics]( @SN NVARCHAR(100), @TM1 FLOAT OUTPUT, @TM2 INT OUTPUT, @TM3 FLOAT OUTPUT, @RETURN_VALUE INT OUTPUT ) AS BEGIN	SET @TM1 = 0	SET @TM2 = 0	SET @TM3 = 0	SET @RETURN_VALUE = 0 END;
GO
USE [master]
GO
ALTER DATABASE [rbi] SET  READ_WRITE 
GO
