-- =============================================
-- RpaDataDev Database Creation Script
-- Generated from ERD
-- =============================================

-- Create Database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'RpaDataDev')
BEGIN
    CREATE DATABASE RpaDataDev;
END
GO

USE RpaDataDev;
GO

-- =============================================
-- LOOKUP / REFERENCE TABLES (No Dependencies)
-- =============================================

-- SlaItemType
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlaItemType]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[SlaItemType] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Name] NVARCHAR(255) NULL,
        [Description] NVARCHAR(MAX) NULL,
        [Cost] INT NULL,
        [Disabled] INT NULL,
        CONSTRAINT [PK_SlaItemType] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Enhancement
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enhancement]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Enhancement] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Scope] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Enhancement] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Complexity
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Complexity]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Complexity] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Complexity] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Medal
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medal]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Medal] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Name] NVARCHAR(255) NULL,
        [Description] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_Medal] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Function
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Function]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Function] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Region
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Region] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Segment
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Segment]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Segment] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- Status
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Status] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- AutomationEnvironmentType
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutomationEnvironmentType]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AutomationEnvironmentType] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Code] NVARCHAR(50) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_AutomationEnvironmentType] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- ADDomain
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADDomain]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[ADDomain] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Domain] NVARCHAR(255) NULL,
        [Description] NVARCHAR(255) NULL,
        CONSTRAINT [PK_ADDomain] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- StoryPointCost
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoryPointCost]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[StoryPointCost] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Points] INT NULL,
        [MaxHours] INT NULL,
        [TotalCost] INT NULL,
        [JnJCostShare] INT NULL,
        [EffectiveDate] DATE NULL,
        CONSTRAINT [PK_StoryPointCost] PRIMARY KEY CLUSTERED ([ID] ASC)
    );
END
GO

-- JjedsHelper (WWID is the primary key)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JjedsHelper]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[JjedsHelper] (
        [WWID] NVARCHAR(9) NOT NULL,
        [CommonName] NVARCHAR(255) NULL,
        [Email] NVARCHAR(255) NULL,
        [JjedsCreated] DATE NULL,
        [JjedsLastChanged] DATE NULL,
        CONSTRAINT [PK_JjedsHelper] PRIMARY KEY CLUSTERED ([WWID] ASC)
    );
END
GO

-- CmdbHelper (AppID is the primary key)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CmdbHelper]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[CmdbHelper] (
        [AppID] NVARCHAR(50) NOT NULL,
        [Name] NVARCHAR(255) NULL,
        [Zcode] NVARCHAR(50) NULL,
        CONSTRAINT [PK_CmdbHelper] PRIMARY KEY CLUSTERED ([AppID] ASC)
    );
END
GO

-- =============================================
-- MAIN ENTITY TABLES
-- =============================================

-- Automation (references multiple lookup tables and JjedsHelper)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automation]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Automation] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [Name] NVARCHAR(255) NULL,
        [SegmentID] INT NULL,
        [RegionID] INT NULL,
        [FunctionID] INT NULL,
        [StatusID] INT NULL,
        [BtoWWID] NVARCHAR(9) NULL,
        [BoWWID] NVARCHAR(9) NULL,
        [FcWWID] NVARCHAR(9) NULL,
        [BuildZcode] NVARCHAR(50) NULL,
        [BuildCostCenter] NVARCHAR(50) NULL,
        [SseWWID] NVARCHAR(9) NULL,
        [LseWWID] NVARCHAR(9) NULL,
        CONSTRAINT [PK_Automation] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_Automation_Segment] FOREIGN KEY ([SegmentID]) REFERENCES [dbo].[Segment]([ID]),
        CONSTRAINT [FK_Automation_Region] FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Region]([ID]),
        CONSTRAINT [FK_Automation_Function] FOREIGN KEY ([FunctionID]) REFERENCES [dbo].[Function]([ID]),
        CONSTRAINT [FK_Automation_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status]([ID]),
        CONSTRAINT [FK_Automation_BtoWWID] FOREIGN KEY ([BtoWWID]) REFERENCES [dbo].[JjedsHelper]([WWID]),
        CONSTRAINT [FK_Automation_BoWWID] FOREIGN KEY ([BoWWID]) REFERENCES [dbo].[JjedsHelper]([WWID]),
        CONSTRAINT [FK_Automation_FcWWID] FOREIGN KEY ([FcWWID]) REFERENCES [dbo].[JjedsHelper]([WWID]),
        CONSTRAINT [FK_Automation_SseWWID] FOREIGN KEY ([SseWWID]) REFERENCES [dbo].[JjedsHelper]([WWID]),
        CONSTRAINT [FK_Automation_LseWWID] FOREIGN KEY ([LseWWID]) REFERENCES [dbo].[JjedsHelper]([WWID])
    );
