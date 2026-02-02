-- =============================================
-- CRUD Stored Procedures for Helper Tables
-- JjedsHelper and CmdbHelper
-- =============================================

USE RpaAlmDev;
GO

-- =============================================
-- JjedsHelper Table Procedures
-- =============================================

-- sp_InsertJjedsHelper
-- Inserts a new employee record from JJEDS cache
-- Returns: NewID and RowsAffected
-- =============================================
CREATE PROCEDURE sp_InsertJjedsHelper
    @WWID NVARCHAR(9),
    @CommonName NVARCHAR(255),
    @Email NVARCHAR(255),
    @JjedsCreated DATETIME2,
    @JjedsLastChanged DATETIME2,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        INSERT INTO JjedsHelper (WWID, CommonName, Email, JjedsCreated, JjedsLastChanged)
        VALUES (@WWID, @CommonName, @Email, @JjedsCreated, @JjedsLastChanged);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_UpdateJjedsHelper
-- Updates an existing JJEDS employee record
-- Returns: RowsAffected
-- =============================================
CREATE PROCEDURE sp_UpdateJjedsHelper
    @ID INT,
    @WWID NVARCHAR(9),
    @CommonName NVARCHAR(255),
    @Email NVARCHAR(255),
    @JjedsCreated DATETIME2,
    @JjedsLastChanged DATETIME2
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        UPDATE JjedsHelper
        SET WWID = @WWID,
            CommonName = @CommonName,
            Email = @Email,
            JjedsCreated = @JjedsCreated,
            JjedsLastChanged = @JjedsLastChanged
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_DeleteJjedsHelper
-- Deletes a JJEDS employee record by ID
-- Returns: RowsAffected
-- =============================================
CREATE PROCEDURE sp_DeleteJjedsHelper
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        DELETE FROM JjedsHelper
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_GetAllJjedsHelper
-- Returns all JJEDS employee records ordered by ID
-- =============================================
CREATE PROCEDURE sp_GetAllJjedsHelper
AS
BEGIN
    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    ORDER BY ID;
END
GO

-- =============================================
-- sp_GetByIDJjedsHelper
-- Returns a single JJEDS employee record by ID
-- =============================================
CREATE PROCEDURE sp_GetByIDJjedsHelper
    @ID INT
AS
BEGIN
    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    WHERE ID = @ID;
END
GO

-- =============================================
-- CmdbHelper Table Procedures
-- =============================================

-- sp_InsertCmdbHelper
-- Inserts a new CMDB application record
-- Returns: NewID and RowsAffected
-- =============================================
CREATE PROCEDURE sp_InsertCmdbHelper
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255),
    @Zcode NVARCHAR(50),
    @OperationalStatus NVARCHAR(50),
    @CmdbUpdated DATETIME2,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        INSERT INTO CmdbHelper (AppID, Name, Zcode, OperationalStatus, CmdbUpdated)
        VALUES (@AppID, @Name, @Zcode, @OperationalStatus, @CmdbUpdated);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_UpdateCmdbHelper
-- Updates an existing CMDB application record
-- Returns: RowsAffected
-- =============================================
CREATE PROCEDURE sp_UpdateCmdbHelper
    @ID INT,
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255),
    @Zcode NVARCHAR(50),
    @OperationalStatus NVARCHAR(50),
    @CmdbUpdated DATETIME2
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        UPDATE CmdbHelper
        SET AppID = @AppID,
            Name = @Name,
            Zcode = @Zcode,
            OperationalStatus = @OperationalStatus,
            CmdbUpdated = @CmdbUpdated
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_DeleteCmdbHelper
-- Deletes a CMDB application record by ID
-- Returns: RowsAffected
-- =============================================
CREATE PROCEDURE sp_DeleteCmdbHelper
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        DELETE FROM CmdbHelper
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_GetAllCmdbHelper
-- Returns all CMDB application records ordered by ID
-- =============================================
CREATE PROCEDURE sp_GetAllCmdbHelper
AS
BEGIN
    SELECT ID, AppID, Name, Zcode, OperationalStatus, CmdbUpdated
    FROM CmdbHelper
    ORDER BY ID;
END
GO

-- =============================================
-- sp_GetByIDCmdbHelper
-- Returns a single CMDB application record by ID
-- =============================================
CREATE PROCEDURE sp_GetByIDCmdbHelper
    @ID INT
AS
BEGIN
    SELECT ID, AppID, Name, Zcode, OperationalStatus, CmdbUpdated
    FROM CmdbHelper
    WHERE ID = @ID;
END
GO
