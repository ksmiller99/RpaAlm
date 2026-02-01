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
    private readonly ILogger<StoryPointCostController> _logger;
    private readonly IStoryPointCostService _service;

    public StoryPointCostController(
        IStoryPointCostService service,
        ILogger<StoryPointCostController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<StoryPointCostDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<StoryPointCostDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all StoryPointCost records");
            return StatusCode(500, new ApiResponse<IEnumerable<StoryPointCostDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = [ex.Message]
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<StoryPointCostDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
                return NotFound(new ApiResponse<StoryPointCostDto>
                {
                    Success = false,
                    Message = $"StoryPointCost with ID {id} not found"
                });

            return Ok(new ApiResponse<StoryPointCostDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving StoryPointCost with ID {id}");
            return StatusCode(500, new ApiResponse<StoryPointCostDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<StoryPointCostDto>>> Create(
        [FromBody] StoryPointCostCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<StoryPointCostDto>
                {
                    Success = false,
                    Message = "Invalid request data",
                    Errors = ModelState.Values
                        .SelectMany(v => v.Errors)
                        .Select(e => e.ErrorMessage)
                        .ToList()
                });

            var result = await _service.CreateAsync(request);
            return CreatedAtAction(
                nameof(GetById),
                new { id = result.Id },
                new ApiResponse<StoryPointCostDto>
                {
                    Success = true,
                    Data = result,
                    Message = "StoryPointCost created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating StoryPointCost");
            return StatusCode(500, new ApiResponse<StoryPointCostDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] StoryPointCostUpdateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Invalid request data",
                    Errors = ModelState.Values
                        .SelectMany(v => v.Errors)
                        .Select(e => e.ErrorMessage)
                        .ToList()
                });

            var result = await _service.UpdateAsync(id, request);
            if (!result)
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"StoryPointCost with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = "StoryPointCost updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating StoryPointCost with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while updating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var result = await _service.DeleteAsync(id);
            if (!result)
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"StoryPointCost with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = $"StoryPointCost with ID {id} deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error deleting StoryPointCost with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = $"An error occurred while deleting the StoryPointCost record with ID {id}",
                Errors = [ex.Message]
            });
        }
    }
}