END
GO

-- SlaMaster (references Automation, Complexity, Medal)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlaMaster]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[SlaMaster] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [AutomationID] INT NULL,
        [ComplexityID] INT NULL,
        [MedalID] INT NULL,
        [Zcode] NVARCHAR(50) NULL,
        [CostCenter] NVARCHAR(50) NULL,
        [StartDate] DATE NULL,
        [EndDate] DATE NULL,
        CONSTRAINT [PK_SlaMaster] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_SlaMaster_Automation] FOREIGN KEY ([AutomationID]) REFERENCES [dbo].[Automation]([ID]),
        CONSTRAINT [FK_SlaMaster_Complexity] FOREIGN KEY ([ComplexityID]) REFERENCES [dbo].[Complexity]([ID]),
        CONSTRAINT [FK_SlaMaster_Medal] FOREIGN KEY ([MedalID]) REFERENCES [dbo].[Medal]([ID])
    );
END
GO

-- SlaItem (references SlaMaster, SlaItemType, Enhancement)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlaItem]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[SlaItem] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [SlaMasterID] INT NULL,
        [SlaItemTypeID] INT NULL,
        [EnhancementID] INT NULL,
        CONSTRAINT [PK_SlaItem] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_SlaItem_SlaMaster] FOREIGN KEY ([SlaMasterID]) REFERENCES [dbo].[SlaMaster]([ID]),
        CONSTRAINT [FK_SlaItem_SlaItemType] FOREIGN KEY ([SlaItemTypeID]) REFERENCES [dbo].[SlaItemType]([ID]),
        CONSTRAINT [FK_SlaItem_Enhancement] FOREIGN KEY ([EnhancementID]) REFERENCES [dbo].[Enhancement]([ID])
    );
END
GO

-- EnhancementUserStory (references Enhancement, StoryPointCost)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnhancementUserStory]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[EnhancementUserStory] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [EnhancementID] INT NULL,
        [JiraIssue] NVARCHAR(50) NULL,
        [StoryPoints] INT NULL,
        [JiraIssueLink] NVARCHAR(500) NULL,
        [JiraIssueSummary] NVARCHAR(MAX) NULL,
        [StoryPointCostID] INT NULL,
        CONSTRAINT [PK_EnhancementUserStory] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_EnhancementUserStory_Enhancement] FOREIGN KEY ([EnhancementID]) REFERENCES [dbo].[Enhancement]([ID]),
        CONSTRAINT [FK_EnhancementUserStory_StoryPointCost] FOREIGN KEY ([StoryPointCostID]) REFERENCES [dbo].[StoryPointCost]([ID])
    );
END
GO

-- AutomationLogEntry (references Automation, JjedsHelper)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutomationLogEntry]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AutomationLogEntry] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [AutomationID] INT NULL,
        [CreatedWWID] NVARCHAR(9) NULL,
        [CreatedDate] DATE NULL,
        [Comment] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_AutomationLogEntry] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_AutomationLogEntry_Automation] FOREIGN KEY ([AutomationID]) REFERENCES [dbo].[Automation]([ID]),
        CONSTRAINT [FK_AutomationLogEntry_JjedsHelper] FOREIGN KEY ([CreatedWWID]) REFERENCES [dbo].[JjedsHelper]([WWID])
    );
