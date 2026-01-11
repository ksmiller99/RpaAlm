using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class SlaItemTypeService : BaseService<SlaItemType, SlaItemTypeDto, SlaItemTypeCreateRequest, SlaItemTypeUpdateRequest>, ISlaItemTypeService
{
    public SlaItemTypeService(ISlaItemTypeRepository repository, IMapper mapper, ILogger<SlaItemTypeService> logger)
        : base(repository, mapper, logger)
    {
    }
}
