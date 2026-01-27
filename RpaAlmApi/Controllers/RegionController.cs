using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RegionController : ControllerBase
{
    private readonly IRegionService _service;
    private readonly ILogger<RegionController> _logger;

    public RegionController(IRegionService service, ILogger<RegionController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<RegionDto>>>> GetAll()
    {
        var regions = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<RegionDto>>.SuccessResponse(regions));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<RegionDto>>> GetById(int id)
    {
        var region = await _service.GetByIdAsync(id);
        if (region == null)
            return NotFound(ApiResponse<RegionDto>.ErrorResponse($"Region with ID {id} not found"));
        return Ok(ApiResponse<RegionDto>.SuccessResponse(region));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<RegionDto>>> Create([FromBody] RegionCreateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<RegionDto>.ErrorResponse("Validation failed"));

        var region = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = region.Id },
            ApiResponse<RegionDto>.SuccessResponse(region, "Region created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] RegionUpdateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<bool>.ErrorResponse("Validation failed"));

        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Region with ID {id} not found"));

        return Ok(ApiResponse<RegionDto?>.SuccessResponse(null, "Region updated successfully")); //data should be null
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Region with ID {id} not found"));

        return Ok(ApiResponse<bool?>.SuccessResponse(null, "Region deleted successfully"));
    }
}
