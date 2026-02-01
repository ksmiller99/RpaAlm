# RPA ALM API

RESTful API for RPA (Robotic Process Automation) Application Lifecycle Management Database.

## Overview

This ASP.NET Core Minimal API exposes **115 CRUD endpoints** across **23 database tables**, providing complete access to the RpaAlmDev database for managing automation workflows, SLA tracking, virtual identities, and enhancement tracking.

## Features

- **115 RESTful Endpoints**: Full CRUD operations (Create, Read, Update, Delete) for all 23 tables
- **Minimal API Architecture**: Simple, lightweight, and performant
- **Swagger/OpenAPI Documentation**: Interactive API documentation at root URL
- **Dapper ORM**: High-performance data access with stored procedure support
- **IIS Ready**: Configured for production deployment on IIS
- **SQL Server Integration**: Works with SQL Server Express using Windows Authentication

## Technology Stack

- **Framework**: ASP.NET Core 9.0 (.NET 9) Minimal API
- **Database**: SQL Server Express (localhost\SQLEXPRESS01)
- **ORM**: Dapper 2.1.66
- **Data Provider**: Microsoft.Data.SqlClient 6.1.4
- **Documentation**: Swashbuckle.AspNetCore 10.1.1

## Database Schema

### 23 Tables (115 Stored Procedures)

**Lookup Tables (12)**: AdDomainType, AutomationEnvironmentType, ComplexityType, FunctionType, MedalType, RegionType, SegmentType, RpaStatusType, SlaSignatureStatusType, SlaItemType, Enhancement, StoryPointCost

**Helper Tables (2)**: JjedsHelper (Employee Directory), CmdbHelper (CMDB Applications)

**Main Entity Tables (8)**: Automation, AutomationEnvironment, AutomationLogEntry, EnhancementUserStory, SlaMaster, SlaItem, SlaLogEntry, VirtualIdentity

**Junction Tables (1)**: ViAssignments

## Project Structure

```
RpaAlmApi/
├── RpaAlmApi.sln                          # Solution file
├── README.md                              # This file
├── IIS_DEPLOYMENT.md                      # IIS deployment guide
└── src/
    └── RpaAlmApi/
        ├── RpaAlmApi.csproj               # Project file
        ├── Program.cs                     # Main application (all 115 endpoints)
        ├── appsettings.json               # Development configuration
        ├── appsettings.Production.json    # Production configuration
        ├── web.config                     # IIS configuration
        └── Models/
            ├── Common/
            │   └── OperationResult.cs     # Standard response for CUD operations
            ├── Lookup/                    # 12 lookup DTOs
            ├── Helper/                    # 2 helper DTOs
            ├── Main/                      # 8 main entity DTOs
            └── Junction/                  # 1 junction DTO
```

## Quick Start

### Prerequisites

1. **.NET 9.0 SDK**: https://dotnet.microsoft.com/download
2. **SQL Server Express**: With instance `SQLEXPRESS01`
3. **Database**: RpaAlmDev with all stored procedures deployed

### Run Locally

```bash
cd src/RpaAlmApi
dotnet restore
dotnet run
```

The API will start at http://localhost:5237

### Access Swagger UI

Open your browser to http://localhost:5237/ to access interactive API documentation.

## API Endpoints

### Endpoint Pattern

All 23 tables follow the same RESTful pattern:

```
GET    /api/{tablename}       → Get all records (sp_GetAll{TableName})
GET    /api/{tablename}/{id}  → Get record by ID (sp_GetByID{TableName})
POST   /api/{tablename}       → Create new record (sp_Insert{TableName})
PUT    /api/{tablename}/{id}  → Update record (sp_Update{TableName})
DELETE /api/{tablename}/{id}  → Delete record (sp_Delete{TableName})
```

### Example: AdDomainType

