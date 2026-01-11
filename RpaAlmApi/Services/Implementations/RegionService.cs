using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class RegionService : BaseService<Region, RegionDto, RegionCreateRequest, RegionUpdateRequest>, IRegionService
{
    public RegionService(
        IRegionRepository repository,
        IMapper mapper,
        ILogger<RegionService> logger)
        : base(repository, mapper, logger)
    {
    }
}
