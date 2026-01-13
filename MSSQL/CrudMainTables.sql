-- =============================================
-- CRUD Stored Procedures for Main Entity Tables
-- RpaDataDev Database
-- =============================================

USE RpaDataDev;
GO

-- =============================================
-- Automation CRUD Procedures
-- =============================================

-- Insert Automation
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertAutomation
    @Name NVARCHAR(255) = NULL,
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @StatusID INT = NULL,
    @BtoWWID NVARCHAR(9) = NULL,
    @BoWWID NVARCHAR(9) = NULL,
    @FcWWID NVARCHAR(9) = NULL,
    @BuildZcode NVARCHAR(50) = NULL,
    @BuildCostCenter NVARCHAR(50) = NULL,
    @SseWWID NVARCHAR(9) = NULL,
    @LseWWID NVARCHAR(9) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Automation (Name, SegmentID, RegionID, FunctionID, StatusID,
                                BtoWWID, BoWWID, FcWWID, BuildZcode, BuildCostCenter,
                                SseWWID, LseWWID)
        VALUES (@Name, @SegmentID, @RegionID, @FunctionID, @StatusID,
                @BtoWWID, @BoWWID, @FcWWID, @BuildZcode, @BuildCostCenter,
                @SseWWID, @LseWWID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update Automation
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateAutomation
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @StatusID INT = NULL,
    @BtoWWID NVARCHAR(9) = NULL,
    @BoWWID NVARCHAR(9) = NULL,
    @FcWWID NVARCHAR(9) = NULL,
    @BuildZcode NVARCHAR(50) = NULL,
    @BuildCostCenter NVARCHAR(50) = NULL,
    @SseWWID NVARCHAR(9) = NULL,
    @LseWWID NVARCHAR(9) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Automation
        SET Name = @Name,
            SegmentID = @SegmentID,
            RegionID = @RegionID,
            FunctionID = @FunctionID,
            StatusID = @StatusID,
            BtoWWID = @BtoWWID,
            BoWWID = @BoWWID,
            FcWWID = @FcWWID,
            BuildZcode = @BuildZcode,
            BuildCostCenter = @BuildCostCenter,
            SseWWID = @SseWWID,
            LseWWID = @LseWWID
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete Automation
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteAutomation
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM Automation WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All Automation
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllAutomation
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, StatusID,
           BtoWWID, BoWWID, FcWWID, BuildZcode, BuildCostCenter,
           SseWWID, LseWWID
    FROM Automation
    ORDER BY ID;
END
GO

-- Get Automation By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDAutomation
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, StatusID,
           BtoWWID, BoWWID, FcWWID, BuildZcode, BuildCostCenter,
           SseWWID, LseWWID
    FROM Automation
    WHERE ID = @ID;
END
GO

-- =============================================
-- SlaMaster CRUD Procedures
-- =============================================

-- Insert SlaMaster
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertSlaMaster
    @AutomationID INT = NULL,
    @ComplexityID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO SlaMaster (AutomationID, ComplexityID, MedalID, Zcode,
                               CostCenter, StartDate, EndDate)
        VALUES (@AutomationID, @ComplexityID, @MedalID, @Zcode,
                @CostCenter, @StartDate, @EndDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update SlaMaster
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateSlaMaster
    @ID INT,
    @AutomationID INT = NULL,
    @ComplexityID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE SlaMaster
        SET AutomationID = @AutomationID,
            ComplexityID = @ComplexityID,
            MedalID = @MedalID,
            Zcode = @Zcode,
            CostCenter = @CostCenter,
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

-- Delete SlaMaster
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteSlaMaster
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM SlaMaster WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All SlaMaster
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllSlaMaster
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, ComplexityID, MedalID, Zcode,
           CostCenter, StartDate, EndDate
    FROM SlaMaster
    ORDER BY ID;
END
GO

-- Get SlaMaster By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDSlaMaster
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, ComplexityID, MedalID, Zcode,
           CostCenter, StartDate, EndDate
    FROM SlaMaster
    WHERE ID = @ID;
END
GO

-- =============================================
-- SlaItem CRUD Procedures
-- =============================================

-- Insert SlaItem
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertSlaItem
    @SlaMasterID INT = NULL,
    @SlaItemTypeID INT = NULL,
    @EnhancementID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO SlaItem (SlaMasterID, SlaItemTypeID, EnhancementID)
        VALUES (@SlaMasterID, @SlaItemTypeID, @EnhancementID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update SlaItem
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateSlaItem
    @ID INT,
    @SlaMasterID INT = NULL,
    @SlaItemTypeID INT = NULL,
    @EnhancementID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE SlaItem
        SET SlaMasterID = @SlaMasterID,
            SlaItemTypeID = @SlaItemTypeID,
            EnhancementID = @EnhancementID
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete SlaItem
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteSlaItem
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM SlaItem WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All SlaItem
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllSlaItem
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
    FROM SlaItem
    ORDER BY ID;
END
GO

-- Get SlaItem By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDSlaItem
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
    FROM SlaItem
    WHERE ID = @ID;
END
GO

-- =============================================
-- EnhancementUserStory CRUD Procedures
-- =============================================

-- Insert EnhancementUserStory
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertEnhancementUserStory
    @EnhancementID INT = NULL,
    @JiraIssue NVARCHAR(50) = NULL,
    @StoryPoints INT = NULL,
    @JiraIssueLink NVARCHAR(500) = NULL,
    @JiraIssueSummary NVARCHAR(MAX) = NULL,
    @StoryPointCostID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO EnhancementUserStory (EnhancementID, JiraIssue, StoryPoints,
                                          JiraIssueLink, JiraIssueSummary, StoryPointCostID)
        VALUES (@EnhancementID, @JiraIssue, @StoryPoints,
                @JiraIssueLink, @JiraIssueSummary, @StoryPointCostID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update EnhancementUserStory
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateEnhancementUserStory
    @ID INT,
    @EnhancementID INT = NULL,
    @JiraIssue NVARCHAR(50) = NULL,
    @StoryPoints INT = NULL,
    @JiraIssueLink NVARCHAR(500) = NULL,
    @JiraIssueSummary NVARCHAR(MAX) = NULL,
    @StoryPointCostID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE EnhancementUserStory
        SET EnhancementID = @EnhancementID,
            JiraIssue = @JiraIssue,
            StoryPoints = @StoryPoints,
            JiraIssueLink = @JiraIssueLink,
            JiraIssueSummary = @JiraIssueSummary,
            StoryPointCostID = @StoryPointCostID
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete EnhancementUserStory
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteEnhancementUserStory
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM EnhancementUserStory WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All EnhancementUserStory
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllEnhancementUserStory
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
           JiraIssueLink, JiraIssueSummary, StoryPointCostID
    FROM EnhancementUserStory
    ORDER BY ID;
END
GO

-- Get EnhancementUserStory By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDEnhancementUserStory
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
           JiraIssueLink, JiraIssueSummary, StoryPointCostID
    FROM EnhancementUserStory
    WHERE ID = @ID;
END
GO

-- =============================================
-- AutomationLogEntry CRUD Procedures
-- =============================================

-- Insert AutomationLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertAutomationLogEntry
    @AutomationID INT = NULL,
    @CreatedWWID NVARCHAR(9) = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO AutomationLogEntry (AutomationID, CreatedWWID, CreatedDate, Comment)
        VALUES (@AutomationID, @CreatedWWID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update AutomationLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateAutomationLogEntry
    @ID INT,
    @AutomationID INT = NULL,
    @CreatedWWID NVARCHAR(9) = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE AutomationLogEntry
        SET AutomationID = @AutomationID,
            CreatedWWID = @CreatedWWID,
            CreatedDate = @CreatedDate,
            Comment = @Comment
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete AutomationLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteAutomationLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM AutomationLogEntry WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All AutomationLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllAutomationLogEntry
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, CreatedWWID, CreatedDate, Comment
    FROM AutomationLogEntry
    ORDER BY ID;
END
GO

-- Get AutomationLogEntry By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDAutomationLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, CreatedWWID, CreatedDate, Comment
    FROM AutomationLogEntry
    WHERE ID = @ID;
END
GO

-- =============================================
-- SlaLogEntry CRUD Procedures
-- =============================================

-- Insert SlaLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertSlaLogEntry
    @SlaMasterID INT = NULL,
    @CreatedWWID NVARCHAR(9) = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO SlaLogEntry (SlaMasterID, CreatedWWID, CreatedDate, Comment)
        VALUES (@SlaMasterID, @CreatedWWID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update SlaLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateSlaLogEntry
    @ID INT,
    @SlaMasterID INT = NULL,
    @CreatedWWID NVARCHAR(9) = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE SlaLogEntry
        SET SlaMasterID = @SlaMasterID,
            CreatedWWID = @CreatedWWID,
            CreatedDate = @CreatedDate,
            Comment = @Comment
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete SlaLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteSlaLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM SlaLogEntry WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All SlaLogEntry
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllSlaLogEntry
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, SlaMasterID, CreatedWWID, CreatedDate, Comment
    FROM SlaLogEntry
    ORDER BY ID;
END
GO

-- Get SlaLogEntry By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDSlaLogEntry
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, SlaMasterID, CreatedWWID, CreatedDate, Comment
    FROM SlaLogEntry
    WHERE ID = @ID;
END
GO

-- =============================================
-- VirtualIdentity CRUD Procedures
-- =============================================

-- Insert VirtualIdentity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertVirtualIdentity
    @AccountName NVARCHAR(255) = NULL,
    @HostName NVARCHAR(255) = NULL,
    @WWID NVARCHAR(9) = NULL,
    @IPv4 NCHAR(15) = NULL,
    @ADDomainID INT = NULL,
    @Email NVARCHAR(255) = NULL,
    @Created DATE = NULL,
    @Retired DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO VirtualIdentity (AccountName, HostName, WWID, IPv4,
                                      ADDomainID, Email, Created, Retired)
        VALUES (@AccountName, @HostName, @WWID, @IPv4,
                @ADDomainID, @Email, @Created, @Retired);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update VirtualIdentity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateVirtualIdentity
    @ID INT,
    @AccountName NVARCHAR(255) = NULL,
    @HostName NVARCHAR(255) = NULL,
    @WWID NVARCHAR(9) = NULL,
    @IPv4 NCHAR(15) = NULL,
    @ADDomainID INT = NULL,
    @Email NVARCHAR(255) = NULL,
    @Created DATE = NULL,
    @Retired DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE VirtualIdentity
        SET AccountName = @AccountName,
            HostName = @HostName,
            WWID = @WWID,
            IPv4 = @IPv4,
            ADDomainID = @ADDomainID,
            Email = @Email,
            Created = @Created,
            Retired = @Retired
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete VirtualIdentity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteVirtualIdentity
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM VirtualIdentity WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All VirtualIdentity
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllVirtualIdentity
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AccountName, HostName, WWID, IPv4,
           ADDomainID, Email, Created, Retired
    FROM VirtualIdentity
    ORDER BY ID;
END
GO

-- Get VirtualIdentity By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDVirtualIdentity
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AccountName, HostName, WWID, IPv4,
           ADDomainID, Email, Created, Retired
    FROM VirtualIdentity
    WHERE ID = @ID;
END
GO

-- =============================================
-- AutomationEnvironment CRUD Procedures
-- =============================================

-- Insert AutomationEnvironment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_InsertAutomationEnvironment
    @AutomationID INT = NULL,
    @AppID NVARCHAR(50) = NULL,
    @EnvironmentTypeID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO AutomationEnvironment (AutomationID, AppID, EnvironmentTypeID)
        VALUES (@AutomationID, @AppID, @EnvironmentTypeID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Update AutomationEnvironment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_UpdateAutomationEnvironment
    @ID INT,
    @AutomationID INT = NULL,
    @AppID NVARCHAR(50) = NULL,
    @EnvironmentTypeID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE AutomationEnvironment
        SET AutomationID = @AutomationID,
            AppID = @AppID,
            EnvironmentTypeID = @EnvironmentTypeID
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Delete AutomationEnvironment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_DeleteAutomationEnvironment
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DELETE FROM AutomationEnvironment WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- Get All AutomationEnvironment
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetAllAutomationEnvironment
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, AppID, EnvironmentTypeID
    FROM AutomationEnvironment
    ORDER BY ID;
END
GO

-- Get AutomationEnvironment By ID
SET QUOTED_IDENTIFIER ON;
GO
SET ANSI_NULLS ON;
GO

CREATE OR ALTER PROCEDURE sp_GetByIDAutomationEnvironment
    @ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID, AutomationID, AppID, EnvironmentTypeID
    FROM AutomationEnvironment
    WHERE ID = @ID;
END
GO

PRINT 'Main entity table CRUD procedures created successfully (40 procedures).';
GO
