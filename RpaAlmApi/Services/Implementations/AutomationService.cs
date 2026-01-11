using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class AutomationService : BaseService<Automation, AutomationDto, AutomationCreateRequest, AutomationUpdateRequest>, IAutomationService
{
    public AutomationService(
        IAutomationRepository repository,
        IMapper mapper,
        ILogger<AutomationService> logger)
        : base(repository, mapper, logger)
    {
    }
}
