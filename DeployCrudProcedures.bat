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
sqlcmd -S %SERVER% -E -i CrudLookupTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudLookupTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [2/4] Deploying Helper Table CRUD procedures...
sqlcmd -S %SERVER% -E -i CrudHelperTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudHelperTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [3/4] Deploying Main Table CRUD procedures...
sqlcmd -S %SERVER% -E -i CrudMainTables.sql
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to deploy CrudMainTables.sql
    pause
    exit /b 1
)
echo Done.
echo.

echo [4/4] Deploying Junction Table CRUD procedures...
sqlcmd -S %SERVER% -E -i CrudJunctionTables.sql
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
echo Total: 110 stored procedures deployed
echo   - 55 Lookup table procedures
echo   - 10 Helper table procedures
echo   - 40 Main entity procedures
echo   - 5 Junction table procedures
echo.

pause
