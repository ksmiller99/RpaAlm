-- =============================================
-- Comprehensive Test Script for Junction Table CRUD Procedures
-- Junction Table: ViAssignments (1 table, 5 procedures)
-- =============================================
-- This script tests all CRUD operations for the ViAssignments junction table:
-- Insert -> GetByID -> GetAll -> Update -> GetByID (verify) -> Delete -> GetByID (verify empty)
-- =============================================

USE RpaAlmDev;
GO

PRINT '========================================';
PRINT 'Starting Junction Table CRUD Procedure Tests';
PRINT 'Testing ViAssignments (1 table, 5 procedures)';
PRINT '========================================';
PRINT '';

-- =============================================
-- Create Prerequisite Lookup/Helper/Main Records
-- =============================================
PRINT 'Creating prerequisite data for foreign keys...';

-- JjedsHelper (required by VirtualIdentity)
DECLARE @JjedsID INT;
EXEC sp_InsertJjedsHelper
    @WWID = '888888888',
    @CommonName = 'Test Bot Owner',
    @Email = 'botowner@example.com',
    @JjedsCreated = '2026-01-01',
    @JjedsLastChanged = '2026-01-01',
    @NewID = @JjedsID OUTPUT;
PRINT 'Created JjedsHelper: ' + CAST(@JjedsID AS VARCHAR);

-- AdDomainType (required by VirtualIdentity)
DECLARE @AdDomainID INT;
EXEC sp_InsertAdDomainType
    @Code = 'TESTDOM',
    @Description = 'Test Domain for VI Assignment',
    @NewID = @AdDomainID OUTPUT;
PRINT 'Created AdDomainType: ' + CAST(@AdDomainID AS VARCHAR);

-- RpaStatusType (required by Automation)
DECLARE @RpaStatusID INT;
EXEC sp_InsertRpaStatusType
    @Code = 'ACTIVE',
    @Description = 'Active Automation',
    @NewID = @RpaStatusID OUTPUT;
PRINT 'Created RpaStatusType: ' + CAST(@RpaStatusID AS VARCHAR);

-- CmdbHelper (required by AutomationEnvironment)
DECLARE @CmdbID INT;
EXEC sp_InsertCmdbHelper
    @AppID = 'TESTAPP01',
    @Name = 'Test Application for VI',
    @Zcode = 'Z99999',
    @OperationalStatus = 'Active',
    @CmdbUpdated = '2026-01-01',
    @NewID = @CmdbID OUTPUT;
PRINT 'Created CmdbHelper: ' + CAST(@CmdbID AS VARCHAR);

-- AutomationEnvironmentType (required by AutomationEnvironment)
DECLARE @EnvironmentTypeID INT;
EXEC sp_InsertAutomationEnvironmentType
    @Code = 'PROD',
    @Description = 'Production Environment',
    @NewID = @EnvironmentTypeID OUTPUT;
PRINT 'Created AutomationEnvironmentType: ' + CAST(@EnvironmentTypeID AS VARCHAR);

-- VirtualIdentity (required by ViAssignments)
DECLARE @VirtualIdentityID INT;
EXEC sp_InsertVirtualIdentity
    @JjedsID = @JjedsID,
    @AdDomainID = @AdDomainID,
    @HostName = 'RPABOT01',
    @IPv4 = '192.168.1.100',
    @Created = '2026-01-01',
    @Retired = '2099-12-31',
    @NewID = @VirtualIdentityID OUTPUT;
PRINT 'Created VirtualIdentity: ' + CAST(@VirtualIdentityID AS VARCHAR);

-- Automation (required by AutomationEnvironment)
DECLARE @AutomationID INT;
EXEC sp_InsertAutomation
    @Name = 'Test Automation for VI Assignment',
    @RpaStatusID = @RpaStatusID,
    @NewID = @AutomationID OUTPUT;
PRINT 'Created Automation: ' + CAST(@AutomationID AS VARCHAR);

-- AutomationEnvironment (required by ViAssignments)
DECLARE @AutomationEnvironmentID INT;
EXEC sp_InsertAutomationEnvironment
    @AutomationID = @AutomationID,
    @CmdbID = @CmdbID,
    @EnvironmentTypeID = @EnvironmentTypeID,
    @NewID = @AutomationEnvironmentID OUTPUT;
PRINT 'Created AutomationEnvironment: ' + CAST(@AutomationEnvironmentID AS VARCHAR);

PRINT 'Prerequisite data created successfully';
PRINT '';

-- =============================================
-- ViAssignments Tests
-- =============================================
PRINT 'Testing ViAssignments procedures...';
DECLARE @TestID INT;

EXEC sp_InsertViAssignments
    @VirtualIdentityID = @VirtualIdentityID,
    @AutomationEnvironmentID = @AutomationEnvironmentID,
    @Percentage = 50,
    @StartDate = '2026-01-01',
    @EndDate = NULL,
    @NewID = @TestID OUTPUT;
PRINT 'Insert: ' + CAST(@TestID AS VARCHAR);

EXEC sp_GetByIDViAssignments @TestID;
EXEC sp_GetAllViAssignments;

EXEC sp_UpdateViAssignments
    @ID = @TestID,
    @VirtualIdentityID = @VirtualIdentityID,
    @AutomationEnvironmentID = @AutomationEnvironmentID,
    @Percentage = 75,
    @StartDate = '2026-01-01',
    @EndDate = '2026-12-31';

EXEC sp_GetByIDViAssignments @TestID;

EXEC sp_DeleteViAssignments @TestID;
EXEC sp_GetByIDViAssignments @TestID;

PRINT '✓ ViAssignments tests complete';
PRINT '';

-- =============================================
-- Clean up all prerequisite data (reverse order)
-- =============================================
PRINT 'Cleaning up prerequisite test data...';

EXEC sp_DeleteAutomationEnvironment @AutomationEnvironmentID;
PRINT 'Deleted AutomationEnvironment: ' + CAST(@AutomationEnvironmentID AS VARCHAR);

EXEC sp_DeleteAutomation @AutomationID;
PRINT 'Deleted Automation: ' + CAST(@AutomationID AS VARCHAR);

EXEC sp_DeleteVirtualIdentity @VirtualIdentityID;
PRINT 'Deleted VirtualIdentity: ' + CAST(@VirtualIdentityID AS VARCHAR);

EXEC sp_DeleteAutomationEnvironmentType @EnvironmentTypeID;
PRINT 'Deleted AutomationEnvironmentType: ' + CAST(@EnvironmentTypeID AS VARCHAR);

EXEC sp_DeleteCmdbHelper @CmdbID;
PRINT 'Deleted CmdbHelper: ' + CAST(@CmdbID AS VARCHAR);

EXEC sp_DeleteRpaStatusType @RpaStatusID;
PRINT 'Deleted RpaStatusType: ' + CAST(@RpaStatusID AS VARCHAR);

EXEC sp_DeleteAdDomainType @AdDomainID;
PRINT 'Deleted AdDomainType: ' + CAST(@AdDomainID AS VARCHAR);

EXEC sp_DeleteJjedsHelper @JjedsID;
PRINT 'Deleted JjedsHelper: ' + CAST(@JjedsID AS VARCHAR);

PRINT 'Prerequisite data cleanup complete';
PRINT '';

-- =============================================
-- Test Summary
-- =============================================
PRINT '========================================';
PRINT 'All Junction Table Tests Complete!';
PRINT '1 table tested';
PRINT '5 stored procedures tested';
PRINT '========================================';
