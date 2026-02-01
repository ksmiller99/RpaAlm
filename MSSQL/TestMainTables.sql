-- =============================================
-- Comprehensive Test Script for Main Table CRUD Procedures
-- Main Tables (8 tables, 40 procedures)
-- =============================================
-- This script tests all CRUD operations for each main table:
-- Insert -> GetByID -> GetAll -> Update -> GetByID (verify) -> Delete -> GetByID (verify empty)
-- =============================================

USE RpaAlmDev;
GO

PRINT '========================================';
PRINT 'Starting Main Table CRUD Procedure Tests';
PRINT 'Testing 8 Main Tables (40 Procedures)';
PRINT '========================================';
PRINT '';

-- =============================================
-- Create Prerequisite Lookup/Helper Records
-- =============================================
PRINT 'Creating prerequisite lookup and helper data...';

-- RpaStatusType
DECLARE @RpaStatusID INT;
EXEC sp_InsertRpaStatusType
    @Code = 'ACTIVE',
    @Description = 'Active Automation',
    @NewID = @RpaStatusID OUTPUT;
PRINT 'Created RpaStatusType: ' + CAST(@RpaStatusID AS VARCHAR);

-- SegmentType
DECLARE @SegmentID INT;
EXEC sp_InsertSegmentType
    @Code = 'ENT',
    @Description = 'Enterprise Segment',
    @NewID = @SegmentID OUTPUT;
PRINT 'Created SegmentType: ' + CAST(@SegmentID AS VARCHAR);

-- RegionType
DECLARE @RegionID INT;
EXEC sp_InsertRegionType
    @Code = 'NA',
    @Description = 'North America',
    @NewID = @RegionID OUTPUT;
PRINT 'Created RegionType: ' + CAST(@RegionID AS VARCHAR);

-- FunctionType
DECLARE @FunctionID INT;
EXEC sp_InsertFunctionType
    @Code = 'FIN',
    @Description = 'Finance Function',
    @NewID = @FunctionID OUTPUT;
PRINT 'Created FunctionType: ' + CAST(@FunctionID AS VARCHAR);

-- JjedsHelper
DECLARE @JjedsID INT;
EXEC sp_InsertJjedsHelper
    @WWID = '999999999',
    @CommonName = 'Test Employee',
    @Email = 'test@example.com',
    @JjedsCreated = '2026-01-01',
    @JjedsLastChanged = '2026-01-01',
    @NewID = @JjedsID OUTPUT;
PRINT 'Created JjedsHelper: ' + CAST(@JjedsID AS VARCHAR);

-- CmdbHelper
DECLARE @CmdbID INT;
EXEC sp_InsertCmdbHelper
    @AppID = 'APP001',
    @Name = 'Test Application',
    @Zcode = 'Z12345',
    @OperationalStatus = 'Active',
    @CmdbUpdated = '2026-01-01',
    @NewID = @CmdbID OUTPUT;
PRINT 'Created CmdbHelper: ' + CAST(@CmdbID AS VARCHAR);

-- Enhancement
DECLARE @EnhancementID INT;
EXEC sp_InsertEnhancement
    @Scope = 'Test Enhancement - UI Improvements',
    @NewID = @EnhancementID OUTPUT;
PRINT 'Created Enhancement: ' + CAST(@EnhancementID AS VARCHAR);

-- SlaItemType
DECLARE @SlaItemTypeID INT;
EXEC sp_InsertSlaItemType
    @Name = 'Test SLA Item',
    @Description = 'Test SLA Item Description',
    @Cost = 1000.00,
    @EffectiveDate = '2026-01-01',
    @Disabled = 0,
    @NewID = @SlaItemTypeID OUTPUT;
PRINT 'Created SlaItemType: ' + CAST(@SlaItemTypeID AS VARCHAR);

-- ComplexityType
DECLARE @ComplexityID INT;
EXEC sp_InsertComplexityType
    @Code = 'MEDIUM',
    @Description = 'Medium Complexity',
    @NewID = @ComplexityID OUTPUT;
