-- =============================================
-- CRUD Stored Procedures for Junction/Bridge Tables
-- RpaDataDev Database
-- =============================================

USE RpaDataDev;
GO

-- =============================================
-- ViAssignments CRUD Procedures
-- =============================================

-- Insert ViAssignments
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertViAssignments
    @VirtualIdentityID INT = NULL,
    @AutomationEnvironmentID INT = NULL,
    @Percentage INT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO ViAssignments (VirtualIdentityID, AutomationEnvironmentID,
                                    Percentage, StartDate, EndDate)
        VALUES (@VirtualIdentityID, @AutomationEnvironmentID,
                @Percentage, @StartDate, @EndDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update ViAssignments
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateViAssignments
    @ID INT,
    @VirtualIdentityID INT = NULL,
    @AutomationEnvironmentID INT = NULL,
    @Percentage INT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE ViAssignments
        SET VirtualIdentityID = @VirtualIdentityID,
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

-- Delete ViAssignments
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteViAssignments
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM ViAssignments WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All ViAssignments
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllViAssignments
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
           Percentage, StartDate, EndDate
    FROM ViAssignments
    ORDER BY ID;
END
GO

-- Get ViAssignments By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDViAssignments
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
           Percentage, StartDate, EndDate
    FROM ViAssignments
    WHERE ID = @ID;
END
GO

PRINT 'Junction table CRUD procedures created successfully (5 procedures).';
GO
