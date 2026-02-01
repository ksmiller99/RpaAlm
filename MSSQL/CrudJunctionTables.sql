-- =============================================
-- CRUD Stored Procedures for Junction Tables
-- ViAssignments: Links Virtual Identities to Automation Environments
-- =============================================

USE RpaAlmDev;
GO

-- =============================================
-- sp_InsertViAssignments
-- Inserts a new VI assignment record
-- Returns: NewID and RowsAffected
-- =============================================
CREATE OR ALTER PROCEDURE sp_InsertViAssignments
    @VirtualIdentityID INT,
    @AutomationEnvironmentID INT,
    @Percentage INT,
    @StartDate DATE,
    @EndDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO ViAssignments (
            VirtualIdentityID,
            AutomationEnvironmentID,
            Percentage,
            StartDate,
            EndDate
        )
        VALUES (
            @VirtualIdentityID,
            @AutomationEnvironmentID,
            @Percentage,
            @StartDate,
            @EndDate
        );

        SET @NewID = SCOPE_IDENTITY();

        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_UpdateViAssignments
-- Updates an existing VI assignment record
-- Returns: RowsAffected
-- =============================================
CREATE OR ALTER PROCEDURE sp_UpdateViAssignments
    @ID INT,
    @VirtualIdentityID INT,
    @AutomationEnvironmentID INT,
    @Percentage INT,
    @StartDate DATE,
    @EndDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE ViAssignments
        SET
            VirtualIdentityID = @VirtualIdentityID,
            AutomationEnvironmentID = @AutomationEnvironmentID,
            Percentage = @Percentage,
            StartDate = @StartDate,
            EndDate = @EndDate
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_DeleteViAssignments
-- Deletes a VI assignment record by ID
-- Returns: RowsAffected
-- =============================================
CREATE OR ALTER PROCEDURE sp_DeleteViAssignments
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
        DELETE FROM ViAssignments
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- sp_GetAllViAssignments
-- Retrieves all VI assignment records
-- Returns: All rows ordered by ID
-- =============================================
CREATE OR ALTER PROCEDURE sp_GetAllViAssignments
AS
BEGIN
    SELECT
        ID,
        VirtualIdentityID,
        AutomationEnvironmentID,
        Percentage,
        StartDate,
        EndDate
    FROM ViAssignments
    ORDER BY ID;
END
GO

-- =============================================
-- sp_GetByIDViAssignments
-- Retrieves a single VI assignment record by ID
-- Returns: Single row matching the ID
-- =============================================
CREATE OR ALTER PROCEDURE sp_GetByIDViAssignments
    @ID INT
AS
BEGIN
    SELECT
        ID,
        VirtualIdentityID,
        AutomationEnvironmentID,
        Percentage,
        StartDate,
        EndDate
    FROM ViAssignments
    WHERE ID = @ID;
END
GO
