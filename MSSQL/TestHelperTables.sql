-- =============================================
-- Comprehensive Test Script for Helper Table CRUD Procedures
-- Helper Tables (2 tables, 10 procedures)
-- =============================================
-- This script tests all CRUD operations for each helper table:
-- Insert -> GetByID -> GetAll -> Update -> GetByID (verify) -> Delete -> GetByID (verify empty)
-- =============================================

USE RpaAlmDev;
GO

PRINT '========================================';
PRINT 'Starting Helper Table CRUD Procedure Tests';
PRINT 'Testing 2 Helper Tables (10 Procedures)';
PRINT '========================================';
PRINT '';

-- =============================================
-- 1. JjedsHelper Tests
-- =============================================
PRINT 'Testing JjedsHelper procedures...';
DECLARE @JjedsHelperID INT;

EXEC sp_InsertJjedsHelper
    @WWID = '123456789',
    @CommonName = 'Test User',
    @Email = 'test@example.com',
    @JjedsCreated = '2026-01-01',
    @JjedsLastChanged = '2026-01-01',
    @NewID = @JjedsHelperID OUTPUT;
PRINT 'Insert: ' + CAST(@JjedsHelperID AS VARCHAR);

EXEC sp_GetByIDJjedsHelper @JjedsHelperID;
EXEC sp_GetAllJjedsHelper;

EXEC sp_UpdateJjedsHelper
    @ID = @JjedsHelperID,
    @WWID = '987654321',
    @CommonName = 'Test User Updated',
    @Email = 'testupdated@example.com',
    @JjedsCreated = '2026-01-01',
    @JjedsLastChanged = '2026-01-15';

EXEC sp_GetByIDJjedsHelper @JjedsHelperID;

EXEC sp_DeleteJjedsHelper @JjedsHelperID;
EXEC sp_GetByIDJjedsHelper @JjedsHelperID;

PRINT '✓ JjedsHelper tests complete';
PRINT '';

-- =============================================
-- 2. CmdbHelper Tests
-- =============================================
PRINT 'Testing CmdbHelper procedures...';
DECLARE @CmdbHelperID INT;

EXEC sp_InsertCmdbHelper
    @AppID = 'TEST001',
    @Name = 'Test Application',
    @Zcode = 'Z12345',
    @OperationalStatus = 'Active',
    @CmdbUpdated = '2026-01-01',
    @NewID = @CmdbHelperID OUTPUT;
PRINT 'Insert: ' + CAST(@CmdbHelperID AS VARCHAR);

EXEC sp_GetByIDCmdbHelper @CmdbHelperID;
EXEC sp_GetAllCmdbHelper;

EXEC sp_UpdateCmdbHelper
    @ID = @CmdbHelperID,
    @AppID = 'TEST002',
    @Name = 'Test Application Updated',
    @Zcode = 'Z67890',
    @OperationalStatus = 'Inactive',
    @CmdbUpdated = '2026-01-15';

EXEC sp_GetByIDCmdbHelper @CmdbHelperID;

EXEC sp_DeleteCmdbHelper @CmdbHelperID;
EXEC sp_GetByIDCmdbHelper @CmdbHelperID;

PRINT '✓ CmdbHelper tests complete';
PRINT '';

-- =============================================
-- Test Summary
-- =============================================
PRINT '========================================';
PRINT 'All Helper Table Tests Complete!';
PRINT '2 tables tested';
PRINT '10 stored procedures tested';
PRINT '========================================';