END
GO

-- SlaLogEntry (references SlaMaster, JjedsHelper)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlaLogEntry]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[SlaLogEntry] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [SlaMasterID] INT NULL,
        [CreatedWWID] NVARCHAR(9) NULL,
        [CreatedDate] DATE NULL,
        [Comment] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_SlaLogEntry] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_SlaLogEntry_SlaMaster] FOREIGN KEY ([SlaMasterID]) REFERENCES [dbo].[SlaMaster]([ID]),
        CONSTRAINT [FK_SlaLogEntry_JjedsHelper] FOREIGN KEY ([CreatedWWID]) REFERENCES [dbo].[JjedsHelper]([WWID])
    );
END
GO

-- VirtualIdentity (references JjedsHelper, ADDomain)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VirtualIdentity]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[VirtualIdentity] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [AccountName] NVARCHAR(255) NULL,
        [HostName] NVARCHAR(255) NULL,
        [WWID] NVARCHAR(9) NULL,
        [IPv4] NCHAR(15) NULL,
        [ADDomainID] INT NULL,
        [Email] NVARCHAR(255) NULL,
        [Created] DATE NULL,
        [Retired] DATE NULL,
        CONSTRAINT [PK_VirtualIdentity] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_VirtualIdentity_JjedsHelper] FOREIGN KEY ([WWID]) REFERENCES [dbo].[JjedsHelper]([WWID]),
        CONSTRAINT [FK_VirtualIdentity_ADDomain] FOREIGN KEY ([ADDomainID]) REFERENCES [dbo].[ADDomain]([ID])
    );
END
GO

-- AutomationEnvironment (references Automation, CmdbHelper, AutomationEnvironmentType)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AutomationEnvironment]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AutomationEnvironment] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [AutomationID] INT NULL,
        [AppID] NVARCHAR(50) NULL,
        [EnvironmentTypeID] INT NULL,
        CONSTRAINT [PK_AutomationEnvironment] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_AutomationEnvironment_Automation] FOREIGN KEY ([AutomationID]) REFERENCES [dbo].[Automation]([ID]),
        CONSTRAINT [FK_AutomationEnvironment_CmdbHelper] FOREIGN KEY ([AppID]) REFERENCES [dbo].[CmdbHelper]([AppID]),
        CONSTRAINT [FK_AutomationEnvironment_EnvironmentType] FOREIGN KEY ([EnvironmentTypeID]) REFERENCES [dbo].[AutomationEnvironmentType]([ID])
    );
END
GO

-- =============================================
-- JUNCTION / BRIDGE TABLES
-- =============================================

-- ViAssignments (references VirtualIdentity, AutomationEnvironment)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViAssignments]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[ViAssignments] (
        [ID] INT IDENTITY(1,1) NOT NULL,
        [VirtualIdentityID] INT NULL,
        [AutomationEnvironmentID] INT NULL,
        [Percentage] INT NULL,
        [StartDate] DATE NULL,
        [EndDate] DATE NULL,
        CONSTRAINT [PK_ViAssignments] PRIMARY KEY CLUSTERED ([ID] ASC),
        CONSTRAINT [FK_ViAssignments_VirtualIdentity] FOREIGN KEY ([VirtualIdentityID]) REFERENCES [dbo].[VirtualIdentity]([ID]),
        CONSTRAINT [FK_ViAssignments_AutomationEnvironment] FOREIGN KEY ([AutomationEnvironmentID]) REFERENCES [dbo].[AutomationEnvironment]([ID])
    );
END
GO

-- =============================================
-- CREATE INDEXES FOR FOREIGN KEYS
-- =============================================

-- Automation indexes
CREATE NONCLUSTERED INDEX [IX_Automation_SegmentID] ON [dbo].[Automation]([SegmentID]) WHERE [SegmentID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_Automation_RegionID] ON [dbo].[Automation]([RegionID]) WHERE [RegionID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_Automation_FunctionID] ON [dbo].[Automation]([FunctionID]) WHERE [FunctionID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_Automation_StatusID] ON [dbo].[Automation]([StatusID]) WHERE [StatusID] IS NOT NULL;
GO

