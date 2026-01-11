using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class AutomationEnvironmentTypeService : BaseService<AutomationEnvironmentType, AutomationEnvironmentTypeDto, AutomationEnvironmentTypeCreateRequest, AutomationEnvironmentTypeUpdateRequest>, IAutomationEnvironmentTypeService
{
    public AutomationEnvironmentTypeService(IAutomationEnvironmentTypeRepository repository, IMapper mapper, ILogger<AutomationEnvironmentTypeService> logger)
        : base(repository, mapper, logger)
    {
    }
}
