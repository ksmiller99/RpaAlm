-- =============================================
-- CRUD Stored Procedures for Lookup Tables
-- =============================================
-- This file contains 60 stored procedures (5 per table) for 12 lookup tables
-- Each table has: Insert, Update, Delete, GetAll, GetByID
-- =============================================

USE RpaAlmDev;
GO

-- =============================================
-- AdDomainType Procedures (1/12)
-- =============================================

-- Insert AdDomainType
CREATE PROCEDURE sp_InsertAdDomainType
    @Code NVARCHAR(255),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AdDomainType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update AdDomainType
CREATE PROCEDURE sp_UpdateAdDomainType
    @ID INT,
    @Code NVARCHAR(255),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE AdDomainType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete AdDomainType
CREATE PROCEDURE sp_DeleteAdDomainType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AdDomainType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll AdDomainType
CREATE PROCEDURE sp_GetAllAdDomainType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AdDomainType
    ORDER BY ID;
END;
GO

-- GetByID AdDomainType
CREATE PROCEDURE sp_GetByIDAdDomainType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AdDomainType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- AutomationEnvironmentType Procedures (2/12)
-- =============================================

-- Insert AutomationEnvironmentType
CREATE PROCEDURE sp_InsertAutomationEnvironmentType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AutomationEnvironmentType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update AutomationEnvironmentType
CREATE PROCEDURE sp_UpdateAutomationEnvironmentType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE AutomationEnvironmentType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete AutomationEnvironmentType
CREATE PROCEDURE sp_DeleteAutomationEnvironmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationEnvironmentType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll AutomationEnvironmentType
CREATE PROCEDURE sp_GetAllAutomationEnvironmentType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    ORDER BY ID;
END;
GO

-- GetByID AutomationEnvironmentType
CREATE PROCEDURE sp_GetByIDAutomationEnvironmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- ComplexityType Procedures (3/12)
-- =============================================

-- Insert ComplexityType
CREATE PROCEDURE sp_InsertComplexityType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO ComplexityType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update ComplexityType
CREATE PROCEDURE sp_UpdateComplexityType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE ComplexityType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete ComplexityType
CREATE PROCEDURE sp_DeleteComplexityType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM ComplexityType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll ComplexityType
CREATE PROCEDURE sp_GetAllComplexityType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM ComplexityType
    ORDER BY ID;
END;
GO

-- GetByID ComplexityType
CREATE PROCEDURE sp_GetByIDComplexityType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM ComplexityType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- FunctionType Procedures (4/12)
-- =============================================

-- Insert FunctionType
CREATE PROCEDURE sp_InsertFunctionType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO FunctionType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update FunctionType
CREATE PROCEDURE sp_UpdateFunctionType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE FunctionType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete FunctionType
CREATE PROCEDURE sp_DeleteFunctionType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM FunctionType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll FunctionType
CREATE PROCEDURE sp_GetAllFunctionType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM FunctionType
    ORDER BY ID;
END;
GO

-- GetByID FunctionType
CREATE PROCEDURE sp_GetByIDFunctionType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM FunctionType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- MedalType Procedures (5/12)
-- =============================================

-- Insert MedalType
CREATE PROCEDURE sp_InsertMedalType
    @Code NVARCHAR(255),
    @Description NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO MedalType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update MedalType
CREATE PROCEDURE sp_UpdateMedalType
    @ID INT,
    @Code NVARCHAR(255),
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE MedalType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete MedalType
CREATE PROCEDURE sp_DeleteMedalType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM MedalType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll MedalType
CREATE PROCEDURE sp_GetAllMedalType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM MedalType
    ORDER BY ID;
END;
GO

-- GetByID MedalType
CREATE PROCEDURE sp_GetByIDMedalType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM MedalType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- RegionType Procedures (6/12)
-- =============================================

-- Insert RegionType
CREATE PROCEDURE sp_InsertRegionType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO RegionType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update RegionType
CREATE PROCEDURE sp_UpdateRegionType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE RegionType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete RegionType
CREATE PROCEDURE sp_DeleteRegionType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM RegionType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll RegionType
CREATE PROCEDURE sp_GetAllRegionType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RegionType
    ORDER BY ID;
END;
GO

-- GetByID RegionType
CREATE PROCEDURE sp_GetByIDRegionType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RegionType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SegmentType Procedures (7/12)
-- =============================================

-- Insert SegmentType
CREATE PROCEDURE sp_InsertSegmentType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SegmentType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SegmentType
CREATE PROCEDURE sp_UpdateSegmentType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SegmentType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SegmentType
CREATE PROCEDURE sp_DeleteSegmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SegmentType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SegmentType
CREATE PROCEDURE sp_GetAllSegmentType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM SegmentType
    ORDER BY ID;
END;
GO

-- GetByID SegmentType
CREATE PROCEDURE sp_GetByIDSegmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM SegmentType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- RpaStatusType Procedures (8/12)
-- =============================================

