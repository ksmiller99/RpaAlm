using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class AutomationLogEntryService : BaseService<AutomationLogEntry, AutomationLogEntryDto, AutomationLogEntryCreateRequest, AutomationLogEntryUpdateRequest>, IAutomationLogEntryService
{
    public AutomationLogEntryService(
        IAutomationLogEntryRepository repository,
        IMapper mapper,
        ILogger<AutomationLogEntryService> logger)
        : base(repository, mapper, logger)
    {
    }
}
