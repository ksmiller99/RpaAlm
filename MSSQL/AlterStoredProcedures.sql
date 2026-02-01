USE [RpaAlmDev]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteADDomain]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteADDomain]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM ADDomain WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomation]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteAutomation]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Automation WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationEnvironment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteAutomationEnvironment]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationEnvironment WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationEnvironmentType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteAutomationEnvironmentType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationEnvironmentType WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAutomationLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteAutomationLogEntry]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM AutomationLogEntry WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCmdbHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER    PROCEDURE [dbo].[sp_DeleteCmdbHelper]
    @ID NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM CmdbHelper WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteComplexityType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteComplexityType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM ComplexityType WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEnhancement]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteEnhancement]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Enhancement WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEnhancementUserStory]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteEnhancementUserStory]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM EnhancementUserStory WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteFunction]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteFunction]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM [Function] WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteJjedsHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteJjedsHelper]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM JjedsHelper WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMedal]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteMedal]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Medal WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRegion]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteRegion]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Region WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRpaStatus]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteRpaStatus]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM RpaStatus WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSegment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteSegment]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM Segment WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaItem]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteSlaItem]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaItem WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaItemType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteSlaItemType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaItemType WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteSlaLogEntry]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaLogEntry WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSlaMaster]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteSlaMaster]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM SlaMaster WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStoryPointCost]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteStoryPointCost]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM StoryPointCost WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteViAssignments]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteViAssignments]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM ViAssignments WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteVirtualIdentity]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_DeleteVirtualIdentity]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        DELETE FROM VirtualIdentity WHERE ID = @ID;
        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllADDomain]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllADDomain]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Domain, Description
    FROM ADDomain
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomation]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllAutomation]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID,
           BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
    FROM Automation
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationEnvironment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllAutomationEnvironment]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, EnvironmentTypeID
    FROM AutomationEnvironment
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationEnvironmentType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllAutomationEnvironmentType]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAutomationLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllAutomationLogEntry]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
    FROM AutomationLogEntry
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCmdbHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER    PROCEDURE [dbo].[sp_GetAllCmdbHelper]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AppID, Name, Zcode
    FROM CmdbHelper
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllComplexityType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllComplexityType]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM ComplexityType
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEnhancement]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllEnhancement]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Scope
    FROM Enhancement
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllEnhancementUserStory]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllEnhancementUserStory]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
           JiraIssueLink, JiraIssueSummary, StoryPointCostID
    FROM EnhancementUserStory
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllFunction]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllFunction]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM [Function]
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllJjedsHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllJjedsHelper]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMedal]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllMedal]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description
    FROM Medal
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRegion]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllRegion]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM Region
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllRpaStatus]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllRpaStatus]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RpaStatus
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSegment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllSegment]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM Segment
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaItem]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllSlaItem]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
    FROM SlaItem
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaItemType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllSlaItemType]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description, Cost, Disabled
    FROM SlaItemType
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllSlaLogEntry]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
    FROM SlaLogEntry
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSlaMaster]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllSlaMaster]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode,
           CostCenter, StartDate, EndDate
    FROM SlaMaster
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllStoryPointCost]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllStoryPointCost]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
    FROM StoryPointCost
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllViAssignments]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllViAssignments]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
           Percentage, StartDate, EndDate
    FROM ViAssignments
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllVirtualIdentity]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetAllVirtualIdentity]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, JjedsID, HostName, JjedsID, IPv4,
           ADDomainID, Created, Retired
    FROM VirtualIdentity
    ORDER BY ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDADDomain]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDADDomain]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Domain, Description
    FROM ADDomain
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomation]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDAutomation]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, SegmentID, RegionID, FunctionID, RpaStatusID,
           BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID
    FROM Automation
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationEnvironment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDAutomationEnvironment]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CmdbID, EnvironmentTypeID
    FROM AutomationEnvironment
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationEnvironmentType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDAutomationEnvironmentType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM AutomationEnvironmentType
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDAutomationLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDAutomationLogEntry]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, CreatedJjedsID, CreatedDate, Comment
    FROM AutomationLogEntry
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDCmdbHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER    PROCEDURE [dbo].[sp_GetByIDCmdbHelper]
    @ID NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AppID, Name, Zcode
    FROM CmdbHelper
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDComplexityType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDComplexityType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM ComplexityType
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDEnhancement]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDEnhancement]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Scope
    FROM Enhancement
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDEnhancementUserStory]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDEnhancementUserStory]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, EnhancementID, JiraIssue, StoryPoints,
           JiraIssueLink, JiraIssueSummary, StoryPointCostID
    FROM EnhancementUserStory
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDFunction]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDFunction]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM [Function]
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDJjedsHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDJjedsHelper]
    @ID NVARCHAR(9)
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, WWID, CommonName, Email, JjedsCreated, JjedsLastChanged
    FROM JjedsHelper
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDMedal]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDMedal]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description
    FROM Medal
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDRegion]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDRegion]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM Region
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDRpaStatus]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDRpaStatus]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM RpaStatus
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDSegment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDSegment]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Code, Description
    FROM Segment
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaItem]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDSlaItem]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, SlaItemTypeID, EnhancementID
    FROM SlaItem
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaItemType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDSlaItemType]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Name, Description, Cost, Disabled
    FROM SlaItemType
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDSlaLogEntry]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, SlaMasterID, CreatedJjedsID, CreatedDate, Comment
    FROM SlaLogEntry
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDSlaMaster]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDSlaMaster]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, AutomationID, ComplexityTypeID, MedalID, Zcode,
           CostCenter, StartDate, EndDate
    FROM SlaMaster
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDStoryPointCost]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDStoryPointCost]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, Points, MaxHours, TotalCost, JnJCostShare, EffectiveDate
    FROM StoryPointCost
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDViAssignments]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDViAssignments]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, VirtualIdentityID, AutomationEnvironmentID,
           Percentage, StartDate, EndDate
    FROM ViAssignments
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByIDVirtualIdentity]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_GetByIDVirtualIdentity]
    @ID INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT ID, JjedsID, ADDomainID, HostName,  IPv4, Created, Retired
    FROM VirtualIdentity
    WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertADDomain]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertADDomain]
    @Domain NVARCHAR(255) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertAutomation]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertAutomation]
    @Name NVARCHAR(255) = NULL,
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @RpaStatusID INT = NULL,
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
        INSERT INTO Automation (Name, SegmentID, RegionID, FunctionID, RpaStatusID,
                                BtoJjedsID, BoJjedsID, FcJjedsID, SseJjedsID, LseJjedsID)
        VALUES (@Name, @SegmentID, @RegionID, @FunctionID, @RpaStatusID,
                @BtoJjedsID, @BoJjedsID, @FcJjedsID, @SseJjedsID, @LseJjedsID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationEnvironment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertAutomationEnvironment]
    @AutomationID INT = NULL,
    @CmdbID INT = NULL,
    @EnvironmentTypeID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AutomationEnvironment (AutomationID, CmdbID, EnvironmentTypeID)
        VALUES (@AutomationID, @CmdbID, @EnvironmentTypeID);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationEnvironmentType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertAutomationEnvironmentType]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertAutomationLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_InsertAutomationLogEntry]
    @AutomationID INT = NULL,
    @CreatedJjedsID INT = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO AutomationLogEntry (AutomationID, CreatedJjedsID, CreatedDate, Comment)
        VALUES (@AutomationID, @CreatedJjedsID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCmdbHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertCmdbHelper]
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255) = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO CmdbHelper (AppID, Name, Zcode)
        VALUES (@AppID, @Name, @Zcode);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
 END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertComplexityType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertComplexityType]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO ComplexityType (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEnhancement]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertEnhancement]
    @Scope NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertEnhancementUserStory]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertEnhancementUserStory]
    @EnhancementID INT = NULL,
    @JiraIssue NVARCHAR(50) = NULL,
    @StoryPoints INT = NULL,
    @JiraIssueLink NVARCHAR(500) = NULL,
    @JiraIssueSummary NVARCHAR(MAX) = NULL,
    @StoryPointCostID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertFunction]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertFunction]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertJjedsHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertJjedsHelper]	
    @WWID INT,
    @CommonName NVARCHAR(255) = NULL,
    @Email NVARCHAR(255) = NULL,
    @JjedsCreated DATE = NULL,
    @JjedsLastChanged DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO JjedsHelper (WWID, CommonName, Email, JjedsCreated, JjedsLastChanged)
        VALUES (@WWID, @CommonName, @Email, @JjedsCreated, @JjedsLastChanged);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertMedal]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertMedal]
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertRegion]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertRegion]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertRpaStatus]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertRpaStatus]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO RpaStatus (Code, Description)
        VALUES (@Code, @Description);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSegment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertSegment]
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertSlaItem]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertSlaItem]
    @SlaMasterID INT = NULL,
    @SlaItemTypeID INT = NULL,
    @EnhancementID INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertSlaItemType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertSlaItemType]
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @Cost INT = NULL,
    @Disabled INT = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertSlaLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_InsertSlaLogEntry]
    @SlaMasterID INT = NULL,
    @CreatedJjedsID INT = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaLogEntry (SlaMasterID, CreatedJjedsID, CreatedDate, Comment)
        VALUES (@SlaMasterID, @CreatedJjedsID, @CreatedDate, @Comment);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSlaMaster]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertSlaMaster]
    @AutomationID INT = NULL,
    @ComplexityTypeID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO SlaMaster (AutomationID, ComplexityTypeID, MedalID, Zcode,
                               CostCenter, StartDate, EndDate)
        VALUES (@AutomationID, @ComplexityTypeID, @MedalID, @Zcode,
                @CostCenter, @StartDate, @EndDate);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStoryPointCost]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertStoryPointCost]
    @Points INT = NULL,
    @MaxHours INT = NULL,
    @TotalCost INT = NULL,
    @JnJCostShare INT = NULL,
    @EffectiveDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertViAssignments]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_InsertViAssignments]
    @VirtualIdentityID INT = NULL,
    @AutomationEnvironmentID INT = NULL,
    @Percentage INT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL,
    @NewID INT OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_InsertVirtualIdentity]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_InsertVirtualIdentity]
    @JjedsID        INT = NULL,
    @ADDomainID  INT = NULL,
    @HostName    NVARCHAR(255) = NULL,
    @IPv4        NCHAR(15) = NULL,
    @Created     DATE = NULL,
    @Retired     DATE = NULL,
    @NewID INT   OUTPUT
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        INSERT INTO VirtualIdentity (JjedsID,       
		                             ADDomainID , 
									 HostName,   
									 IPv4,       
                                     Created,    
									 Retired)
        VALUES (@JjedsID,         
		        @ADDomainID,  
				@HostName,    
				@IPv4,        
                @Created,     
				@Retired);

        SET @NewID = SCOPE_IDENTITY();
        SELECT @NewID AS ID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateADDomain]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateADDomain]
    @ID INT,
    @Domain NVARCHAR(255) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomation]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_UpdateAutomation]
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @SegmentID INT = NULL,
    @RegionID INT = NULL,
    @FunctionID INT = NULL,
    @RpaStatusID INT = NULL,
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

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationEnvironment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateAutomationEnvironment]
    @ID INT,
    @AutomationID INT = NULL,
    @CmdbID INT = NULL,
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

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationEnvironmentType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateAutomationEnvironmentType]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutomationLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_UpdateAutomationLogEntry]
    @ID INT,
    @AutomationID INT = NULL,
    @CreatedJjedsID INT = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL
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

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCmdbHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateCmdbHelper]
    @AppID NVARCHAR(50),
    @Name NVARCHAR(255) = NULL,
    @Zcode NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateComplexityType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateComplexityType]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE ComplexityType
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateEnhancement]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateEnhancement]
    @ID INT,
    @Scope NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateEnhancementUserStory]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateEnhancementUserStory]
    @ID INT,
    @EnhancementID INT = NULL,
    @JiraIssue NVARCHAR(50) = NULL,
    @StoryPoints INT = NULL,
    @JiraIssueLink NVARCHAR(500) = NULL,
    @JiraIssueSummary NVARCHAR(MAX) = NULL,
    @StoryPointCostID INT = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateFunction]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateFunction]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateJjedsHelper]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateJjedsHelper]
    @ID INT,
	@JjedsID INT,
    @CommonName NVARCHAR(255) = NULL,
    @Email NVARCHAR(255) = NULL,
    @JjedsCreated DATE = NULL,
    @JjedsLastChanged DATE = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE JjedsHelper
        SET CommonName = @CommonName,
            Email = @Email,
            JjedsCreated = @JjedsCreated,
            JjedsLastChanged = @JjedsLastChanged
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMedal]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateMedal]
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateRegion]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateRegion]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateRpaStatus]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateRpaStatus]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE RpaStatus
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateSegment]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateSegment]
    @ID INT,
    @Code NVARCHAR(50) = NULL,
    @Description NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaItem]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateSlaItem]
    @ID INT,
    @SlaMasterID INT = NULL,
    @SlaItemTypeID INT = NULL,
    @EnhancementID INT = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaItemType]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateSlaItemType]
    @ID INT,
    @Name NVARCHAR(255) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @Cost INT = NULL,
    @Disabled INT = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaLogEntry]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[sp_UpdateSlaLogEntry]
    @ID INT,
    @SlaMasterID INT = NULL,
    @CreatedJjedsID INT = NULL,
    @CreatedDate DATE = NULL,
    @Comment NVARCHAR(MAX) = NULL
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

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSlaMaster]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateSlaMaster]
    @ID INT,
    @AutomationID INT = NULL,
    @ComplexityTypeID INT = NULL,
    @MedalID INT = NULL,
    @Zcode NVARCHAR(50) = NULL,
    @CostCenter NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
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
            EndDate = @EndDate
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStoryPointCost]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateStoryPointCost]
    @ID INT,
    @Points INT = NULL,
    @MaxHours INT = NULL,
    @TotalCost INT = NULL,
    @JnJCostShare INT = NULL,
    @EffectiveDate DATE = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateViAssignments]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateViAssignments]
    @ID INT,
    @VirtualIdentityID INT = NULL,
    @AutomationEnvironmentID INT = NULL,
    @Percentage INT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SET NOCOUNT OFF;
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateVirtualIdentity]    Script Date: 1/31/2026 8:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER    PROCEDURE [dbo].[sp_UpdateVirtualIdentity]
    @ID          INT,
    @JjedsID     INT = NULL,
    @ADDomainID  INT = NULL,
    @HostName    NVARCHAR(255) = NULL,
    @IPv4        NCHAR(15) = NULL,
    @Created     DATE = NULL,
    @Retired     DATE = NULL
AS
BEGIN
    SET NOCOUNT OFF;
    BEGIN TRY
        UPDATE VirtualIdentity
        SET JjedsID        = @JjedsID,
            ADDomainID  = @ADDomainID,
            HostName    = @HostName,
            IPv4        = @IPv4,
            Created     = @Created,
            Retired     = @Retired
        WHERE ID = @ID;

        SELECT @@ROWCOUNT AS RowsAffected;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