```bash
# Get all AD domains
GET http://localhost:5237/api/addomain

# Get specific AD domain
GET http://localhost:5237/api/addomain/1

# Create new AD domain
POST http://localhost:5237/api/addomain
Content-Type: application/json

{
  "code": "CORP",
  "description": "Corporate Domain"
}

# Update AD domain
PUT http://localhost:5237/api/addomain/1
Content-Type: application/json

{
  "code": "CORPORATE",
  "description": "Corporate Active Directory Domain"
}

# Delete AD domain
DELETE http://localhost:5237/api/addomain/1
```

### Response Format

**Success Responses**:
- `GET All`: Returns array of objects `[{...}, {...}]`
- `GET By ID`: Returns single object `{...}` or `404 Not Found`
- `POST`: Returns `201 Created` with `{"newID": 5, "rowsAffected": 1}`
- `PUT`: Returns `200 OK` with `{"newID": null, "rowsAffected": 1}` or `404 Not Found`
- `DELETE`: Returns `200 OK` with `{"newID": null, "rowsAffected": 1}` or `404 Not Found`

**Error Responses**:
- `500 Internal Server Error`: Database errors with detailed message

### All Available Endpoints

**Lookup Tables (60 endpoints)**
- `/api/addomain`
- `/api/automationenvironmenttype`
- `/api/complexitytype`
- `/api/functiontype`
- `/api/medaltype`
- `/api/regiontype`
- `/api/segmenttype`
- `/api/rpastatustype`
- `/api/slasignaturestatustype`
- `/api/slaitemtype`
- `/api/enhancement`
- `/api/storypointcost`

**Helper Tables (10 endpoints)**
- `/api/jjedshelper`
- `/api/cmdbhelper`

**Main Tables (40 endpoints)**
- `/api/automation`
- `/api/automationenvironment`
- `/api/automationlogentry`
- `/api/enhancementuserstory`
- `/api/slamaster`
- `/api/slaitem`
- `/api/slalogentry`
- `/api/virtualidentity`

**Junction Tables (5 endpoints)**
- `/api/viassignments`

## Configuration

### Connection String

Edit `appsettings.json` (Development) or `appsettings.Production.json` (Production):

```json
{
  "ConnectionStrings": {
    "RpaAlmDev": "Server=.\\SQLEXPRESS01;Database=RpaAlmDev;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

## Development

### Build

```bash
dotnet build
```

### Run Tests

```bash
dotnet test
```

### Publish

```bash
dotnet publish -c Release -p:PublishProfile=IIS
```

## IIS Deployment

See [IIS_DEPLOYMENT.md](IIS_DEPLOYMENT.md) for complete deployment instructions.

**Quick Deploy**:

1. Publish the application:
   ```bash
   dotnet publish -c Release -p:PublishProfile=IIS
   ```

2. Create IIS Application Pool:
   - Name: RpaAlmApiPool
   - .NET CLR Version: No Managed Code
   - Pipeline: Integrated

3. Create IIS Website/Application:
   - Physical Path: C:\inetpub\wwwroot\RpaAlmApi
   - Application Pool: RpaAlmApiPool
   - Port: 8080 (or your choice)

4. Grant SQL Server permissions to IIS AppPool identity:
   ```sql
   CREATE LOGIN [IIS APPPOOL\RpaAlmApiPool] FROM WINDOWS;
   USE RpaAlmDev;
   CREATE USER [IIS APPPOOL\RpaAlmApiPool] FOR LOGIN [IIS APPPOOL\RpaAlmApiPool];
   GRANT EXECUTE TO [IIS APPPOOL\RpaAlmApiPool];
   ALTER ROLE db_datareader ADD MEMBER [IIS APPPOOL\RpaAlmApiPool];
   ALTER ROLE db_datawriter ADD MEMBER [IIS APPPOOL\RpaAlmApiPool];
   ```

## Architecture

### Generic CRUD Pattern

All endpoints use a single generic helper method `MapCrudEndpoints<T>` that:
1. Maps 5 HTTP methods (GET all, GET by ID, POST, PUT, DELETE)
2. Executes corresponding stored procedures via Dapper
3. Returns standardized JSON responses
4. Handles errors with proper HTTP status codes

### Code Structure

- **Program.cs**: Single file containing all 115 endpoint definitions
- **Models**: Simple DTOs matching database table schemas
- **No Controllers**: Minimal API approach for simplicity
- **No Repositories**: Direct Dapper calls in route handlers
- **No Services**: Business logic in stored procedures

## Testing

### Manual Testing with curl

```bash
# Test GetAll
curl http://localhost:5237/api/addomain

