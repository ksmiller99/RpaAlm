using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class StoryPointCostService : BaseService<StoryPointCost, StoryPointCostDto, StoryPointCostCreateRequest, StoryPointCostUpdateRequest>, IStoryPointCostService
{
    public StoryPointCostService(IStoryPointCostRepository repository, IMapper mapper, ILogger<StoryPointCostService> logger)
        : base(repository, mapper, logger)
    {
    }
}
