using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AutomationEnvironmentTypeController : ControllerBase
{
    private readonly IAutomationEnvironmentTypeService _service;

    public AutomationEnvironmentTypeController(IAutomationEnvironmentTypeService service)
    {
        _service = service;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<AutomationEnvironmentTypeDto>>>> GetAll()
    {
        var items = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<AutomationEnvironmentTypeDto>>.SuccessResponse(items));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<AutomationEnvironmentTypeDto>>> GetById(int id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item == null)
            return NotFound(ApiResponse<AutomationEnvironmentTypeDto>.ErrorResponse($"AutomationEnvironmentType with ID {id} not found"));
        return Ok(ApiResponse<AutomationEnvironmentTypeDto>.SuccessResponse(item));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<AutomationEnvironmentTypeDto>>> Create([FromBody] AutomationEnvironmentTypeCreateRequest request)
    {
        var item = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = item.Id },
            ApiResponse<AutomationEnvironmentTypeDto>.SuccessResponse(item, "AutomationEnvironmentType created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] AutomationEnvironmentTypeUpdateRequest request)
    {
        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"AutomationEnvironmentType with ID {id} not found"));
        return Ok(ApiResponse<bool>.SuccessResponse(true, "AutomationEnvironmentType updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"AutomationEnvironmentType with ID {id} not found"));
        return Ok(ApiResponse<bool>.SuccessResponse(true, "AutomationEnvironmentType deleted successfully"));
    }
}
