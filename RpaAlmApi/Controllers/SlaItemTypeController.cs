using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SlaItemTypeController : ControllerBase
{
    private readonly ISlaItemTypeService _service;

    public SlaItemTypeController(ISlaItemTypeService service)
    {
        _service = service;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<SlaItemTypeDto>>>> GetAll()
    {
        var items = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<SlaItemTypeDto>>.SuccessResponse(items));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<SlaItemTypeDto>>> GetById(int id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item == null)
            return NotFound(ApiResponse<SlaItemTypeDto>.ErrorResponse($"SlaItemType with ID {id} not found"));
        return Ok(ApiResponse<SlaItemTypeDto>.SuccessResponse(item));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<SlaItemTypeDto>>> Create([FromBody] SlaItemTypeCreateRequest request)
    {
        var item = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = item.Id },
            ApiResponse<SlaItemTypeDto>.SuccessResponse(item, "SlaItemType created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] SlaItemTypeUpdateRequest request)
    {
        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"SlaItemType with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "SlaItemType updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"SlaItemType with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "SlaItemType deleted successfully"));
    }
}
