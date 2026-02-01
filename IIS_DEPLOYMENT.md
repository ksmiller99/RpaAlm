# IIS Deployment Guide for RPA ALM API

## Prerequisites

1. **IIS with ASP.NET Core Hosting Bundle**
   - Install IIS (Internet Information Services)
   - Install .NET 9.0 Runtime and ASP.NET Core Hosting Bundle from https://dotnet.microsoft.com/download
   - Restart IIS after installation: `iisreset`

2. **SQL Server Access**
   - Ensure SQL Server Express is running at `.\SQLEXPRESS01`
   - Database `RpaAlmDev` should be created with all stored procedures

## Deployment Steps

### 1. Publish the Application

```bash
cd C:\Claude\RpaAlmApi\src\RpaAlmApi
dotnet publish -c Release -p:PublishProfile=IIS
```

This will publish to: `C:\Claude\RpaAlmApi\src\RpaAlmApi\bin\Release\net10.0\publish\`

### 2. Copy Files to IIS Directory

Option A - Use the built-in publish target (recommended):
```bash
# Files will be published to C:\inetpub\wwwroot\RpaAlmApi
dotnet publish -c Release -p:PublishProfile=IIS
```

Option B - Manual copy:
```bash
# Create directory
mkdir C:\inetpub\wwwroot\RpaAlmApi

# Copy published files
xcopy /E /I /Y "C:\Claude\RpaAlmApi\src\RpaAlmApi\bin\Release\net10.0\publish\*" "C:\inetpub\wwwroot\RpaAlmApi\"
```

### 3. Create IIS Application Pool

1. Open **IIS Manager** (inetmgr)
2. Right-click **Application Pools** → **Add Application Pool**
   - **Name**: RpaAlmApiPool
   - **.NET CLR Version**: No Managed Code
   - **Managed Pipeline Mode**: Integrated
   - Click **OK**
3. Select **RpaAlmApiPool** → **Advanced Settings**
   - **Identity**: ApplicationPoolIdentity (default) or custom service account

### 4. Create IIS Website or Application

#### Option A: Create as Website (Recommended for dedicated domain/port)
1. Right-click **Sites** → **Add Website**
   - **Site name**: RpaAlmApi
   - **Application pool**: RpaAlmApiPool
   - **Physical path**: C:\inetpub\wwwroot\RpaAlmApi
   - **Binding**:
     - Type: http
     - IP Address: All Unassigned
     - Port: 8080 (or your preferred port)
     - Host name: (leave blank or enter domain)
   - Click **OK**

#### Option B: Create as Application under Default Web Site
1. Expand **Sites** → **Default Web Site**
2. Right-click **Default Web Site** → **Add Application**
   - **Alias**: RpaAlmApi
   - **Application pool**: RpaAlmApiPool
   - **Physical path**: C:\inetpub\wwwroot\RpaAlmApi
   - Click **OK**

### 5. Configure SQL Server Permissions

The IIS Application Pool identity needs access to SQL Server:

```sql
-- Run in SQL Server Management Studio or sqlcmd
USE master;
GO

-- Create login for IIS AppPool (use the correct AppPool name)
CREATE LOGIN [IIS APPPOOL\RpaAlmApiPool] FROM WINDOWS;
GO

USE RpaAlmDev;
GO

-- Create user and grant permissions
CREATE USER [IIS APPPOOL\RpaAlmApiPool] FOR LOGIN [IIS APPPOOL\RpaAlmApiPool];
GO

