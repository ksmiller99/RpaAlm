using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class VirtualIdentityService : BaseService<VirtualIdentity, VirtualIdentityDto, VirtualIdentityCreateRequest, VirtualIdentityUpdateRequest>, IVirtualIdentityService
{
    public VirtualIdentityService(
        IVirtualIdentityRepository repository,
        IMapper mapper,
        ILogger<VirtualIdentityService> logger)
        : base(repository, mapper, logger)
    {
    }
}