PRINT 'Created ComplexityType: ' + CAST(@ComplexityID AS VARCHAR);

-- MedalType
DECLARE @MedalID INT;
EXEC sp_InsertMedalType
    @Code = 'GOLD',
    @Description = 'Gold Medal Performance',
    @NewID = @MedalID OUTPUT;
PRINT 'Created MedalType: ' + CAST(@MedalID AS VARCHAR);

-- SlaSignatureStatusType
DECLARE @SignatureStatusID INT;
EXEC sp_InsertSlaSignatureStatusType
    @Code = 'PENDING',
    @Description = 'Pending Signature',
    @NewID = @SignatureStatusID OUTPUT;
PRINT 'Created SlaSignatureStatusType: ' + CAST(@SignatureStatusID AS VARCHAR);

-- AutomationEnvironmentType
DECLARE @EnvironmentTypeID INT;
EXEC sp_InsertAutomationEnvironmentType
    @Code = 'PROD',
    @Description = 'Production Environment',
    @NewID = @EnvironmentTypeID OUTPUT;
PRINT 'Created AutomationEnvironmentType: ' + CAST(@EnvironmentTypeID AS VARCHAR);

-- AdDomainType
DECLARE @AdDomainID INT;
EXEC sp_InsertAdDomainType
    @Code = 'CORP',
    @Description = 'Corporate Domain',
    @NewID = @AdDomainID OUTPUT;
PRINT 'Created AdDomainType: ' + CAST(@AdDomainID AS VARCHAR);

PRINT 'Prerequisite data created successfully';
PRINT '';

-- =============================================
-- 1. Automation Tests
-- =============================================
PRINT 'Testing Automation procedures...';
DECLARE @AutomationID INT;

EXEC sp_InsertAutomation
    @Name = 'Test Automation - Invoice Processing',
    @SegmentID = @SegmentID,
    @RegionID = @RegionID,
    @FunctionID = @FunctionID,
    @RpaStatusID = @RpaStatusID,
    @BtoJjedsID = @JjedsID,
    @BoJjedsID = @JjedsID,
    @FcJjedsID = @JjedsID,
    @SseJjedsID = @JjedsID,
    @LseJjedsID = @JjedsID,
    @NewID = @AutomationID OUTPUT;
PRINT 'Insert: ' + CAST(@AutomationID AS VARCHAR);

EXEC sp_GetByIDAutomation @AutomationID;
EXEC sp_GetAllAutomation;

EXEC sp_UpdateAutomation
    @ID = @AutomationID,
    @Name = 'Test Automation - Invoice Processing Updated',
    @SegmentID = @SegmentID,
    @RegionID = @RegionID,
    @FunctionID = @FunctionID,
    @RpaStatusID = @RpaStatusID,
    @BtoJjedsID = @JjedsID,
    @BoJjedsID = @JjedsID,
    @FcJjedsID = @JjedsID,
    @SseJjedsID = @JjedsID,
    @LseJjedsID = @JjedsID;

EXEC sp_GetByIDAutomation @AutomationID;

-- Note: We cannot delete Automation yet as it will be referenced by other tables
PRINT 'Automation tests complete (delete deferred due to FK dependencies)';
PRINT '';

-- =============================================
-- 2. AutomationEnvironment Tests
-- =============================================
PRINT 'Testing AutomationEnvironment procedures...';
DECLARE @AutomationEnvironmentID INT;

EXEC sp_InsertAutomationEnvironment
    @AutomationID = @AutomationID,
    @CmdbID = @CmdbID,
    @EnvironmentTypeID = @EnvironmentTypeID,
    @NewID = @AutomationEnvironmentID OUTPUT;
PRINT 'Insert: ' + CAST(@AutomationEnvironmentID AS VARCHAR);

EXEC sp_GetByIDAutomationEnvironment @AutomationEnvironmentID;
EXEC sp_GetAllAutomationEnvironment;

