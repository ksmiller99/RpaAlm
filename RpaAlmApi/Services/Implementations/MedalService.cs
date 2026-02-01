using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class MedalService : BaseService<Medal, MedalDto, MedalCreateRequest, MedalUpdateRequest>, IMedalService
{
    public MedalService(
        IMedalRepository repository, 
        IMapper mapper, 
        ILogger<MedalService> logger)
        : base(repository, mapper, logger)
    {
    }
}
