# CRUD Stored Procedures - RpaDataDev Database

Comprehensive CRUD (Create, Read, Update, Delete) stored procedures for all 22 tables in the RpaDataDev database.

## Overview

**Total**: 110 stored procedures organized across 4 SQL files
- **CrudLookupTables.sql** - 55 procedures for 11 lookup/reference tables
- **CrudHelperTables.sql** - 10 procedures for 2 helper tables
- **CrudMainTables.sql** - 40 procedures for 8 main entity tables
- **CrudJunctionTables.sql** - 5 procedures for 1 junction table

## Installation

Ensure SQL Server Express instance is running, then execute the scripts in order:

```bash
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudLookupTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudHelperTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudMainTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudJunctionTables.sql
```

Alternative using `.\SQLEXPRESS01`:
```bash
sqlcmd -S .\SQLEXPRESS01 -E -i CrudLookupTables.sql
sqlcmd -S .\SQLEXPRESS01 -E -i CrudHelperTables.sql
sqlcmd -S .\SQLEXPRESS01 -E -i CrudMainTables.sql
sqlcmd -S .\SQLEXPRESS01 -E -i CrudJunctionTables.sql
```

## Naming Conventions

Each table has 5 standard stored procedures:

| Procedure Pattern | Purpose | Returns |
|------------------|---------|---------|
| `sp_Insert[TableName]` | Create new record | New ID + RowsAffected |
| `sp_Update[TableName]` | Update existing record | RowsAffected |
| `sp_Delete[TableName]` | Delete record by ID | RowsAffected |
| `sp_GetAll[TableName]` | Retrieve all records | Result set |
| `sp_GetByID[TableName]` | Retrieve single record | Result set |

## Usage Examples

### 1. Lookup Tables (Simple Reference Data)

#### Example: Status Table

**Insert a new status:**
```sql
DECLARE @NewID INT;
EXEC sp_InsertStatus
    @Code = 'ACTIVE',
    @Description = 'Automation is active and running',
    @NewID = @NewID OUTPUT;
SELECT @NewID AS NewStatusID;
```

**Update existing status:**
```sql
EXEC sp_UpdateStatus
    @ID = 1,
    @Code = 'ACTIVE',
    @Description = 'Updated description for active status';
```

**Get all statuses:**
```sql
EXEC sp_GetAllStatus;
```

**Get single status:**
```sql
EXEC sp_GetByIDStatus @ID = 1;
```

**Delete status:**
```sql
EXEC sp_DeleteStatus @ID = 1;
```

#### Example: Region Table

```sql
-- Insert
DECLARE @NewID INT;
EXEC sp_InsertRegion
    @Code = 'NAM',
    @Description = 'North America',
    @NewID = @NewID OUTPUT;

-- Get all regions
EXEC sp_GetAllRegion;
```

### 2. Helper Tables (Non-INT Primary Keys)

#### Example: JjedsHelper (Employee Directory Cache)

**Note**: WWID is the primary key (NVARCHAR(9)), not an auto-incrementing ID.

**Insert employee:**
```sql
EXEC sp_InsertJjedsHelper
    @WWID = '123456789',
    @CommonName = 'Smith, John',
    @Email = 'jsmith@company.com',
    @JjedsCreated = '2024-01-01',
    @JjedsLastChanged = '2024-01-01';
```

**Update employee:**
```sql
EXEC sp_UpdateJjedsHelper
    @WWID = '123456789',
    @CommonName = 'Smith, John A.',
    @Email = 'john.smith@company.com',
    @JjedsCreated = '2024-01-01',
    @JjedsLastChanged = '2024-06-15';
```

**Get employee by WWID:**
```sql
EXEC sp_GetByIDJjedsHelper @WWID = '123456789';
```

#### Example: CmdbHelper (CMDB Application Cache)

**Note**: AppID is the primary key (NVARCHAR(50)).

```sql
-- Insert
EXEC sp_InsertCmdbHelper
    @AppID = 'APP12345',
    @Name = 'Customer Portal',
    @Zcode = 'Z001234';

-- Get by AppID
EXEC sp_GetByIDCmdbHelper @AppID = 'APP12345';
```

### 3. Main Entity Tables (Complex Relationships)

#### Example: Automation Table (Core RPA Records)

