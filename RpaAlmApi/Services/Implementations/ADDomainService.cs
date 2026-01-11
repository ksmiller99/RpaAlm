using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class ADDomainService : BaseService<ADDomain, ADDomainDto, ADDomainCreateRequest, ADDomainUpdateRequest>, IADDomainService
{
    public ADDomainService(IADDomainRepository repository, IMapper mapper, ILogger<ADDomainService> logger)
        : base(repository, mapper, logger)
    {
    }
}
