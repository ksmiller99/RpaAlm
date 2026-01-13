-- =============================================
-- CRUD Stored Procedures for Lookup/Reference Tables
-- RpaDataDev Database
-- =============================================

USE RpaDataDev;
GO

-- =============================================
-- SlaItemType CRUD Procedures
-- =============================================

-- Insert SlaItemType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertSlaItemType
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @Cost INT = NULL,
    @Disabled INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO SlaItemType (Name, Description, Cost, Disabled)
        VALUES (@Name, @Description, @Cost, @Disabled);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update SlaItemType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateSlaItemType
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @Cost INT = NULL,
    @Disabled INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE SlaItemType
        SET Name = @Name,
            Description = @Description,
            Cost = @Cost,
            Disabled = @Disabled
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete SlaItemType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteSlaItemType
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM SlaItemType WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All SlaItemType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllSlaItemType
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, Description, Cost, Disabled
    FROM SlaItemType
    ORDER BY ID;
END
GO

-- Get SlaItemType By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDSlaItemType
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, Description, Cost, Disabled
    FROM SlaItemType
    WHERE ID = @ID;
END
GO

-- =============================================
-- Enhancement CRUD Procedures
-- =============================================

-- Insert Enhancement
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertEnhancement
    @Scope NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Enhancement (Scope)
        VALUES (@Scope);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Enhancement
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateEnhancement
    @ID INT,
    @Scope NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Enhancement
        SET Scope = @Scope
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Enhancement
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteEnhancement
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Enhancement WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Enhancement
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllEnhancement
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Scope
    FROM Enhancement
    ORDER BY ID;
END
GO

-- Get Enhancement By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDEnhancement
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Scope
    FROM Enhancement
    WHERE ID = @ID;
END
GO

-- =============================================
-- Complexity CRUD Procedures
-- =============================================

-- Insert Complexity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertComplexity
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Complexity (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Complexity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateComplexity
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Complexity
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Complexity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteComplexity
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Complexity WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Complexity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllComplexity
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Complexity
    ORDER BY ID;
END
GO

-- Get Complexity By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDComplexity
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Complexity
    WHERE ID = @ID;
END
GO

-- =============================================
-- Medal CRUD Procedures
-- =============================================

-- Insert Medal
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertMedal
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Medal (Name, Description)
        VALUES (@Name, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Medal
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateMedal
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Medal
        SET Name = @Name,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Medal
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteMedal
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Medal WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Medal
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllMedal
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, Description
    FROM Medal
    ORDER BY ID;
END
GO

-- Get Medal By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDMedal
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, Description
    FROM Medal
    WHERE ID = @ID;
END
GO

-- =============================================
-- Function CRUD Procedures
-- =============================================

-- Insert Function
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertFunction
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO [Function] (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Function
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateFunction
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE [Function]
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Function
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteFunction
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM [Function] WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Function
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllFunction
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM [Function]
    ORDER BY ID;
END
GO

-- Get Function By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDFunction
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM [Function]
    WHERE ID = @ID;
END
GO

-- =============================================
-- Region CRUD Procedures
-- =============================================

-- Insert Region
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertRegion
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Region (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Region
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateRegion
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Region
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Region
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteRegion
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Region WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Region
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllRegion
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Region
    ORDER BY ID;
END
GO

-- Get Region By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDRegion
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Region
    WHERE ID = @ID;
END
GO

-- =============================================
-- Segment CRUD Procedures
-- =============================================

-- Insert Segment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertSegment
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Segment (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Segment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateSegment
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Segment
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Segment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteSegment
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Segment WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Segment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllSegment
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Segment
    ORDER BY ID;
END
GO

-- Get Segment By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDSegment
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Segment
    WHERE ID = @ID;
END
GO

-- =============================================
-- Status CRUD Procedures
-- =============================================

-- Insert Status
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertStatus
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Status (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Status
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateStatus
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Status
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Status
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteStatus
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Status WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Status
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllStatus
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Status
    ORDER BY ID;
END
GO

-- Get Status By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDStatus
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM Status
    WHERE ID = @ID;
END
GO

-- =============================================
-- AutomationEnvironmentType CRUD Procedures
-- =============================================

-- Insert AutomationEnvironmentType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertAutomationEnvironmentType
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO AutomationEnvironmentType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update AutomationEnvironmentType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateAutomationEnvironmentType
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE AutomationEnvironmentType
        SET Code = @Code,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete AutomationEnvironmentType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteAutomationEnvironmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM AutomationEnvironmentType WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All AutomationEnvironmentType
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllAutomationEnvironmentType
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    ORDER BY ID;
END
GO

-- Get AutomationEnvironmentType By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDAutomationEnvironmentType
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    WHERE ID = @ID;
END
GO

-- =============================================
-- ADDomain CRUD Procedures
-- =============================================

-- Insert ADDomain
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertADDomain
    @Domain NVARCHAR(255) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO ADDomain (Domain, Description)
        VALUES (@Domain, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update ADDomain
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateADDomain
    @ID INT,
    @Domain NVARCHAR(255) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE ADDomain
        SET Domain = @Domain,
            Description = @Description
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete ADDomain
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteADDomain
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM ADDomain WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All ADDomain
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllADDomain
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Domain, Description
    FROM ADDomain
    ORDER BY ID;
END
GO

-- Get ADDomain By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDADDomain
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Domain, Description
    FROM ADDomain
    WHERE ID = @ID;
END
GO

-- =============================================
-- StoryPointCost CRUD Procedures
-- =============================================

-- Insert StoryPointCost
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertStoryPointCost
    @Points INT = NULL,
    @MaxHours INT = NULL,
    @TotalCost INT = NULL,
    @JnJCostShare INT = NULL,
    @EffectiveDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO StoryPointCost (Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate)
        VALUES (@Points, @MaxHours, @TotalCost, @JnJCostShare, @EffectiveDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update StoryPointCost
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateStoryPointCost
    @ID INT,
    @Points INT = NULL,
    @MaxHours INT = NULL,
    @TotalCost INT = NULL,
    @JnJCostShare INT = NULL,
    @EffectiveDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE StoryPointCost
        SET Points = @Points,
            MaxHours = @MaxHours,
            TotalCost = @TotalCost,
            JnJCostShare = @JnJCostShare,
            EffectiveDate = @EffectiveDate
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete StoryPointCost
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteStoryPointCost
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM StoryPointCost WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All StoryPointCost
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllStoryPointCost
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
    FROM StoryPointCost
    ORDER BY ID;
END
GO

-- Get StoryPointCost By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDStoryPointCost
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
    FROM StoryPointCost
    WHERE ID = @ID;
END
GO

PRINT 'Lookup/Reference table CRUD procedures created successfully (55 procedures).';
GO
