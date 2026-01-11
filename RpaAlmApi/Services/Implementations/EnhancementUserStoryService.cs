using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class EnhancementUserStoryService : BaseService<EnhancementUserStory, EnhancementUserStoryDto, EnhancementUserStoryCreateRequest, EnhancementUserStoryUpdateRequest>, IEnhancementUserStoryService
{
    public EnhancementUserStoryService(
        IEnhancementUserStoryRepository repository,
        IMapper mapper,
        ILogger<EnhancementUserStoryService> logger)
        : base(repository, mapper, logger)
    {
    }
}