-- Insert RpaStatusType
CREATE PROCEDURE sp_InsertRpaStatusType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO RpaStatusType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update RpaStatusType
CREATE PROCEDURE sp_UpdateRpaStatusType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE RpaStatusType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete RpaStatusType
CREATE PROCEDURE sp_DeleteRpaStatusType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM RpaStatusType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll RpaStatusType
CREATE PROCEDURE sp_GetAllRpaStatusType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RpaStatusType
    ORDER BY ID;
END;
GO

-- GetByID RpaStatusType
CREATE PROCEDURE sp_GetByIDRpaStatusType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RpaStatusType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SlaSignatureStatusType Procedures (9/12)
-- =============================================

-- Insert SlaSignatureStatusType
CREATE PROCEDURE sp_InsertSlaSignatureStatusType
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaSignatureStatusType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SlaSignatureStatusType
CREATE PROCEDURE sp_UpdateSlaSignatureStatusType
    @ID INT,
    @Code NVARCHAR(50),
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SlaSignatureStatusType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SlaSignatureStatusType
CREATE PROCEDURE sp_DeleteSlaSignatureStatusType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaSignatureStatusType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SlaSignatureStatusType
CREATE PROCEDURE sp_GetAllSlaSignatureStatusType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM SlaSignatureStatusType
    ORDER BY ID;
END;
GO

-- GetByID SlaSignatureStatusType
CREATE PROCEDURE sp_GetByIDSlaSignatureStatusType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM SlaSignatureStatusType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SlaItemType Procedures (10/12)
-- =============================================

-- Insert SlaItemType
CREATE PROCEDURE sp_InsertSlaItemType
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Cost DECIMAL(19,4),
    @EffectiveDate DATE,
    @Disabled BIT,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaItemType (Name, Description, Cost, EffectiveDate, Disabled)
        VALUES (@Name, @Description, @Cost, @EffectiveDate, @Disabled);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SlaItemType
CREATE PROCEDURE sp_UpdateSlaItemType
    @ID INT,
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Cost DECIMAL(19,4),
    @EffectiveDate DATE,
    @Disabled BIT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SlaItemType
        SET Name = @Name,
            Description = @Description,
            Cost = @Cost,
            EffectiveDate = @EffectiveDate,
            Disabled = @Disabled
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SlaItemType
CREATE PROCEDURE sp_DeleteSlaItemType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaItemType
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SlaItemType
CREATE PROCEDURE sp_GetAllSlaItemType
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description, Cost, EffectiveDate, Disabled
    FROM SlaItemType
    ORDER BY ID;
END;
GO

-- GetByID SlaItemType
CREATE PROCEDURE sp_GetByIDSlaItemType
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description, Cost, EffectiveDate, Disabled
    FROM SlaItemType
    WHERE ID = @ID;
END;
GO

-- =============================================
-- Enhancement Procedures (11/12)
-- =============================================

-- Insert Enhancement
CREATE PROCEDURE sp_InsertEnhancement
    @Scope NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO Enhancement (Scope)
        VALUES (@Scope);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update Enhancement
CREATE PROCEDURE sp_UpdateEnhancement
    @ID INT,
    @Scope NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE Enhancement
        SET Scope = @Scope
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete Enhancement
CREATE PROCEDURE sp_DeleteEnhancement
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Enhancement
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll Enhancement
CREATE PROCEDURE sp_GetAllEnhancement
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Scope
    FROM Enhancement
    ORDER BY ID;
END;
GO

-- GetByID Enhancement
CREATE PROCEDURE sp_GetByIDEnhancement
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Scope
    FROM Enhancement
    WHERE ID = @ID;
END;
GO

-- =============================================
-- StoryPointCost Procedures (12/12)
-- =============================================

-- Insert StoryPointCost
CREATE PROCEDURE sp_InsertStoryPointCost
    @Points INT,
    @MaxHours INT,
    @TotalCost DECIMAL(19,4),
    @JnJCostPercentage INT,
    @EffectiveDate DATE,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO StoryPointCost (Points, MaxHours, TotalCost, JnJCostPercentage, EffectiveDate)
        VALUES (@Points, @MaxHours, @TotalCost, @JnJCostPercentage, @EffectiveDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update StoryPointCost
CREATE PROCEDURE sp_UpdateStoryPointCost
    @ID INT,
    @Points INT,
    @MaxHours INT,
    @TotalCost DECIMAL(19,4),
    @JnJCostPercentage INT,
    @EffectiveDate DATE
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE StoryPointCost
        SET Points = @Points,
            MaxHours = @MaxHours,
            TotalCost = @TotalCost,
            JnJCostPercentage = @JnJCostPercentage,
            EffectiveDate = @EffectiveDate
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete StoryPointCost
CREATE PROCEDURE sp_DeleteStoryPointCost
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM StoryPointCost
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll StoryPointCost
CREATE PROCEDURE sp_GetAllStoryPointCost
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostPercentage, EffectiveDate
    FROM StoryPointCost
    ORDER BY ID;
END;
GO

-- GetByID StoryPointCost
CREATE PROCEDURE sp_GetByIDStoryPointCost
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostPercentage, EffectiveDate
    FROM StoryPointCost
    WHERE ID = @ID;
END;
GO
