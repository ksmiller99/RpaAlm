using Dapper;
using Microsoft.Data.SqlClient;
using RpaAlmApi.Models.Common;
using RpaAlmApi.Models.Create;
using RpaAlmApi.Models.Lookup;
using RpaAlmApi.Models.Helper;
using RpaAlmApi.Models.Main;
using RpaAlmApi.Models.Junction;
using System.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddEndpointsApiExplorer();
builder.Services.ConfigureHttpJsonOptions(options =>
{
    options.SerializerOptions.UnmappedMemberHandling = System.Text.Json.Serialization.JsonUnmappedMemberHandling.Disallow;
});
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "RPA ALM API", Version = "v1", Description = "RESTful API for RPA Application Lifecycle Management Database" });
});

var connectionString = builder.Configuration.GetConnectionString("RpaAlmDev")
    ?? throw new InvalidOperationException("Connection string 'RpaAlmDev' not found.");

var app = builder.Build();

// Configure middleware
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "RPA ALM API v1");
    c.RoutePrefix = string.Empty; // Serve Swagger UI at root
});

// ============================================================================
// LOOKUP TABLE ENDPOINTS (12 tables, 60 endpoints)
// ============================================================================

// AdDomainType
MapCrudEndpoints<AdDomainTypeDto, CreateAdDomainTypeDto>(
    app.MapGroup("/api/addomain").WithTags("AdDomainType"),
    connectionString,
    "AdDomainType");

// AutomationEnvironmentType
MapCrudEndpoints<AutomationEnvironmentTypeDto, CreateAutomationEnvironmentTypeDto>(
    app.MapGroup("/api/automationenvironmenttype").WithTags("AutomationEnvironmentType"),
    connectionString,
    "AutomationEnvironmentType");

// ComplexityType
MapCrudEndpoints<ComplexityTypeDto, CreateComplexityTypeDto>(
    app.MapGroup("/api/complexitytype").WithTags("ComplexityType"),
    connectionString,
    "ComplexityType");

// FunctionType
MapCrudEndpoints<FunctionTypeDto, CreateFunctionTypeDto>(
    app.MapGroup("/api/functiontype").WithTags("FunctionType"),
    connectionString,
    "FunctionType");

// MedalType
MapCrudEndpoints<MedalTypeDto, CreateMedalTypeDto>(
    app.MapGroup("/api/medaltype").WithTags("MedalType"),
    connectionString,
    "MedalType");

// RegionType
MapCrudEndpoints<RegionTypeDto, CreateRegionTypeDto>(
    app.MapGroup("/api/regiontype").WithTags("RegionType"),
    connectionString,
    "RegionType");

// SegmentType
MapCrudEndpoints<SegmentTypeDto, CreateSegmentTypeDto>(
    app.MapGroup("/api/segmenttype").WithTags("SegmentType"),
    connectionString,
    "SegmentType");

// RpaStatusType
MapCrudEndpoints<RpaStatusTypeDto, CreateRpaStatusTypeDto>(
    app.MapGroup("/api/rpastatustype").WithTags("RpaStatusType"),
    connectionString,
    "RpaStatusType");

// SlaSignatureStatusType
MapCrudEndpoints<SlaSignatureStatusTypeDto, CreateSlaSignatureStatusTypeDto>(
    app.MapGroup("/api/slasignaturestatustype").WithTags("SlaSignatureStatusType"),
    connectionString,
    "SlaSignatureStatusType");

// SlaItemType
MapCrudEndpoints<SlaItemTypeDto, CreateSlaItemTypeDto>(
    app.MapGroup("/api/slaitemtype").WithTags("SlaItemType"),
    connectionString,
    "SlaItemType");

// Enhancement
MapCrudEndpoints<EnhancementDto, CreateEnhancementDto>(
    app.MapGroup("/api/enhancement").WithTags("Enhancement"),
    connectionString,
    "Enhancement");

// StoryPointCost
MapCrudEndpoints<StoryPointCostDto, CreateStoryPointCostDto>(
    app.MapGroup("/api/storypointcost").WithTags("StoryPointCost"),
    connectionString,
    "StoryPointCost");

// ============================================================================
// HELPER TABLE ENDPOINTS (2 tables, 10 endpoints)
// ============================================================================

// JjedsHelper
MapCrudEndpoints<JjedsHelperDto, CreateJjedsHelperDto>(
    app.MapGroup("/api/jjedshelper").WithTags("JjedsHelper"),
    connectionString,
    "JjedsHelper");

// CmdbHelper
MapCrudEndpoints<CmdbHelperDto, CreateCmdbHelperDto>(
    app.MapGroup("/api/cmdbhelper").WithTags("CmdbHelper"),
    connectionString,
    "CmdbHelper");

// ============================================================================
// MAIN TABLE ENDPOINTS (8 tables, 40 endpoints)
// ============================================================================

// Automation
MapCrudEndpoints<AutomationDto, CreateAutomationDto>(
    app.MapGroup("/api/automation").WithTags("Automation"),
    connectionString,
    "Automation");

// AutomationEnvironment
MapCrudEndpoints<AutomationEnvironmentDto, CreateAutomationEnvironmentDto>(
    app.MapGroup("/api/automationenvironment").WithTags("AutomationEnvironment"),
    connectionString,
    "AutomationEnvironment");

// AutomationLogEntry
MapCrudEndpoints<AutomationLogEntryDto, CreateAutomationLogEntryDto>(
    app.MapGroup("/api/automationlogentry").WithTags("AutomationLogEntry"),
    connectionString,
    "AutomationLogEntry");

