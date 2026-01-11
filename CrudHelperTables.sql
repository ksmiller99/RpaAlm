-- =============================================
-- CRUD Stored Procedures for Helper Tables
-- RpaDataDev Database
-- Note: These tables use non-INT primary keys
-- =============================================

USE RpaDataDev;
GO

-- =============================================
-- JjedsHelper CRUD Procedures (WWID is PK)
-- =============================================

-- Insert JjedsHelper
CREATE OR ALTER PROCEDURE sp_InsertJjedsHelper
    @WWID NVARCHAR(9),
    @CommonName NVARCHAR(255) = NULL,
    @Email NVARCHAR(255) = NULL,
    @JjedsCreated DATE = NULL,
    @JjedsLastChanged DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO JjedsHelper (WWID, CommonName, Email, JjedsCreated, JjedsLastChanged)
        VALUES (@WWID, @CommonName, @Email, @JjedsCreated, @JjedsLastChanged);

        SELECT @WWID AS WWID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update JjedsHelper
CREATE OR ALTER PROCEDURE sp_UpdateJjedsHelper
    @WWID NVARCHAR(9),
    @CommonName NVARCHAR(255) = NULL,
    @Email NVARCHAR(255) = NULL,
    @JjedsCreated DATE = NULL,
    @JjedsLastChanged DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE JjedsHelper
        SET CommonName = @CommonName,
            Email = @Email,
            JjedsCreated = @JjedsCreated,
            JjedsLastChanged = @JjedsLastChanged
        WHERE WWID = @WWID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete JjedsHelper
CREATE OR ALTER PROCEDURE sp_DeleteJjedsHelper
    @WWID NVARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM JjedsHelper WHERE WWID = @WWID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All JjedsHelper
CREATE OR ALTER PROCEDURE sp_GetAllJjedsHelper
AS
BEGIN
    SET NOCOUNT ON;
    SELECT WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    ORDER BY WWID;
END
GO

-- Get JjedsHelper By WWID
CREATE OR ALTER PROCEDURE sp_GetByIDJjedsHelper
    @WWID NVARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    WHERE WWID = @WWID;
END
GO

-- =============================================
-- CmdbHelper CRUD Procedures (AppID is PK)
-- =============================================

-- Insert CmdbHelper
CREATE OR ALTER PROCEDURE sp_InsertCmdbHelper
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255) = NULL,
    @Zcode NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO CmdbHelper (AppID, Name, Zcode)
        VALUES (@AppID, @Name, @Zcode);

        SELECT @AppID AS AppID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update CmdbHelper
CREATE OR ALTER PROCEDURE sp_UpdateCmdbHelper
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255) = NULL,
    @Zcode NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE CmdbHelper
        SET Name = @Name,
            Zcode = @Zcode
        WHERE AppID = @AppID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete CmdbHelper
CREATE OR ALTER PROCEDURE sp_DeleteCmdbHelper
    @AppID NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM CmdbHelper WHERE AppID = @AppID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All CmdbHelper
CREATE OR ALTER PROCEDURE sp_GetAllCmdbHelper
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AppID, Name, Zcode
    FROM CmdbHelper
    ORDER BY AppID;
END
GO

-- Get CmdbHelper By AppID
CREATE OR ALTER PROCEDURE sp_GetByIDCmdbHelper
    @AppID NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AppID, Name, Zcode
    FROM CmdbHelper
    WHERE AppID = @AppID;
END
GO

PRINT 'Helper table CRUD procedures created successfully (10 procedures).';
GO
