using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class SegmentService : BaseService<Segment, SegmentDto, SegmentCreateRequest, SegmentUpdateRequest>, ISegmentService
{
    public SegmentService(
        ISegmentRepository repository,
        IMapper mapper,
        ILogger<SegmentService> logger)
        : base(repository, mapper, logger)
    {
    }
}