# Test Create
curl -X POST http://localhost:5237/api/addomain \
  -H "Content-Type: application/json" \
  -d '{"code":"CORP","description":"Corporate Domain"}'

# Test GetByID
curl http://localhost:5237/api/addomain/1

# Test Update
curl -X PUT http://localhost:5237/api/addomain/1 \
  -H "Content-Type: application/json" \
  -d '{"code":"CORPORATE","description":"Updated Description"}'

# Test Delete
curl -X DELETE http://localhost:5237/api/addomain/1
```

### Testing with Swagger UI

1. Navigate to http://localhost:5237/
2. Explore all 115 endpoints organized by tags
3. Use "Try it out" to execute requests interactively
4. View request/response schemas and examples

## Database Integration

### Stored Procedures

The API executes existing stored procedures:
- **Insert**: `sp_Insert{TableName}` with `@NewID OUTPUT` parameter
- **Update**: `sp_Update{TableName}` with all table columns
- **Delete**: `sp_Delete{TableName}` with `@ID` parameter
- **GetAll**: `sp_GetAll{TableName}` returns all records
- **GetByID**: `sp_GetByID{TableName}` with `@ID` parameter

### Connection Management

- Uses `SqlConnection` with automatic disposal
- Connection pooling enabled by default
- Windows Authentication for security
- TrustServerCertificate for local development

## Troubleshooting

### API won't start
- Verify .NET 9.0 Runtime is installed: `dotnet --info`
- Check connection string in appsettings.json
- Ensure SQL Server is running: `services.msc` → SQL Server (SQLEXPRESS01)

### Database connection errors
- Test SQL connection: `sqlcmd -S .\SQLEXPRESS01 -E`
- Verify database exists: `sqlcmd -S .\SQLEXPRESS01 -E -Q "SELECT name FROM sys.databases"`
- Check Windows Authentication is enabled

### 404 errors for endpoints
- Verify Swagger UI is accessible at root: http://localhost:5237/
- Check endpoint URL format: `/api/{tablename}` (lowercase)
- Ensure application started successfully (no build errors)

### Stored procedure errors
- Verify all 115 stored procedures exist in database
- Check procedure signatures match DTO properties
- Review stored procedure names follow pattern: `sp_Insert{TableName}`

## Performance

- **Dapper**: Near-ADO.NET performance with minimal overhead
- **Minimal API**: Reduced middleware pipeline for faster responses
- **Stored Procedures**: Optimized, pre-compiled database queries
- **Connection Pooling**: Reuses database connections efficiently

## Security Considerations

- **Windows Authentication**: No credentials in connection string
- **SQL Injection**: Protected by stored procedures and parameterized queries
- **Input Validation**: Consider adding FluentValidation for DTOs
- **Authentication/Authorization**: Consider adding JWT or API keys for production
- **HTTPS**: Enable SSL/TLS for production deployments
- **CORS**: Configure CORS policies if accessed from web applications

## License

Internal use only - RPA ALM Database API

## Support

For database schema or stored procedure questions, refer to:
- `MSSQL/CreateEntireDatabase.sql` - Complete database creation script
- `MSSQL/Crud*.sql` - All 115 stored procedure definitions
- `CLAUDE.md` - Project documentation and guidelines
