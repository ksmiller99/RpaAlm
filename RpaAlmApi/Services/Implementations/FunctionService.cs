using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class FunctionService : BaseService<Function, FunctionDto, FunctionCreateRequest, FunctionUpdateRequest>, IFunctionService
{
    public FunctionService(
        IFunctionRepository repository,
        IMapper mapper,
        ILogger<FunctionService> logger)
        : base(repository, mapper, logger)
    {
    }
}
