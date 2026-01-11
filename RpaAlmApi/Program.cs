using Microsoft.OpenApi.Models;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.DbContext;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Data.Repositories;
using RpaAlmApi.Services.Implementations;
using RpaAlmApi.Services.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddControllers();

// Configure Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "RPA ALM API",
        Version = "v1",
        Description = "RESTful API for RPA Application Lifecycle Management system",
        Contact = new OpenApiContact
        {
            Name = "RPA ALM Team"
        }
    });
});

// Configure CORS for localhost development
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

// Configure AutoMapper
builder.Services.AddAutoMapper(typeof(Program));

// Register Database Connection Factory
builder.Services.AddSingleton<IDbConnectionFactory, DbConnectionFactory>();

// Register Repositories
builder.Services.AddScoped<IStatusRepository, StatusRepository>();
builder.Services.AddScoped<IRegionRepository, RegionRepository>();
builder.Services.AddScoped<IFunctionRepository, FunctionRepository>();
builder.Services.AddScoped<IComplexityRepository, ComplexityRepository>();
builder.Services.AddScoped<ISegmentRepository, SegmentRepository>();
builder.Services.AddScoped<IMedalRepository, MedalRepository>();
builder.Services.AddScoped<IEnhancementRepository, EnhancementRepository>();
builder.Services.AddScoped<ISlaItemTypeRepository, SlaItemTypeRepository>();
builder.Services.AddScoped<IAutomationEnvironmentTypeRepository, AutomationEnvironmentTypeRepository>();
builder.Services.AddScoped<IADDomainRepository, ADDomainRepository>();
builder.Services.AddScoped<IStoryPointCostRepository, StoryPointCostRepository>();
builder.Services.AddScoped<IJjedsHelperRepository, JjedsHelperRepository>();
builder.Services.AddScoped<ICmdbHelperRepository, CmdbHelperRepository>();
builder.Services.AddScoped<IAutomationRepository, AutomationRepository>();
builder.Services.AddScoped<ISlaMasterRepository, SlaMasterRepository>();
builder.Services.AddScoped<ISlaItemRepository, SlaItemRepository>();
builder.Services.AddScoped<IVirtualIdentityRepository, VirtualIdentityRepository>();
builder.Services.AddScoped<IAutomationEnvironmentRepository, AutomationEnvironmentRepository>();
builder.Services.AddScoped<IEnhancementUserStoryRepository, EnhancementUserStoryRepository>();
builder.Services.AddScoped<IAutomationLogEntryRepository, AutomationLogEntryRepository>();
builder.Services.AddScoped<ISlaLogEntryRepository, SlaLogEntryRepository>();
builder.Services.AddScoped<IViAssignmentsRepository, ViAssignmentsRepository>();

// Register Services
builder.Services.AddScoped<IStatusService, StatusService>();
builder.Services.AddScoped<IRegionService, RegionService>();
builder.Services.AddScoped<IFunctionService, FunctionService>();
builder.Services.AddScoped<IComplexityService, ComplexityService>();
builder.Services.AddScoped<ISegmentService, SegmentService>();
builder.Services.AddScoped<IMedalService, MedalService>();
builder.Services.AddScoped<IEnhancementService, EnhancementService>();
builder.Services.AddScoped<ISlaItemTypeService, SlaItemTypeService>();
builder.Services.AddScoped<IAutomationEnvironmentTypeService, AutomationEnvironmentTypeService>();
builder.Services.AddScoped<IADDomainService, ADDomainService>();
builder.Services.AddScoped<IStoryPointCostService, StoryPointCostService>();
builder.Services.AddScoped<IJjedsHelperService, JjedsHelperService>();
builder.Services.AddScoped<ICmdbHelperService, CmdbHelperService>();
builder.Services.AddScoped<IAutomationService, AutomationService>();
builder.Services.AddScoped<ISlaMasterService, SlaMasterService>();
builder.Services.AddScoped<ISlaItemService, SlaItemService>();
builder.Services.AddScoped<IVirtualIdentityService, VirtualIdentityService>();
builder.Services.AddScoped<IAutomationEnvironmentService, AutomationEnvironmentService>();
builder.Services.AddScoped<IEnhancementUserStoryService, EnhancementUserStoryService>();
builder.Services.AddScoped<IAutomationLogEntryService, AutomationLogEntryService>();
builder.Services.AddScoped<ISlaLogEntryService, SlaLogEntryService>();
builder.Services.AddScoped<IViAssignmentsService, ViAssignmentsService>();

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "RPA ALM API v1");
        options.RoutePrefix = string.Empty; // Set Swagger UI at root
    });
}

app.UseHttpsRedirection();

// Enable CORS
app.UseCors("AllowAll");

app.UseAuthorization();

app.MapControllers();

app.Run();
