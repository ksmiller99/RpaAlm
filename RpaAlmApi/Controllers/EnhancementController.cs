using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class EnhancementController : ControllerBase
{
    private readonly IEnhancementService _service;

    public EnhancementController(IEnhancementService service)
    {
        _service = service;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<EnhancementDto>>>> GetAll()
    {
        var items = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<EnhancementDto>>.SuccessResponse(items));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<EnhancementDto>>> GetById(int id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item == null)
            return NotFound(ApiResponse<EnhancementDto>.ErrorResponse($"Enhancement with ID {id} not found"));
        return Ok(ApiResponse<EnhancementDto>.SuccessResponse(item));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<EnhancementDto>>> Create([FromBody] EnhancementCreateRequest request)
    {
        var item = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = item.Id },
            ApiResponse<EnhancementDto>.SuccessResponse(item, "Enhancement created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] EnhancementUpdateRequest request)
    {
        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Enhancement with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "Enhancement updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Enhancement with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "Enhancement deleted successfully"));
    }
}
