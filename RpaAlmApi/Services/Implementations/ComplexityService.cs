using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class ComplexityService : BaseService<Complexity, ComplexityDto, ComplexityCreateRequest, ComplexityUpdateRequest>, IComplexityService
{
    public ComplexityService(
        IComplexityRepository repository,
        IMapper mapper,
        ILogger<ComplexityService> logger)
        : base(repository, mapper, logger)
    {
    }
}