ALTER ROLE db_datareader ADD MEMBER [IIS APPPOOL\RpaAlmApiPool];
ALTER ROLE db_datawriter ADD MEMBER [IIS APPPOOL\RpaAlmApiPool];
ALTER ROLE db_ddladmin ADD MEMBER [IIS APPPOOL\RpaAlmApiPool];
GRANT EXECUTE TO [IIS APPPOOL\RpaAlmApiPool];
GO
```

Or via command line:
```bash
sqlcmd -S .\SQLEXPRESS01 -E -Q "USE master; CREATE LOGIN [IIS APPPOOL\RpaAlmApiPool] FROM WINDOWS;"
sqlcmd -S .\SQLEXPRESS01 -E -Q "USE RpaAlmDev; CREATE USER [IIS APPPOOL\RpaAlmApiPool] FOR LOGIN [IIS APPPOOL\RpaAlmApiPool]; ALTER ROLE db_datareader ADD MEMBER [IIS APPPOOL\RpaAlmApiPool]; ALTER ROLE db_datawriter ADD MEMBER [IIS APPPOOL\RpaAlmApiPool]; GRANT EXECUTE TO [IIS APPPOOL\RpaAlmApiPool];"
```

### 6. Verify Deployment

1. **Start the Application Pool and Site**
   - In IIS Manager, ensure the site and app pool are started

2. **Test Endpoints**
   ```bash
   # If deployed as website on port 8080
   curl http://localhost:8080/api/addomain

   # If deployed as application under Default Web Site
   curl http://localhost/RpaAlmApi/api/addomain
   ```

3. **Access Swagger UI**
   - Website: http://localhost:8080/
   - Application: http://localhost/RpaAlmApi/

### 7. Troubleshooting

#### Check Application Logs
Logs are written to: `C:\inetpub\wwwroot\RpaAlmApi\logs\stdout_*.log`

#### Common Issues

**500.19 Error - Configuration Error**
- Ensure ASP.NET Core Hosting Bundle is installed
- Run `iisreset` after installing

**500.30 Error - ANCM In-Process Start Failure**
- Check that .NET 9.0 Runtime is installed
- Verify web.config is correct
- Check stdout logs for detailed error

**SQL Connection Errors**
- Verify SQL Server is running: `services.msc` → SQL Server (SQLEXPRESS01)
- Verify connection string in appsettings.Production.json
- Ensure IIS AppPool identity has database permissions
- Test connection: `sqlcmd -S .\SQLEXPRESS01 -E`

**403 Forbidden**
- Check folder permissions on C:\inetpub\wwwroot\RpaAlmApi
- Ensure IIS_IUSRS has read permissions

**404 Not Found (Swagger UI)**
- Verify files are published correctly
- Check IIS bindings and application path
- Ensure Swagger is configured in Program.cs

## API Endpoints

The API exposes 115 endpoints across 23 tables:

### Base URL
- **Website**: `http://localhost:8080/api`
- **Application**: `http://localhost/RpaAlmApi/api`

### Endpoint Pattern
```
GET    /api/{tablename}       → Get all records
GET    /api/{tablename}/{id}  → Get record by ID
POST   /api/{tablename}       → Create new record
PUT    /api/{tablename}/{id}  → Update record
DELETE /api/{tablename}/{id}  → Delete record
```

### Available Tables (23)

**Lookup Tables (12)**
- /api/addomain
- /api/automationenvironmenttype
- /api/complexitytype
- /api/functiontype
- /api/medaltype
- /api/regiontype
- /api/segmenttype
- /api/rpastatustype
- /api/slasignaturestatustype
- /api/slaitemtype
- /api/enhancement
- /api/storypointcost

**Helper Tables (2)**
- /api/jjedshelper
- /api/cmdbhelper

**Main Tables (8)**
- /api/automation
- /api/automationenvironment
- /api/automationlogentry
- /api/enhancementuserstory
- /api/slamaster
- /api/slaitem
- /api/slalogentry
- /api/virtualidentity

**Junction Tables (1)**
- /api/viassignments

## Configuration Files

### appsettings.Production.json
Located at: `C:\inetpub\wwwroot\RpaAlmApi\appsettings.Production.json`

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Warning",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "RpaAlmDev": "Server=.\\SQLEXPRESS01;Database=RpaAlmDev;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

### web.config
Located at: `C:\inetpub\wwwroot\RpaAlmApi\web.config`

This file is automatically generated during publish and configures the ASP.NET Core Module.

## Security Considerations

1. **Use HTTPS in Production**
   - Configure SSL certificate in IIS
   - Update bindings to use port 443
   - Redirect HTTP to HTTPS

2. **Restrict Network Access**
   - Configure firewall rules
   - Use Windows Authentication if needed
   - Consider API authentication/authorization

3. **Database Security**
   - Use principle of least privilege for database access
   - Consider using SQL Server authentication with encrypted connections
   - Audit database access

## Maintenance

### Updating the API
```bash
# 1. Stop the application pool
# 2. Publish new version
cd C:\Claude\RpaAlmApi\src\RpaAlmApi
dotnet publish -c Release -p:PublishProfile=IIS

# 3. Start the application pool
```

### Monitor Logs
```bash
# View latest log
Get-Content C:\inetpub\wwwroot\RpaAlmApi\logs\stdout_*.log -Tail 50
```

### Restart Application
```powershell
# PowerShell
Restart-WebAppPool -Name RpaAlmApiPool
```

## Performance Tuning

1. **Application Pool Settings**
   - Regular Time Interval: 1740 minutes (29 hours) - prevents automatic recycle
   - Idle Time-out: 0 (no timeout) - keeps app always running
   - Maximum Worker Processes: 1 (or more for high load)

2. **Database Connection Pooling**
   - Enabled by default in the connection string
   - Monitor connection pool performance

3. **Enable Response Compression**
   - Consider adding response compression middleware for large datasets

## Support

For issues or questions:
- Check logs at C:\inetpub\wwwroot\RpaAlmApi\logs\
- Review IIS Event Viewer logs
- Test database connectivity with sqlcmd
- Verify .NET Runtime installation with `dotnet --info`