**Insert automation with multiple foreign keys:**
```sql
DECLARE @NewID INT;
EXEC sp_InsertAutomation
    @Name = 'Invoice Processing Bot',
    @SegmentID = 1,
    @RegionID = 2,
    @FunctionID = 3,
    @StatusID = 1,
    @BtoWWID = '111111111',      -- Business Technical Owner
    @BoWWID = '222222222',        -- Business Owner
    @FcWWID = '333333333',        -- Functional Champion
    @BuildZcode = 'Z001234',
    @BuildCostCenter = 'CC-12345',
    @SseWWID = '444444444',       -- Senior Service Engineer
    @LseWWID = '555555555',       -- Lead Service Engineer
    @NewID = @NewID OUTPUT;

SELECT @NewID AS NewAutomationID;
```

**Get automation with all details:**
```sql
EXEC sp_GetByIDAutomation @ID = 1;
```

#### Example: SlaMaster Table (SLA Agreements)

```sql
DECLARE @NewID INT;
EXEC sp_InsertSlaMaster
    @AutomationID = 1,
    @ComplexityID = 2,
    @MedalID = 3,
    @Zcode = 'Z001234',
    @CostCenter = 'CC-67890',
    @StartDate = '2024-01-01',
    @EndDate = '2024-12-31',
    @NewID = @NewID OUTPUT;
```

#### Example: VirtualIdentity Table (Service Accounts)

```sql
DECLARE @NewID INT;
EXEC sp_InsertVirtualIdentity
    @AccountName = 'svc_rpabot01',
    @HostName = 'RPASRV01',
    @WWID = '999999999',
    @IPv4 = '10.10.10.101',
    @ADDomainID = 1,
    @Email = 'svc_rpabot01@company.com',
    @Created = '2024-01-15',
    @Retired = NULL,
    @NewID = @NewID OUTPUT;
```

#### Example: AutomationLogEntry (Audit Trail)

```sql
DECLARE @NewID INT;
EXEC sp_InsertAutomationLogEntry
    @AutomationID = 1,
    @CreatedWWID = '123456789',
    @CreatedDate = '2024-01-20',
    @Comment = 'Automation promoted to production environment',
    @NewID = @NewID OUTPUT;
```

### 4. Junction Tables (Many-to-Many Relationships)

#### Example: ViAssignments (Virtual Identity Assignments)

Links virtual identities to automation environments with allocation percentages:

```sql
DECLARE @NewID INT;
EXEC sp_InsertViAssignments
    @VirtualIdentityID = 1,
    @AutomationEnvironmentID = 1,
    @Percentage = 100,              -- 100% allocated to this environment
    @StartDate = '2024-01-01',
    @EndDate = NULL,                -- NULL = ongoing assignment
    @NewID = @NewID OUTPUT;
```

**Get all assignments for a virtual identity:**
```sql
-- Custom query (not a standard CRUD proc)
SELECT va.*, vi.AccountName, ae.AppID
FROM ViAssignments va
JOIN VirtualIdentity vi ON va.VirtualIdentityID = vi.ID
JOIN AutomationEnvironment ae ON va.AutomationEnvironmentID = ae.ID
WHERE va.VirtualIdentityID = 1;
```

## Complete Table List

### Lookup/Reference Tables (11)
1. **SlaItemType** - Types of SLA line items with costs
2. **Enhancement** - Enhancement scopes
3. **Complexity** - Complexity levels (Bronze, Silver, Gold, Platinum)
4. **Medal** - Medal tiers for SLA agreements
5. **Function** - Business functions
6. **Region** - Geographic regions
7. **Segment** - Business segments
8. **Status** - Automation statuses
9. **AutomationEnvironmentType** - Environment types (Dev, Test, Prod)
10. **ADDomain** - Active Directory domains
11. **StoryPointCost** - Story point cost calculations

### Helper Tables (2)
12. **JjedsHelper** - Employee directory cache (PK: WWID)
13. **CmdbHelper** - CMDB application cache (PK: AppID)

### Main Entity Tables (8)
14. **Automation** - Core RPA automation records
15. **SlaMaster** - SLA master agreements
16. **SlaItem** - SLA line items
17. **EnhancementUserStory** - Jira user stories for enhancements
18. **AutomationLogEntry** - Audit log for automation changes
19. **SlaLogEntry** - Audit log for SLA changes
20. **VirtualIdentity** - Service accounts and bot identities
21. **AutomationEnvironment** - Automation deployment environments

### Junction Tables (1)
22. **ViAssignments** - Virtual identity to environment assignments

