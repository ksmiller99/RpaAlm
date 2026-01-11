using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class SlaMasterService : BaseService<SlaMaster, SlaMasterDto, SlaMasterCreateRequest, SlaMasterUpdateRequest>, ISlaMasterService
{
    public SlaMasterService(
        ISlaMasterRepository repository,
        IMapper mapper,
        ILogger<SlaMasterService> logger)
        : base(repository, mapper, logger)
    {
    }
}
