# Todo

## Plan: Create CRUD Stored Procedures for RpaDataDev Database

Create comprehensive SQL stored procedures for all 22 tables in the RpaDataDev database. Each table will have 5 standard stored procedures:
- `sp_Insert[TableName]` - Insert new record
- `sp_Update[TableName]` - Update existing record
- `sp_Delete[TableName]` - Delete record by ID
- `sp_GetAll[TableName]` - Get all records
- `sp_GetByID[TableName]` - Get single record by ID

**Total**: ~110 stored procedures organized by table category.

### Organization Strategy
Group stored procedures into separate SQL files by table category for maintainability:
1. **CrudLookupTables.sql** - 11 lookup/reference tables (55 procs)
2. **CrudHelperTables.sql** - 2 helper tables (10 procs)
3. **CrudMainTables.sql** - 9 main entity tables (45 procs)
4. **CrudJunctionTables.sql** - 1 junction table (5 procs)

### Special Considerations
- Helper tables use non-INT primary keys (WWID, AppID) - adjust GetByID procs accordingly
- Foreign key constraints must be considered for delete operations (may need soft delete or cascade logic)
- Include error handling with TRY/CATCH blocks
- Return affected rows and identity values where applicable

## Tasks

### Phase 1: Lookup/Reference Tables (11 tables)
- [ ] Create CrudLookupTables.sql file
- [ ] Add SlaItemType CRUD procedures (5)
- [ ] Add Enhancement CRUD procedures (5)
- [ ] Add Complexity CRUD procedures (5)
- [ ] Add Medal CRUD procedures (5)
- [ ] Add Function CRUD procedures (5)
- [ ] Add Region CRUD procedures (5)
- [ ] Add Segment CRUD procedures (5)
- [ ] Add Status CRUD procedures (5)
- [ ] Add AutomationEnvironmentType CRUD procedures (5)
- [ ] Add ADDomain CRUD procedures (5)
- [ ] Add StoryPointCost CRUD procedures (5)

### Phase 2: Helper Tables (2 tables)
- [ ] Create CrudHelperTables.sql file
- [ ] Add JjedsHelper CRUD procedures (5) - uses WWID as PK
- [ ] Add CmdbHelper CRUD procedures (5) - uses AppID as PK

### Phase 3: Main Entity Tables (9 tables)
- [ ] Create CrudMainTables.sql file
- [ ] Add Automation CRUD procedures (5) - complex with multiple FKs
- [ ] Add SlaMaster CRUD procedures (5)
- [ ] Add SlaItem CRUD procedures (5)
- [ ] Add EnhancementUserStory CRUD procedures (5)
- [ ] Add AutomationLogEntry CRUD procedures (5)
- [ ] Add SlaLogEntry CRUD procedures (5)
- [ ] Add VirtualIdentity CRUD procedures (5)
- [ ] Add AutomationEnvironment CRUD procedures (5)

### Phase 4: Junction Tables (1 table)
- [ ] Create CrudJunctionTables.sql file
- [ ] Add ViAssignments CRUD procedures (5)

### Phase 5: Testing & Validation
- [ ] Execute all CRUD scripts against database
- [ ] Verify all procedures created successfully
- [ ] Test sample CRUD operations on key tables

### Phase 6: Documentation
- [ ] Create README for CRUD procedures with usage examples
- [ ] Document naming conventions and patterns

## Review

### Summary
Successfully created comprehensive CRUD stored procedures for all 22 tables in the RpaDataDev database. A total of 110 stored procedures were implemented following consistent naming conventions and patterns, with full error handling and documentation.

### Changes Made

#### 1. Created 4 SQL Files with 110 Stored Procedures

**CrudLookupTables.sql** (55 procedures)
- SlaItemType CRUD operations (5 procs)
- Enhancement CRUD operations (5 procs)
- Complexity CRUD operations (5 procs)
- Medal CRUD operations (5 procs)
- Function CRUD operations (5 procs)
- Region CRUD operations (5 procs)
- Segment CRUD operations (5 procs)
- Status CRUD operations (5 procs)
- AutomationEnvironmentType CRUD operations (5 procs)
- ADDomain CRUD operations (5 procs)
- StoryPointCost CRUD operations (5 procs)

**CrudHelperTables.sql** (10 procedures)
- JjedsHelper CRUD operations (5 procs) - handles WWID as primary key
- CmdbHelper CRUD operations (5 procs) - handles AppID as primary key

**CrudMainTables.sql** (40 procedures)
- Automation CRUD operations (5 procs) - complex with multiple foreign keys
- SlaMaster CRUD operations (5 procs)
- SlaItem CRUD operations (5 procs)
- EnhancementUserStory CRUD operations (5 procs)
- AutomationLogEntry CRUD operations (5 procs)
- SlaLogEntry CRUD operations (5 procs)
- VirtualIdentity CRUD operations (5 procs)
- AutomationEnvironment CRUD operations (5 procs)

**CrudJunctionTables.sql** (5 procedures)
- ViAssignments CRUD operations (5 procs) - handles many-to-many relationships

#### 2. Created Comprehensive Documentation

**CRUD_README.md** - Complete usage guide including:
- Installation instructions
- Naming conventions
- Detailed usage examples for all table types
- Error handling guidelines
- Advanced query patterns
- Maintenance scripts
- Troubleshooting guide

### Key Features Implemented

1. **Consistent Naming Pattern**
   - sp_Insert[TableName] - Create operations
   - sp_Update[TableName] - Update operations
   - sp_Delete[TableName] - Delete operations
   - sp_GetAll[TableName] - Retrieve all records
   - sp_GetByID[TableName] - Retrieve single record

2. **Error Handling**
   - TRY/CATCH blocks in all procedures
   - THROW for detailed error messages
   - RowsAffected return values

3. **Return Values**
   - Insert procedures return new ID via OUTPUT parameter and SELECT
   - Update/Delete procedures return RowsAffected
   - Get procedures return result sets

4. **Special Handling**
   - Helper tables use non-INT primary keys (WWID, AppID)
   - All parameters default to NULL for flexibility
   - CREATE OR ALTER for easy updates

### Database Readiness

The CRUD stored procedures are ready to be deployed to the RpaDataDev database. To install:

```bash
# Ensure SQL Server Express (SQLEXPRESS01) is running, then:
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudLookupTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudHelperTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudMainTables.sql
sqlcmd -S localhost\SQLEXPRESS01 -E -i CrudJunctionTables.sql
```

**Note**: During development, SQL Server was not accessible. The procedures are ready to deploy when the instance is available.

### Files Created

1. **CrudLookupTables.sql** - 55 procedures for 11 lookup/reference tables
2. **CrudHelperTables.sql** - 10 procedures for 2 helper tables
3. **CrudMainTables.sql** - 40 procedures for 8 main entity tables
4. **CrudJunctionTables.sql** - 5 procedures for 1 junction table
5. **CRUD_README.md** - Comprehensive documentation with examples

### Next Steps

1. Start SQL Server Express instance (SQLEXPRESS01)
2. Execute all 4 CRUD SQL scripts in order
3. Verify procedures with: `SELECT * FROM sys.procedures WHERE name LIKE 'sp_%'`
4. Test basic CRUD operations on key tables (Status, Region, Automation)
5. Build application layer to consume these stored procedures

### Technical Notes

- All procedures use SET NOCOUNT ON for performance
- Foreign key relationships preserved from original schema
- Indexes on FK columns already exist from database creation
- Consider soft deletes for main entity tables to preserve audit trail
- Helper tables require pre-population before main entity operations
