-- =============================================
-- CRUD Stored Procedures for Main Tables
-- =============================================
-- This file contains 40 stored procedures (5 per table) for 8 main tables
-- Each table has: Insert, Update, Delete, GetAll, GetByID
-- =============================================

USE RpaAlmDev;
GO

-- =============================================
-- Automation Procedures (1/8)
-- =============================================

-- Insert Automation
CREATE PROCEDURE sp_InsertAutomation
    @Name NVARCHAR(255),
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @RpaStatusID INT,
    @BtoJjedsID INT = NULL,
    @BoJjedsID INT = NULL,
    @FcJjedsID INT = NULL,
    @SseJjedsID INT = NULL,
    @LseJjedsID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO Automation (Name, SegmentID, RegionID, FunctionID, RpaStatusID, BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID)
        VALUES (@Name, @SegmentID, @RegionID, @FunctionID, @RpaStatusID, @BtoJjedsID, @BoJjedsID, @FcJjedsID, @SseJjedsID, @LseJjedsID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update Automation
CREATE PROCEDURE sp_UpdateAutomation
    @ID INT,
    @Name NVARCHAR(255),
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @RpaStatusID INT,
    @BtoJjedsID INT = NULL,
    @BoJjedsID INT = NULL,
    @FcJjedsID INT = NULL,
    @SseJjedsID INT = NULL,
    @LseJjedsID INT = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE Automation
        SET Name = @Name,
            SegmentID = @SegmentID,
            RegionID = @RegionID,
            FunctionID = @FunctionID,
            RpaStatusID = @RpaStatusID,
            BtoJjedsID = @BtoJjedsID,
            BoJjedsID = @BoJjedsID,
            FcJjedsID = @FcJjedsID,
            SseJjedsID = @SseJjedsID,
            LseJjedsID = @LseJjedsID
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete Automation
CREATE PROCEDURE sp_DeleteAutomation
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Automation
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll Automation
CREATE PROCEDURE sp_GetAllAutomation
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID, BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
    FROM Automation
    ORDER BY ID;
END;
GO

-- GetByID Automation
CREATE PROCEDURE sp_GetByIDAutomation
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID, BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
    FROM Automation
    WHERE ID = @ID;
END;
GO

-- =============================================
-- AutomationEnvironment Procedures (2/8)
-- =============================================

-- Insert AutomationEnvironment
CREATE PROCEDURE sp_InsertAutomationEnvironment
    @AutomationID INT,
    @CmdbID INT,
    @EnvironmentTypeID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AutomationEnvironment (AutomationID, CmdbID, EnvironmentTypeID)
        VALUES (@AutomationID, @CmdbID, @EnvironmentTypeID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update AutomationEnvironment
CREATE PROCEDURE sp_UpdateAutomationEnvironment
    @ID INT,
    @AutomationID INT,
    @CmdbID INT,
    @EnvironmentTypeID INT = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE AutomationEnvironment
        SET AutomationID = @AutomationID,
            CmdbID = @CmdbID,
            EnvironmentTypeID = @EnvironmentTypeID
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete AutomationEnvironment
CREATE PROCEDURE sp_DeleteAutomationEnvironment
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationEnvironment
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll AutomationEnvironment
CREATE PROCEDURE sp_GetAllAutomationEnvironment
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CmdbID, EnvironmentTypeID
    FROM AutomationEnvironment
    ORDER BY ID;
END;
GO

-- GetByID AutomationEnvironment
CREATE PROCEDURE sp_GetByIDAutomationEnvironment
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CmdbID, EnvironmentTypeID
    FROM AutomationEnvironment
    WHERE ID = @ID;
END;
GO

-- =============================================
-- AutomationLogEntry Procedures (3/8)
-- =============================================

-- Insert AutomationLogEntry
CREATE PROCEDURE sp_InsertAutomationLogEntry
    @AutomationID INT,
    @CreatedJjedsID INT,
    @CreatedDate DATE,
    @Comment NVARCHAR(MAX),
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AutomationLogEntry (AutomationID, CreatedJjedsID, CreatedDate, Comment)
        VALUES (@AutomationID, @CreatedJjedsID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update AutomationLogEntry
CREATE PROCEDURE sp_UpdateAutomationLogEntry
    @ID INT,
    @AutomationID INT,
    @CreatedJjedsID INT,
    @CreatedDate DATE,
    @Comment NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE AutomationLogEntry
        SET AutomationID = @AutomationID,
            CreatedJjedsID = @CreatedJjedsID,
            CreatedDate = @CreatedDate,
            Comment = @Comment
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete AutomationLogEntry
CREATE PROCEDURE sp_DeleteAutomationLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationLogEntry
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll AutomationLogEntry
CREATE PROCEDURE sp_GetAllAutomationLogEntry
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
    FROM AutomationLogEntry
    ORDER BY ID;
END;
GO

-- GetByID AutomationLogEntry
CREATE PROCEDURE sp_GetByIDAutomationLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
    FROM AutomationLogEntry
    WHERE ID = @ID;
END;
GO

-- =============================================
-- EnhancementUserStory Procedures (4/8)
-- =============================================

-- Insert EnhancementUserStory
CREATE PROCEDURE sp_InsertEnhancementUserStory
    @EnhancementID INT,
    @JiraIssue NVARCHAR(50),
    @JiraIssueDate DATETIME2,
    @StoryPoints INT,
    @JiraIssueLink NVARCHAR(500),
    @JiraIssueSummary NVARCHAR(MAX),
    @JiraIssueCost DECIMAL(19,4),
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO EnhancementUserStory (EnhancementID, JiraIssue, JiraIssueDate, StoryPoints, JiraIssueLink, JiraIssueSummary, JiraIssueCost)
        VALUES (@EnhancementID, @JiraIssue, @JiraIssueDate, @StoryPoints, @JiraIssueLink, @JiraIssueSummary, @JiraIssueCost);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update EnhancementUserStory
CREATE PROCEDURE sp_UpdateEnhancementUserStory
    @ID INT,
    @EnhancementID INT,
    @JiraIssue NVARCHAR(50),
    @JiraIssueDate DATETIME2,
    @StoryPoints INT,
    @JiraIssueLink NVARCHAR(500),
    @JiraIssueSummary NVARCHAR(MAX),
    @JiraIssueCost DECIMAL(19,4)
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE EnhancementUserStory
        SET EnhancementID = @EnhancementID,
            JiraIssue = @JiraIssue,
            JiraIssueDate = @JiraIssueDate,
            StoryPoints = @StoryPoints,
            JiraIssueLink = @JiraIssueLink,
            JiraIssueSummary = @JiraIssueSummary,
            JiraIssueCost = @JiraIssueCost
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete EnhancementUserStory
CREATE PROCEDURE sp_DeleteEnhancementUserStory
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM EnhancementUserStory
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll EnhancementUserStory
CREATE PROCEDURE sp_GetAllEnhancementUserStory
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, EnhancementID, JiraIssue, JiraIssueDate, StoryPoints, JiraIssueLink, JiraIssueSummary, JiraIssueCost
    FROM EnhancementUserStory
    ORDER BY ID;
END;
GO

-- GetByID EnhancementUserStory
CREATE PROCEDURE sp_GetByIDEnhancementUserStory
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, EnhancementID, JiraIssue, JiraIssueDate, StoryPoints, JiraIssueLink, JiraIssueSummary, JiraIssueCost
    FROM EnhancementUserStory
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SlaMaster Procedures (5/8)
-- =============================================

-- Insert SlaMaster
CREATE PROCEDURE sp_InsertSlaMaster
    @AutomationID INT,
    @ComplexityTypeID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE,
    @EndDate DATE,
    @BtoJjedsId INT,
    @BoJjedsId INT,
    @FcJjedsId INT,
    @SignatureStatus INT,
    @SignatureStatusDate DATETIME2,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaMaster (AutomationID, ComplexityTypeID, MedalID, Zcode, CostCenter, StartDate, EndDate, BtoJjedsId, BoJjedsId, FcJjedsId, SignatureStatus, SignatureStatusDate)
        VALUES (@AutomationID, @ComplexityTypeID, @MedalID, @Zcode, @CostCenter, @StartDate, @EndDate, @BtoJjedsId, @BoJjedsId, @FcJjedsId, @SignatureStatus, @SignatureStatusDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SlaMaster
CREATE PROCEDURE sp_UpdateSlaMaster
    @ID INT,
    @AutomationID INT,
    @ComplexityTypeID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE,
    @EndDate DATE,
    @BtoJjedsId INT,
    @BoJjedsId INT,
    @FcJjedsId INT,
    @SignatureStatus INT,
    @SignatureStatusDate DATETIME2
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SlaMaster
        SET AutomationID = @AutomationID,
            ComplexityTypeID = @ComplexityTypeID,
            MedalID = @MedalID,
            Zcode = @Zcode,
            CostCenter = @CostCenter,
            StartDate = @StartDate,
            EndDate = @EndDate,
            BtoJjedsId = @BtoJjedsId,
            BoJjedsId = @BoJjedsId,
            FcJjedsId = @FcJjedsId,
            SignatureStatus = @SignatureStatus,
            SignatureStatusDate = @SignatureStatusDate
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SlaMaster
CREATE PROCEDURE sp_DeleteSlaMaster
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaMaster
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SlaMaster
CREATE PROCEDURE sp_GetAllSlaMaster
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode, CostCenter, StartDate, EndDate, BtoJjedsId, BoJjedsId, FcJjedsId, SignatureStatus, SignatureStatusDate
    FROM SlaMaster
    ORDER BY ID;
END;
GO

-- GetByID SlaMaster
CREATE PROCEDURE sp_GetByIDSlaMaster
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode, CostCenter, StartDate, EndDate, BtoJjedsId, BoJjedsId, FcJjedsId, SignatureStatus, SignatureStatusDate
    FROM SlaMaster
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SlaItem Procedures (6/8)
-- =============================================

-- Insert SlaItem
CREATE PROCEDURE sp_InsertSlaItem
    @SlaMasterID INT,
    @SlaItemTypeID INT,
    @EnhancementID INT,
    @Quantity INT,
    @Cost DECIMAL(19,4),
    @Total DECIMAL(19,4),
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaItem (SlaMasterID, SlaItemTypeID, EnhancementID, Quantity, Cost, Total)
        VALUES (@SlaMasterID, @SlaItemTypeID, @EnhancementID, @Quantity, @Cost, @Total);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SlaItem
CREATE PROCEDURE sp_UpdateSlaItem
    @ID INT,
    @SlaMasterID INT,
    @SlaItemTypeID INT,
    @EnhancementID INT,
    @Quantity INT,
    @Cost DECIMAL(19,4),
    @Total DECIMAL(19,4)
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SlaItem
        SET SlaMasterID = @SlaMasterID,
            SlaItemTypeID = @SlaItemTypeID,
            EnhancementID = @EnhancementID,
            Quantity = @Quantity,
            Cost = @Cost,
            Total = @Total
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SlaItem
CREATE PROCEDURE sp_DeleteSlaItem
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaItem
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SlaItem
CREATE PROCEDURE sp_GetAllSlaItem
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID, Quantity, Cost, Total
    FROM SlaItem
    ORDER BY ID;
END;
GO

-- GetByID SlaItem
CREATE PROCEDURE sp_GetByIDSlaItem
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID, Quantity, Cost, Total
    FROM SlaItem
    WHERE ID = @ID;
END;
GO

-- =============================================
-- SlaLogEntry Procedures (7/8)
-- =============================================

-- Insert SlaLogEntry
CREATE PROCEDURE sp_InsertSlaLogEntry
    @SlaMasterID INT,
    @CreatedJjedsID INT,
    @CreatedDate DATE,
    @Comment NVARCHAR(MAX),
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaLogEntry (SlaMasterID, CreatedJjedsID, CreatedDate, Comment)
        VALUES (@SlaMasterID, @CreatedJjedsID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update SlaLogEntry
CREATE PROCEDURE sp_UpdateSlaLogEntry
    @ID INT,
    @SlaMasterID INT,
    @CreatedJjedsID INT,
    @CreatedDate DATE,
    @Comment NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE SlaLogEntry
        SET SlaMasterID = @SlaMasterID,
            CreatedJjedsID = @CreatedJjedsID,
            CreatedDate = @CreatedDate,
            Comment = @Comment
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete SlaLogEntry
CREATE PROCEDURE sp_DeleteSlaLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaLogEntry
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll SlaLogEntry
CREATE PROCEDURE sp_GetAllSlaLogEntry
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
    FROM SlaLogEntry
    ORDER BY ID;
END;
GO

-- GetByID SlaLogEntry
CREATE PROCEDURE sp_GetByIDSlaLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
    FROM SlaLogEntry
    WHERE ID = @ID;
END;
GO

-- =============================================
-- VirtualIdentity Procedures (8/8)
-- =============================================

-- Insert VirtualIdentity
CREATE PROCEDURE sp_InsertVirtualIdentity
    @JjedsID INT,
    @AdDomainID INT,
    @HostName NVARCHAR(255),
    @IPv4 NCHAR(15),
    @Created DATE,
    @Retired DATE,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO VirtualIdentity (JjedsID, AdDomainID, HostName, IPv4, Created, Retired)
        VALUES (@JjedsID, @AdDomainID, @HostName, @IPv4, @Created, @Retired);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS NewID, @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Update VirtualIdentity
CREATE PROCEDURE sp_UpdateVirtualIdentity
    @ID INT,
    @JjedsID INT,
    @AdDomainID INT,
    @HostName NVARCHAR(255),
    @IPv4 NCHAR(15),
    @Created DATE,
    @Retired DATE
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE VirtualIdentity
        SET JjedsID = @JjedsID,
            AdDomainID = @AdDomainID,
            HostName = @HostName,
            IPv4 = @IPv4,
            Created = @Created,
            Retired = @Retired
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- Delete VirtualIdentity
CREATE PROCEDURE sp_DeleteVirtualIdentity
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM VirtualIdentity
        WHERE ID = @ID;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- GetAll VirtualIdentity
CREATE PROCEDURE sp_GetAllVirtualIdentity
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, JjedsID, AdDomainID, HostName, IPv4, Created, Retired
    FROM VirtualIdentity
    ORDER BY ID;
END;
GO

-- GetByID VirtualIdentity
CREATE PROCEDURE sp_GetByIDVirtualIdentity
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, JjedsID, AdDomainID, HostName, IPv4, Created, Retired
    FROM VirtualIdentity
    WHERE ID = @ID;
END;
GO