// EnhancementUserStory
MapCrudEndpoints<EnhancementUserStoryDto, CreateEnhancementUserStoryDto>(
    app.MapGroup("/api/enhancementuserstory").WithTags("EnhancementUserStory"),
    connectionString,
    "EnhancementUserStory");

// SlaMaster
MapCrudEndpoints<SlaMasterDto, CreateSlaMasterDto>(
    app.MapGroup("/api/slamaster").WithTags("SlaMaster"),
    connectionString,
    "SlaMaster");

// SlaItem
MapCrudEndpoints<SlaItemDto, CreateSlaItemDto>(
    app.MapGroup("/api/slaitem").WithTags("SlaItem"),
    connectionString,
    "SlaItem");

// SlaLogEntry
MapCrudEndpoints<SlaLogEntryDto, CreateSlaLogEntryDto>(
    app.MapGroup("/api/slalogentry").WithTags("SlaLogEntry"),
    connectionString,
    "SlaLogEntry");

// VirtualIdentity
MapCrudEndpoints<VirtualIdentityDto, CreateVirtualIdentityDto>(
    app.MapGroup("/api/virtualidentity").WithTags("VirtualIdentity"),
    connectionString,
    "VirtualIdentity");

// ============================================================================
// JUNCTION TABLE ENDPOINTS (1 table, 5 endpoints)
// ============================================================================

// ViAssignments
MapCrudEndpoints<ViAssignmentsDto, CreateViAssignmentsDto>(
    app.MapGroup("/api/viassignments").WithTags("ViAssignments"),
    connectionString,
    "ViAssignments");

app.Run();

// ============================================================================
// GENERIC CRUD HELPER METHOD
// ============================================================================

static RouteGroupBuilder MapCrudEndpoints<TDto, TCreateDto>(
    RouteGroupBuilder group,
    string connectionString,
    string tableName)
    where TDto : class
    where TCreateDto : class
{
    // GET ALL
    group.MapGet("/", async () =>
    {
        try
        {
            using var connection = new SqlConnection(connectionString);
            var results = await connection.QueryAsync<TDto>(
                $"sp_GetAll{tableName}",
                commandType: CommandType.StoredProcedure);
            return Results.Ok(results);
        }
        catch (Exception ex)
        {
            return Results.Problem(
                detail: ex.Message,
                statusCode: 500,
                title: "Database Error");
        }
    })
    .WithName($"GetAll{tableName}");

    // GET BY ID
    group.MapGet("/{id}", async (int id) =>
    {
        try
        {
            using var connection = new SqlConnection(connectionString);
            var result = await connection.QuerySingleOrDefaultAsync<TDto>(
                $"sp_GetByID{tableName}",
                new { ID = id },
                commandType: CommandType.StoredProcedure);
            return result is null ? Results.NotFound() : Results.Ok(result);
        }
        catch (Exception ex)
        {
            return Results.Problem(
                detail: ex.Message,
                statusCode: 500,
                title: "Database Error");
        }
    })
    .WithName($"Get{tableName}ByID");

    // POST (INSERT)
    group.MapPost("/", async (TCreateDto dto) =>
    {
        try
        {
            using var connection = new SqlConnection(connectionString);

            // Create parameters from all properties in Create DTO
            var parameters = new DynamicParameters();
            foreach (var prop in typeof(TCreateDto).GetProperties())
            {
                parameters.Add($"@{prop.Name}", prop.GetValue(dto));
            }
            parameters.Add("@NewID", dbType: DbType.Int32, direction: ParameterDirection.Output);

            await connection.ExecuteAsync(
                $"sp_Insert{tableName}",
                parameters,
                commandType: CommandType.StoredProcedure);

            var result = new OperationResult
            {
                NewID = parameters.Get<int>("@NewID"),
                RowsAffected = 1
            };
            return Results.Ok(result);
        }
        catch (Exception ex)
        {
            return Results.Problem(
                detail: ex.Message,
                statusCode: 500,
                title: "Database Error");
        }
    })
    .WithName($"Create{tableName}");

    // PUT (UPDATE)
    group.MapPut("/{id}", async (int id, TDto dto) =>
    {
        try
        {
            using var connection = new SqlConnection(connectionString);

            // Set the ID property on the DTO
            var idProperty = typeof(TDto).GetProperty("ID");
            if (idProperty != null)
            {
                idProperty.SetValue(dto, id);
            }

            var rowsAffected = await connection.ExecuteAsync(
                $"sp_Update{tableName}",
                dto,
                commandType: CommandType.StoredProcedure);

            var result = new OperationResult { RowsAffected = rowsAffected };
            return rowsAffected == 0 ? Results.NotFound() : Results.Ok(result);
        }
        catch (Exception ex)
        {
            return Results.Problem(
                detail: ex.Message,
                statusCode: 500,
                title: "Database Error");
        }
    })
    .WithName($"Update{tableName}");

    // DELETE
    group.MapDelete("/{id}", async (int id) =>
    {
        try
        {
            using var connection = new SqlConnection(connectionString);
            var rowsAffected = await connection.ExecuteAsync(
                $"sp_Delete{tableName}",
                new { ID = id },
                commandType: CommandType.StoredProcedure);

            var result = new OperationResult { RowsAffected = rowsAffected };
            return rowsAffected == 0 ? Results.NotFound() : Results.Ok(result);
        }
        catch (Exception ex)
        {
            return Results.Problem(
                detail: ex.Message,
                statusCode: 500,
                title: "Database Error");
        }
    })
    .WithName($"Delete{tableName}");

    return group;
}
