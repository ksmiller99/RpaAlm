-- =============================================
-- Fix Failed Indexes - RpaDataDev
-- =============================================

USE RpaDataDev;
GO

SET QUOTED_IDENTIFIER ON;
GO

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

PRINT 'All indexes created successfully.';
GO
