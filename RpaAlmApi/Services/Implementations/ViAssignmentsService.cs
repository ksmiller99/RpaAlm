using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class ViAssignmentsService : BaseService<ViAssignments, ViAssignmentsDto, ViAssignmentsCreateRequest, ViAssignmentsUpdateRequest>, IViAssignmentsService
{
    public ViAssignmentsService(
        IViAssignmentsRepository repository,
        IMapper mapper,
        ILogger<ViAssignmentsService> logger)
        : base(repository, mapper, logger)
    {
    }
}