EXEC sp_UpdateAutomationEnvironment
    @ID = @AutomationEnvironmentID,
    @AutomationID = @AutomationID,
    @CmdbID = @CmdbID,
    @EnvironmentTypeID = @EnvironmentTypeID;

EXEC sp_GetByIDAutomationEnvironment @AutomationEnvironmentID;

-- Note: We cannot delete AutomationEnvironment yet as it may be referenced by ViAssignments
PRINT 'AutomationEnvironment tests complete (delete deferred due to FK dependencies)';
PRINT '';

-- =============================================
-- 3. AutomationLogEntry Tests
-- =============================================
PRINT 'Testing AutomationLogEntry procedures...';
DECLARE @AutomationLogEntryID INT;

EXEC sp_InsertAutomationLogEntry
    @AutomationID = @AutomationID,
    @CreatedJjedsID = @JjedsID,
    @CreatedDate = '2026-01-15',
    @Comment = 'Initial automation setup completed. All components tested and verified.',
    @NewID = @AutomationLogEntryID OUTPUT;
PRINT 'Insert: ' + CAST(@AutomationLogEntryID AS VARCHAR);

EXEC sp_GetByIDAutomationLogEntry @AutomationLogEntryID;
EXEC sp_GetAllAutomationLogEntry;

EXEC sp_UpdateAutomationLogEntry
    @ID = @AutomationLogEntryID,
    @AutomationID = @AutomationID,
    @CreatedJjedsID = @JjedsID,
    @CreatedDate = '2026-01-20',
    @Comment = 'Automation updated with performance improvements. Response time reduced by 30%.';

EXEC sp_GetByIDAutomationLogEntry @AutomationLogEntryID;

EXEC sp_DeleteAutomationLogEntry @AutomationLogEntryID;
EXEC sp_GetByIDAutomationLogEntry @AutomationLogEntryID;

PRINT 'AutomationLogEntry tests complete';
PRINT '';

-- =============================================
-- 4. EnhancementUserStory Tests
-- =============================================
PRINT 'Testing EnhancementUserStory procedures...';
DECLARE @EnhancementUserStoryID INT;

EXEC sp_InsertEnhancementUserStory
    @EnhancementID = @EnhancementID,
    @JiraIssue = 'RPA-1234',
    @JiraIssueDate = '2026-01-10 09:30:00',
    @StoryPoints = 8,
    @JiraIssueLink = 'https://jira.example.com/browse/RPA-1234',
    @JiraIssueSummary = 'Implement dashboard UI improvements for better user experience',
    @JiraIssueCost = 12500.00,
    @NewID = @EnhancementUserStoryID OUTPUT;
PRINT 'Insert: ' + CAST(@EnhancementUserStoryID AS VARCHAR);

EXEC sp_GetByIDEnhancementUserStory @EnhancementUserStoryID;
EXEC sp_GetAllEnhancementUserStory;

EXEC sp_UpdateEnhancementUserStory
    @ID = @EnhancementUserStoryID,
    @EnhancementID = @EnhancementID,
    @JiraIssue = 'RPA-1234',
    @JiraIssueDate = '2026-01-10 09:30:00',
    @StoryPoints = 13,
    @JiraIssueLink = 'https://jira.example.com/browse/RPA-1234',
    @JiraIssueSummary = 'Implement dashboard UI improvements for better user experience - Expanded scope',
    @JiraIssueCost = 18750.00;

EXEC sp_GetByIDEnhancementUserStory @EnhancementUserStoryID;

-- Note: We cannot delete EnhancementUserStory yet as it may be referenced by SlaItem
PRINT 'EnhancementUserStory tests complete (delete deferred due to FK dependencies)';
PRINT '';

-- =============================================
-- 5. SlaMaster Tests
-- =============================================
PRINT 'Testing SlaMaster procedures...';
DECLARE @SlaMasterID INT;