## Error Handling

All procedures include TRY/CATCH blocks that will:
- Automatically rollback failed transactions
- Throw detailed error messages using THROW
- Return 0 rows affected for failed operations

**Example error handling in your application:**

```sql
BEGIN TRY
    DECLARE @NewID INT;
    EXEC sp_InsertAutomation
        @Name = 'Test Bot',
        @BtoWWID = 'INVALID',  -- FK constraint will fail if WWID doesn't exist
        @NewID = @NewID OUTPUT;
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH
```

## Important Notes

### Foreign Key Constraints
- Delete operations may fail due to foreign key constraints
- Helper table records (JjedsHelper, CmdbHelper) must exist before referencing in main tables
- Consider using soft deletes (status flags) instead of hard deletes for core entities

### NULL vs Required Fields
- All fields accept NULL in these procedures
- Application logic should enforce required fields
- Database constraints enforce referential integrity

### Identity Columns
- Lookup and main entity tables use IDENTITY(1,1) for primary keys
- Helper tables use business keys (WWID, AppID)
- Insert procedures return new IDs via OUTPUT parameter and SELECT statement

### Date Handling
- All date fields use DATE type (not DATETIME)
- Pass dates as strings: '2024-01-31'
- NULL dates are allowed (e.g., EndDate for active records)

## Advanced Queries

For complex reporting needs, combine CRUD procedures with JOINs:

```sql
-- Get automation with all owner details
SELECT
    a.*,
    bto.CommonName AS BtoName,
    bo.CommonName AS BoName,
    fc.CommonName AS FcName,
    s.Description AS StatusDesc,
    r.Description AS RegionDesc
FROM Automation a
LEFT JOIN JjedsHelper bto ON a.BtoWWID = bto.WWID
LEFT JOIN JjedsHelper bo ON a.BoWWID = bo.WWID
LEFT JOIN JjedsHelper fc ON a.FcWWID = fc.WWID
LEFT JOIN Status s ON a.StatusID = s.ID
LEFT JOIN Region r ON a.RegionID = r.ID
WHERE a.ID = 1;
```

## Maintenance Scripts

**List all CRUD procedures:**
```sql
SELECT name, create_date, modify_date
FROM sys.procedures
WHERE name LIKE 'sp_Insert%'
   OR name LIKE 'sp_Update%'
   OR name LIKE 'sp_Delete%'
   OR name LIKE 'sp_GetAll%'
   OR name LIKE 'sp_GetByID%'
ORDER BY name;
```

**Drop all CRUD procedures (if needed):**
```sql
-- Use with caution!
DECLARE @ProcName NVARCHAR(255);
DECLARE proc_cursor CURSOR FOR
    SELECT name FROM sys.procedures
    WHERE name LIKE 'sp_%';

OPEN proc_cursor;
FETCH NEXT FROM proc_cursor INTO @ProcName;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC('DROP PROCEDURE ' + @ProcName);
    FETCH NEXT FROM proc_cursor INTO @ProcName;
END

CLOSE proc_cursor;
DEALLOCATE proc_cursor;
```

## Support & Troubleshooting

### Connection Issues
If sqlcmd cannot connect:
1. Verify SQL Server Express is running: Check Windows Services for `SQL Server (SQLEXPRESS01)`
2. Confirm instance name: `.\SQLEXPRESS01` or `localhost\SQLEXPRESS01`
3. Check Windows Authentication is enabled

### Procedure Execution Errors
- **FK Constraint Violations**: Ensure referenced records exist in parent tables
- **Primary Key Violations**: Check for duplicate IDs (lookup tables) or keys (helper tables)
- **NULL Parameter Issues**: Verify required fields are provided

### Performance Considerations
- All foreign key columns have nonclustered indexes
- GetAll procedures return full table scans - use WHERE clauses for large tables
- Consider creating filtered procedures for common queries

## Files

- **CrudLookupTables.sql** - 55 procedures for lookup/reference tables
- **CrudHelperTables.sql** - 10 procedures for helper tables
- **CrudMainTables.sql** - 40 procedures for main entity tables
- **CrudJunctionTables.sql** - 5 procedures for junction tables
- **CRUD_README.md** - This documentation file

---

**Generated for**: RpaDataDev Database
**Platform**: SQL Server Express (SQLEXPRESS01)
**Total Procedures**: 110
**Date**: January 2026
