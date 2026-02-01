-- =============================================
-- Comprehensive Test Script for CRUD Stored Procedures
-- Lookup Tables (12 tables, 60 procedures)
-- =============================================
-- This script tests all CRUD operations for each lookup table:
-- Insert -> GetByID -> GetAll -> Update -> GetByID (verify) -> Delete -> GetByID (verify empty)
-- =============================================

USE RpaAlmDev;
GO

PRINT '========================================';
PRINT 'Starting CRUD Procedure Tests';
PRINT 'Testing 12 Lookup Tables (60 Procedures)';
PRINT '========================================';
PRINT '';

-- =============================================
-- 1. AdDomainType Tests
-- =============================================
PRINT 'Testing AdDomainType procedures...';
DECLARE @AdDomainTypeID INT;

EXEC sp_InsertAdDomainType
    @Code = 'TEST',
    @Description = 'Test Domain',
    @NewID = @AdDomainTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@AdDomainTypeID AS VARCHAR);

EXEC sp_GetByIDAdDomainType @AdDomainTypeID;
EXEC sp_GetAllAdDomainType;

EXEC sp_UpdateAdDomainType
    @ID = @AdDomainTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Domain Updated';

EXEC sp_GetByIDAdDomainType @AdDomainTypeID;

EXEC sp_DeleteAdDomainType @AdDomainTypeID;
EXEC sp_GetByIDAdDomainType @AdDomainTypeID;

PRINT '✓ AdDomainType tests complete';
PRINT '';

-- =============================================
-- 2. AutomationEnvironmentType Tests
-- =============================================
PRINT 'Testing AutomationEnvironmentType procedures...';
DECLARE @AutomationEnvironmentTypeID INT;

EXEC sp_InsertAutomationEnvironmentType
    @Code = 'TEST',
    @Description = 'Test Environment',
    @NewID = @AutomationEnvironmentTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@AutomationEnvironmentTypeID AS VARCHAR);

EXEC sp_GetByIDAutomationEnvironmentType @AutomationEnvironmentTypeID;
EXEC sp_GetAllAutomationEnvironmentType;

EXEC sp_UpdateAutomationEnvironmentType
    @ID = @AutomationEnvironmentTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Environment Updated';

EXEC sp_GetByIDAutomationEnvironmentType @AutomationEnvironmentTypeID;

EXEC sp_DeleteAutomationEnvironmentType @AutomationEnvironmentTypeID;
EXEC sp_GetByIDAutomationEnvironmentType @AutomationEnvironmentTypeID;

PRINT '✓ AutomationEnvironmentType tests complete';
PRINT '';

-- =============================================
-- 3. ComplexityType Tests
-- =============================================
PRINT 'Testing ComplexityType procedures...';
DECLARE @ComplexityTypeID INT;

EXEC sp_InsertComplexityType
    @Code = 'TEST',
    @Description = 'Test Complexity Level',
    @NewID = @ComplexityTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@ComplexityTypeID AS VARCHAR);

EXEC sp_GetByIDComplexityType @ComplexityTypeID;
EXEC sp_GetAllComplexityType;

EXEC sp_UpdateComplexityType
    @ID = @ComplexityTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Complexity Level Updated';

EXEC sp_GetByIDComplexityType @ComplexityTypeID;

EXEC sp_DeleteComplexityType @ComplexityTypeID;
EXEC sp_GetByIDComplexityType @ComplexityTypeID;

PRINT '✓ ComplexityType tests complete';
PRINT '';

-- =============================================
-- 4. FunctionType Tests
-- =============================================
PRINT 'Testing FunctionType procedures...';
DECLARE @FunctionTypeID INT;

EXEC sp_InsertFunctionType
    @Code = 'TEST',
    @Description = 'Test Function Type',
    @NewID = @FunctionTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@FunctionTypeID AS VARCHAR);

EXEC sp_GetByIDFunctionType @FunctionTypeID;
EXEC sp_GetAllFunctionType;

EXEC sp_UpdateFunctionType
    @ID = @FunctionTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Function Type Updated';

EXEC sp_GetByIDFunctionType @FunctionTypeID;

EXEC sp_DeleteFunctionType @FunctionTypeID;
EXEC sp_GetByIDFunctionType @FunctionTypeID;