-- SlaMaster indexes
CREATE NONCLUSTERED INDEX [IX_SlaMaster_AutomationID] ON [dbo].[SlaMaster]([AutomationID]) WHERE [AutomationID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_SlaMaster_ComplexityID] ON [dbo].[SlaMaster]([ComplexityID]) WHERE [ComplexityID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_SlaMaster_MedalID] ON [dbo].[SlaMaster]([MedalID]) WHERE [MedalID] IS NOT NULL;
GO

-- SlaItem indexes
CREATE NONCLUSTERED INDEX [IX_SlaItem_SlaMasterID] ON [dbo].[SlaItem]([SlaMasterID]) WHERE [SlaMasterID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_SlaItem_SlaItemTypeID] ON [dbo].[SlaItem]([SlaItemTypeID]) WHERE [SlaItemTypeID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_SlaItem_EnhancementID] ON [dbo].[SlaItem]([EnhancementID]) WHERE [EnhancementID] IS NOT NULL;
GO

-- EnhancementUserStory indexes
CREATE NONCLUSTERED INDEX [IX_EnhancementUserStory_EnhancementID] ON [dbo].[EnhancementUserStory]([EnhancementID]) WHERE [EnhancementID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_EnhancementUserStory_StoryPointCostID] ON [dbo].[EnhancementUserStory]([StoryPointCostID]) WHERE [StoryPointCostID] IS NOT NULL;
GO

-- AutomationLogEntry indexes
CREATE NONCLUSTERED INDEX [IX_AutomationLogEntry_AutomationID] ON [dbo].[AutomationLogEntry]([AutomationID]) WHERE [AutomationID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_AutomationLogEntry_CreatedWWID] ON [dbo].[AutomationLogEntry]([CreatedWWID]) WHERE [CreatedWWID] IS NOT NULL;
GO

-- SlaLogEntry indexes
CREATE NONCLUSTERED INDEX [IX_SlaLogEntry_SlaMasterID] ON [dbo].[SlaLogEntry]([SlaMasterID]) WHERE [SlaMasterID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_SlaLogEntry_CreatedWWID] ON [dbo].[SlaLogEntry]([CreatedWWID]) WHERE [CreatedWWID] IS NOT NULL;
GO

-- VirtualIdentity indexes
CREATE NONCLUSTERED INDEX [IX_VirtualIdentity_WWID] ON [dbo].[VirtualIdentity]([WWID]) WHERE [WWID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_VirtualIdentity_ADDomainID] ON [dbo].[VirtualIdentity]([ADDomainID]) WHERE [ADDomainID] IS NOT NULL;
GO

-- AutomationEnvironment indexes
CREATE NONCLUSTERED INDEX [IX_AutomationEnvironment_AutomationID] ON [dbo].[AutomationEnvironment]([AutomationID]) WHERE [AutomationID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_AutomationEnvironment_AppID] ON [dbo].[AutomationEnvironment]([AppID]) WHERE [AppID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_AutomationEnvironment_EnvironmentTypeID] ON [dbo].[AutomationEnvironment]([EnvironmentTypeID]) WHERE [EnvironmentTypeID] IS NOT NULL;
GO

-- ViAssignments indexes
CREATE NONCLUSTERED INDEX [IX_ViAssignments_VirtualIdentityID] ON [dbo].[ViAssignments]([VirtualIdentityID]) WHERE [VirtualIdentityID] IS NOT NULL;
CREATE NONCLUSTERED INDEX [IX_ViAssignments_AutomationEnvironmentID] ON [dbo].[ViAssignments]([AutomationEnvironmentID]) WHERE [AutomationEnvironmentID] IS NOT NULL;
GO

PRINT 'RpaDataDev database schema created successfully.';
GO
