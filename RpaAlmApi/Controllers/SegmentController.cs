using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SegmentController : ControllerBase
{
    private readonly ISegmentService _service;
    private readonly ILogger<SegmentController> _logger;

    public SegmentController(ISegmentService service, ILogger<SegmentController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<SegmentDto>>>> GetAll()
    {
        var segments = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<SegmentDto>>.SuccessResponse(segments));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<SegmentDto>>> GetById(int id)
    {
        var segment = await _service.GetByIdAsync(id);
        if (segment == null)
            return NotFound(ApiResponse<SegmentDto>.ErrorResponse($"Segment with ID {id} not found"));
        return Ok(ApiResponse<SegmentDto>.SuccessResponse(segment));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<SegmentDto>>> Create([FromBody] SegmentCreateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<SegmentDto>.ErrorResponse("Validation failed"));

        var segment = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = segment.Id },
            ApiResponse<SegmentDto>.SuccessResponse(segment, "Segment created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] SegmentUpdateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<bool>.ErrorResponse("Validation failed"));

        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Segment with ID {id} not found"));

        return Ok(ApiResponse<bool>.SuccessResponse(true, "Segment updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Segment with ID {id} not found"));

        return Ok(ApiResponse<bool>.SuccessResponse(true, "Segment deleted successfully"));
    }
}
