using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ComplexityController : ControllerBase
{
    private readonly IComplexityService _service;
    private readonly ILogger<ComplexityController> _logger;

    public ComplexityController(IComplexityService service, ILogger<ComplexityController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<ComplexityDto>>>> GetAll()
    {
        var complexities = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<ComplexityDto>>.SuccessResponse(complexities));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<ComplexityDto>>> GetById(int id)
    {
        var complexity = await _service.GetByIdAsync(id);
        if (complexity == null)
            return NotFound(ApiResponse<ComplexityDto>.ErrorResponse($"Complexity with ID {id} not found"));
        return Ok(ApiResponse<ComplexityDto>.SuccessResponse(complexity));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<ComplexityDto>>> Create([FromBody] ComplexityCreateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<ComplexityDto>.ErrorResponse("Validation failed"));

        var complexity = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = complexity.Id },
            ApiResponse<ComplexityDto>.SuccessResponse(complexity, "Complexity created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] ComplexityUpdateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<bool>.ErrorResponse("Validation failed"));

        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Complexity with ID {id} not found"));

        return Ok(ApiResponse<bool?>.SuccessResponse(null, "Complexity updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Complexity with ID {id} not found"));

        return Ok(ApiResponse<bool?>.SuccessResponse(null, "Complexity deleted successfully"));
    }
}
