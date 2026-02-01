using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class JjedsHelperService : BaseService<JjedsHelper, JjedsHelperDto, JjedsHelperCreateRequest, JjedsHelperUpdateRequest>, IJjedsHelperService
{
    public JjedsHelperService(
        IJjedsHelperRepository repository,
        IMapper mapper,
        ILogger<JjedsHelperService> logger)
        : base(repository, mapper, logger)
    {
    }
}