using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class CmdbHelperService : BaseService<CmdbHelper, CmdbHelperDto, CmdbHelperCreateRequest, CmdbHelperUpdateRequest>, ICmdbHelperService
{
    public CmdbHelperService(
        ICmdbHelperRepository repository,
        IMapper mapper,
        ILogger<CmdbHelperService> logger)
        : base(repository, mapper, logger)
    {
    }
}