EXEC sp_InsertSlaMaster
    @AutomationID = @AutomationID,
    @ComplexityTypeID = @ComplexityID,
    @MedalID = @MedalID,
    @Zcode = 'Z12345',
    @CostCenter = 'CC-8900',
    @StartDate = '2026-01-01',
    @EndDate = '2026-12-31',
    @BtoJjedsId = @JjedsID,
    @BoJjedsId = @JjedsID,
    @FcJjedsId = @JjedsID,
    @SignatureStatus = @SignatureStatusID,
    @SignatureStatusDate = '2026-01-05 14:30:00',
    @NewID = @SlaMasterID OUTPUT;
PRINT 'Insert: ' + CAST(@SlaMasterID AS VARCHAR);

EXEC sp_GetByIDSlaMaster @SlaMasterID;
EXEC sp_GetAllSlaMaster;

EXEC sp_UpdateSlaMaster
    @ID = @SlaMasterID,
    @AutomationID = @AutomationID,
    @ComplexityTypeID = @ComplexityID,
    @MedalID = @MedalID,
    @Zcode = 'Z12345',
    @CostCenter = 'CC-8900',
    @StartDate = '2026-01-01',
    @EndDate = '2027-12-31',
    @BtoJjedsId = @JjedsID,
    @BoJjedsId = @JjedsID,
    @FcJjedsId = @JjedsID,
    @SignatureStatus = @SignatureStatusID,
    @SignatureStatusDate = '2026-01-05 14:30:00';

EXEC sp_GetByIDSlaMaster @SlaMasterID;

-- Note: We cannot delete SlaMaster yet as it will be referenced by SlaItem
PRINT 'SlaMaster tests complete (delete deferred due to FK dependencies)';
PRINT '';

-- =============================================
-- 6. SlaItem Tests
-- =============================================
PRINT 'Testing SlaItem procedures...';
DECLARE @SlaItemID INT;

EXEC sp_InsertSlaItem
    @SlaMasterID = @SlaMasterID,
    @SlaItemTypeID = @SlaItemTypeID,
    @EnhancementID = @EnhancementID,
    @Quantity = 5,
    @Cost = 1000.00,
    @Total = 5000.00,
    @NewID = @SlaItemID OUTPUT;
PRINT 'Insert: ' + CAST(@SlaItemID AS VARCHAR);

EXEC sp_GetByIDSlaItem @SlaItemID;
EXEC sp_GetAllSlaItem;

EXEC sp_UpdateSlaItem
    @ID = @SlaItemID,
    @SlaMasterID = @SlaMasterID,
    @SlaItemTypeID = @SlaItemTypeID,
    @EnhancementID = @EnhancementID,
    @Quantity = 8,
    @Cost = 1000.00,
    @Total = 8000.00;

EXEC sp_GetByIDSlaItem @SlaItemID;

EXEC sp_DeleteSlaItem @SlaItemID;
EXEC sp_GetByIDSlaItem @SlaItemID;

PRINT 'SlaItem tests complete';
PRINT '';

-- =============================================
-- 7. SlaLogEntry Tests
-- =============================================
PRINT 'Testing SlaLogEntry procedures...';
DECLARE @SlaLogEntryID INT;

EXEC sp_InsertSlaLogEntry
    @SlaMasterID = @SlaMasterID,
    @CreatedJjedsID = @JjedsID,
    @CreatedDate = '2026-01-15',
    @Comment = 'SLA agreement finalized and signed by all parties. Effective immediately.',
    @NewID = @SlaLogEntryID OUTPUT;
PRINT 'Insert: ' + CAST(@SlaLogEntryID AS VARCHAR);

EXEC sp_GetByIDSlaLogEntry @SlaLogEntryID;
EXEC sp_GetAllSlaLogEntry;

EXEC sp_UpdateSlaLogEntry
    @ID = @SlaLogEntryID,
    @SlaMasterID = @SlaMasterID,
    @CreatedJjedsID = @JjedsID,
    @CreatedDate = '2026-01-20',
    @Comment = 'SLA amendment requested due to scope change. Pending approval.';

