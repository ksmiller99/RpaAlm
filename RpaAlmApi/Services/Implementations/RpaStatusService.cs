using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class RpaStatusService :
    BaseService<
        RpaStatus,
        RpaStatusDto,
        RpaStatusCreateRequest,
        RpaStatusUpdateRequest>,
    IRpaStatusService
{
    public RpaStatusService(
        IRpaStatusRepository repository,
        IMapper mapper,
        ILogger<RpaStatusService> logger)
        : base(repository, mapper, logger)
    {
    }
}