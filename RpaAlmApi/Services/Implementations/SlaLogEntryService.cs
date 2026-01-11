using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class SlaLogEntryService : BaseService<SlaLogEntry, SlaLogEntryDto, SlaLogEntryCreateRequest, SlaLogEntryUpdateRequest>, ISlaLogEntryService
{
    public SlaLogEntryService(
        ISlaLogEntryRepository repository,
        IMapper mapper,
        ILogger<SlaLogEntryService> logger)
        : base(repository, mapper, logger)
    {
    }
}
