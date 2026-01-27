using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class StoryPointCostController : ControllerBase
{
    private readonly IStoryPointCostService _service;

    public StoryPointCostController(IStoryPointCostService service)
    {
        _service = service;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<StoryPointCostDto>>>> GetAll()
    {
        var items = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<StoryPointCostDto>>.SuccessResponse(items));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<StoryPointCostDto>>> GetById(int id)
    {
        var item = await _service.GetByIdAsync(id);
        if (item == null)
            return NotFound(ApiResponse<StoryPointCostDto>.ErrorResponse($"StoryPointCost with ID {id} not found"));
        return Ok(ApiResponse<StoryPointCostDto>.SuccessResponse(item));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<StoryPointCostDto>>> Create([FromBody] StoryPointCostCreateRequest request)
    {
        var item = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = item.Id },
            ApiResponse<StoryPointCostDto>.SuccessResponse(item, "StoryPointCost created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] StoryPointCostUpdateRequest request)
    {
        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"StoryPointCost with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "StoryPointCost updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"StoryPointCost with ID {id} not found"));
        return Ok(ApiResponse<bool?>.SuccessResponse(null, "StoryPointCost deleted successfully"));
    }
}