EXEC sp_GetByIDSlaLogEntry @SlaLogEntryID;

EXEC sp_DeleteSlaLogEntry @SlaLogEntryID;
EXEC sp_GetByIDSlaLogEntry @SlaLogEntryID;

PRINT 'SlaLogEntry tests complete';
PRINT '';

-- =============================================
-- 8. VirtualIdentity Tests
-- =============================================
PRINT 'Testing VirtualIdentity procedures...';
DECLARE @VirtualIdentityID INT;

EXEC sp_InsertVirtualIdentity
    @JjedsID = @JjedsID,
    @AdDomainID = @AdDomainID,
    @HostName = 'RPABOTPRD01',
    @IPv4 = '192.168.100.50',
    @Created = '2026-01-01',
    @Retired = '2099-12-31',
    @NewID = @VirtualIdentityID OUTPUT;
PRINT 'Insert: ' + CAST(@VirtualIdentityID AS VARCHAR);

EXEC sp_GetByIDVirtualIdentity @VirtualIdentityID;
EXEC sp_GetAllVirtualIdentity;

EXEC sp_UpdateVirtualIdentity
    @ID = @VirtualIdentityID,
    @JjedsID = @JjedsID,
    @AdDomainID = @AdDomainID,
    @HostName = 'RPABOTPRD02',
    @IPv4 = '192.168.100.51',
    @Created = '2026-01-01',
    @Retired = '2099-12-31';

EXEC sp_GetByIDVirtualIdentity @VirtualIdentityID;

EXEC sp_DeleteVirtualIdentity @VirtualIdentityID;
EXEC sp_GetByIDVirtualIdentity @VirtualIdentityID;

PRINT 'VirtualIdentity tests complete';
PRINT '';

-- =============================================
-- Clean up FK-dependent records (reverse order)
-- =============================================
PRINT 'Cleaning up FK-dependent test data...';

EXEC sp_DeleteSlaMaster @SlaMasterID;
PRINT 'Deleted SlaMaster: ' + CAST(@SlaMasterID AS VARCHAR);

EXEC sp_DeleteEnhancementUserStory @EnhancementUserStoryID;
PRINT 'Deleted EnhancementUserStory: ' + CAST(@EnhancementUserStoryID AS VARCHAR);

EXEC sp_DeleteAutomationEnvironment @AutomationEnvironmentID;
PRINT 'Deleted AutomationEnvironment: ' + CAST(@AutomationEnvironmentID AS VARCHAR);

EXEC sp_DeleteAutomation @AutomationID;
PRINT 'Deleted Automation: ' + CAST(@AutomationID AS VARCHAR);

-- Clean up prerequisite lookup/helper records
EXEC sp_DeleteAdDomainType @AdDomainID;
EXEC sp_DeleteAutomationEnvironmentType @EnvironmentTypeID;
EXEC sp_DeleteSlaSignatureStatusType @SignatureStatusID;
EXEC sp_DeleteMedalType @MedalID;
EXEC sp_DeleteComplexityType @ComplexityID;
EXEC sp_DeleteSlaItemType @SlaItemTypeID;
EXEC sp_DeleteEnhancement @EnhancementID;
EXEC sp_DeleteCmdbHelper @CmdbID;
EXEC sp_DeleteJjedsHelper @JjedsID;
EXEC sp_DeleteFunctionType @FunctionID;
EXEC sp_DeleteRegionType @RegionID;
EXEC sp_DeleteSegmentType @SegmentID;
EXEC sp_DeleteRpaStatusType @RpaStatusID;

PRINT 'Prerequisite data cleanup complete';
PRINT '';

-- =============================================
-- Test Summary
-- =============================================
PRINT '========================================';
PRINT 'All Main Table Tests Complete!';
PRINT '8 tables tested';
PRINT '40 stored procedures tested';
PRINT '========================================';