PRINT '✓ FunctionType tests complete';
PRINT '';

-- =============================================
-- 5. MedalType Tests
-- =============================================
PRINT 'Testing MedalType procedures...';
DECLARE @MedalTypeID INT;

EXEC sp_InsertMedalType
    @Code = 'TEST',
    @Description = 'Test Medal - Gold Level Performance',
    @NewID = @MedalTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@MedalTypeID AS VARCHAR);

EXEC sp_GetByIDMedalType @MedalTypeID;
EXEC sp_GetAllMedalType;

EXEC sp_UpdateMedalType
    @ID = @MedalTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Medal - Platinum Level Performance';

EXEC sp_GetByIDMedalType @MedalTypeID;

EXEC sp_DeleteMedalType @MedalTypeID;
EXEC sp_GetByIDMedalType @MedalTypeID;

PRINT '✓ MedalType tests complete';
PRINT '';

-- =============================================
-- 6. RegionType Tests
-- =============================================
PRINT 'Testing RegionType procedures...';
DECLARE @RegionTypeID INT;

EXEC sp_InsertRegionType
    @Code = 'TEST',
    @Description = 'Test Region - North America',
    @NewID = @RegionTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@RegionTypeID AS VARCHAR);

EXEC sp_GetByIDRegionType @RegionTypeID;
EXEC sp_GetAllRegionType;

EXEC sp_UpdateRegionType
    @ID = @RegionTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Region - EMEA';

EXEC sp_GetByIDRegionType @RegionTypeID;

EXEC sp_DeleteRegionType @RegionTypeID;
EXEC sp_GetByIDRegionType @RegionTypeID;

PRINT '✓ RegionType tests complete';
PRINT '';

-- =============================================
-- 7. SegmentType Tests
-- =============================================
PRINT 'Testing SegmentType procedures...';
DECLARE @SegmentTypeID INT;

EXEC sp_InsertSegmentType
    @Code = 'TEST',
    @Description = 'Test Segment - Enterprise',
    @NewID = @SegmentTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@SegmentTypeID AS VARCHAR);

EXEC sp_GetByIDSegmentType @SegmentTypeID;
EXEC sp_GetAllSegmentType;

EXEC sp_UpdateSegmentType
    @ID = @SegmentTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Segment - Commercial';

EXEC sp_GetByIDSegmentType @SegmentTypeID;

EXEC sp_DeleteSegmentType @SegmentTypeID;
EXEC sp_GetByIDSegmentType @SegmentTypeID;

PRINT '✓ SegmentType tests complete';
PRINT '';

-- =============================================
-- 8. RpaStatusType Tests
-- =============================================
PRINT 'Testing RpaStatusType procedures...';
DECLARE @RpaStatusTypeID INT;

EXEC sp_InsertRpaStatusType
    @Code = 'TEST',
    @Description = 'Test Status - Active',
    @NewID = @RpaStatusTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@RpaStatusTypeID AS VARCHAR);

EXEC sp_GetByIDRpaStatusType @RpaStatusTypeID;
EXEC sp_GetAllRpaStatusType;

EXEC sp_UpdateRpaStatusType
    @ID = @RpaStatusTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Status - Pending';

EXEC sp_GetByIDRpaStatusType @RpaStatusTypeID;

EXEC sp_DeleteRpaStatusType @RpaStatusTypeID;
EXEC sp_GetByIDRpaStatusType @RpaStatusTypeID;

PRINT '✓ RpaStatusType tests complete';
PRINT '';

-- =============================================
-- 9. SlaSignatureStatusType Tests
-- =============================================
PRINT 'Testing SlaSignatureStatusType procedures...';
DECLARE @SlaSignatureStatusTypeID INT;

EXEC sp_InsertSlaSignatureStatusType
    @Code = 'TEST',
    @Description = 'Test Signature Status - Pending',
    @NewID = @SlaSignatureStatusTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@SlaSignatureStatusTypeID AS VARCHAR);

EXEC sp_GetByIDSlaSignatureStatusType @SlaSignatureStatusTypeID;
EXEC sp_GetAllSlaSignatureStatusType;

