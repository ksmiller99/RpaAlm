using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class AutomationEnvironmentService : BaseService<AutomationEnvironment, AutomationEnvironmentDto, AutomationEnvironmentCreateRequest, AutomationEnvironmentUpdateRequest>, IAutomationEnvironmentService
{
    public AutomationEnvironmentService(
        IAutomationEnvironmentRepository repository,
        IMapper mapper,
        ILogger<AutomationEnvironmentService> logger)
        : base(repository, mapper, logger)
    {
    }
}
