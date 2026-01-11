using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class SlaItemService : BaseService<SlaItem, SlaItemDto, SlaItemCreateRequest, SlaItemUpdateRequest>, ISlaItemService
{
    public SlaItemService(
        ISlaItemRepository repository,
        IMapper mapper,
        ILogger<SlaItemService> logger)
        : base(repository, mapper, logger)
    {
    }
}