EXEC sp_UpdateSlaSignatureStatusType
    @ID = @SlaSignatureStatusTypeID,
    @Code = 'TEST_UPDATED',
    @Description = 'Test Signature Status - Approved';

EXEC sp_GetByIDSlaSignatureStatusType @SlaSignatureStatusTypeID;

EXEC sp_DeleteSlaSignatureStatusType @SlaSignatureStatusTypeID;
EXEC sp_GetByIDSlaSignatureStatusType @SlaSignatureStatusTypeID;

PRINT '✓ SlaSignatureStatusType tests complete';
PRINT '';

-- =============================================
-- 10. SlaItemType Tests
-- =============================================
PRINT 'Testing SlaItemType procedures...';
DECLARE @SlaItemTypeID INT;

EXEC sp_InsertSlaItemType
    @Name = 'Test SLA Item',
    @Description = 'Test SLA Item for automated testing',
    @Cost = 1500.00,
    @EffectiveDate = '2026-01-01',
    @Disabled = 0,
    @NewID = @SlaItemTypeID OUTPUT;
PRINT 'Insert: ' + CAST(@SlaItemTypeID AS VARCHAR);

EXEC sp_GetByIDSlaItemType @SlaItemTypeID;
EXEC sp_GetAllSlaItemType;

EXEC sp_UpdateSlaItemType
    @ID = @SlaItemTypeID,
    @Name = 'Test SLA Item Updated',
    @Description = 'Test SLA Item for automated testing - updated version',
    @Cost = 2000.00,
    @EffectiveDate = '2026-02-01',
    @Disabled = 1;

EXEC sp_GetByIDSlaItemType @SlaItemTypeID;

EXEC sp_DeleteSlaItemType @SlaItemTypeID;
EXEC sp_GetByIDSlaItemType @SlaItemTypeID;

PRINT '✓ SlaItemType tests complete';
PRINT '';

-- =============================================
-- 11. Enhancement Tests
-- =============================================
PRINT 'Testing Enhancement procedures...';
DECLARE @EnhancementID INT;

EXEC sp_InsertEnhancement
    @Scope = 'Test Enhancement Scope - UI Improvements',
    @NewID = @EnhancementID OUTPUT;
PRINT 'Insert: ' + CAST(@EnhancementID AS VARCHAR);

EXEC sp_GetByIDEnhancement @EnhancementID;
EXEC sp_GetAllEnhancement;

EXEC sp_UpdateEnhancement
    @ID = @EnhancementID,
    @Scope = 'Test Enhancement Scope - Backend Optimizations';

EXEC sp_GetByIDEnhancement @EnhancementID;

EXEC sp_DeleteEnhancement @EnhancementID;
EXEC sp_GetByIDEnhancement @EnhancementID;

PRINT '✓ Enhancement tests complete';
PRINT '';

-- =============================================
-- 12. StoryPointCost Tests
-- =============================================
PRINT 'Testing StoryPointCost procedures...';
DECLARE @StoryPointCostID INT;

EXEC sp_InsertStoryPointCost
    @Points = 5,
    @MaxHours = 40,
    @TotalCost = 5000.00,
    @JnJCostPercentage = 75,
    @EffectiveDate = '2026-01-01',
    @NewID = @StoryPointCostID OUTPUT;
PRINT 'Insert: ' + CAST(@StoryPointCostID AS VARCHAR);

EXEC sp_GetByIDStoryPointCost @StoryPointCostID;
EXEC sp_GetAllStoryPointCost;

EXEC sp_UpdateStoryPointCost
    @ID = @StoryPointCostID,
    @Points = 8,
    @MaxHours = 64,
    @TotalCost = 8000.00,
    @JnJCostPercentage = 80,
    @EffectiveDate = '2026-02-01';

EXEC sp_GetByIDStoryPointCost @StoryPointCostID;

EXEC sp_DeleteStoryPointCost @StoryPointCostID;
EXEC sp_GetByIDStoryPointCost @StoryPointCostID;

PRINT '✓ StoryPointCost tests complete';
PRINT '';

-- =============================================
-- Test Summary
-- =============================================
PRINT '========================================';
PRINT 'All Lookup Table Tests Complete!';
PRINT '12 tables tested';
PRINT '60 stored procedures tested';
PRINT '========================================';
