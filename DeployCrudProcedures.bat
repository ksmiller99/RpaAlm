@echo off
REM =============================================
REM Deploy CRUD Stored Procedures
REM RpaDataDev Database
REM =============================================

echo.
echo ===================================
echo Deploying CRUD Stored Procedures
echo ===================================
echo.

set SERVER=localhost\SQLEXPRESS01

echo Connecting to SQL Server: %SERVER%
echo.

echo [1/4] Deploying Lookup Table CRUD procedures...
sqlcmd -S %SERVER% -E -d RpaAlmDev -i MSSQL\CrudLookupTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudLookupTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [2/4] Deploying Helper Table CRUD procedures...
sqlcmd -S %SERVER% -E -d RpaAlmDev -i MSSQL\CrudHelperTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudHelperTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [3/4] Deploying Main Table CRUD procedures...
sqlcmd -S %SERVER% -E -d RpaAlmDev -i MSSQL\CrudMainTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudMainTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [4/4] Deploying Junction Table CRUD procedures...
sqlcmd -S %SERVER% -E -d RpaAlmDev -i MSSQL\CrudJunctionTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudJunctionTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo ===================================
echo Deployment Complete!
echo ===================================
echo.
echo Total: 115 stored procedures deployed
echo   - 60 Lookup table procedures (12 tables)
echo   - 10 Helper table procedures (2 tables)
echo   - 40 Main entity procedures (8 tables)
echo   - 5 Junction table procedures (1 table)
echo.

pause
