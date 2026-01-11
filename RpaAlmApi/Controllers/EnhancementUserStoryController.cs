using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class EnhancementUserStoryController : ControllerBase
{
    private readonly IEnhancementUserStoryService _service;
    private readonly ILogger<EnhancementUserStoryController> _logger;

    public EnhancementUserStoryController(
        IEnhancementUserStoryService service,
        ILogger<EnhancementUserStoryController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<EnhancementUserStoryDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<EnhancementUserStoryDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all EnhancementUserStory records");
            return StatusCode(500, new ApiResponse<IEnumerable<EnhancementUserStoryDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<EnhancementUserStoryDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
            {
                return NotFound(new ApiResponse<EnhancementUserStoryDto>
                {
                    Success = false,
                    Message = $"EnhancementUserStory with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<EnhancementUserStoryDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving EnhancementUserStory with ID {Id}", id);
            return StatusCode(500, new ApiResponse<EnhancementUserStoryDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<EnhancementUserStoryDto>>> Create([FromBody] EnhancementUserStoryCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new ApiResponse<EnhancementUserStoryDto>
                {
                    Success = false,
                    Message = "Invalid request data",
                    Errors = ModelState.Values
                        .SelectMany(v => v.Errors)
                        .Select(e => e.ErrorMessage)
                        .ToList()
                });
            }

            var result = await _service.CreateAsync(request);
            return CreatedAtAction(
                nameof(GetById),
                new { id = result.Id },
                new ApiResponse<EnhancementUserStoryDto>
                {
                    Success = true,
                    Data = result,
                    Message = "EnhancementUserStory created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating EnhancementUserStory");
            return StatusCode(500, new ApiResponse<EnhancementUserStoryDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] EnhancementUserStoryUpdateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Invalid request data",
                    Errors = ModelState.Values
                        .SelectMany(v => v.Errors)
                        .Select(e => e.ErrorMessage)
                        .ToList()
                });
            }

            var result = await _service.UpdateAsync(id, request);
            if (!result)
            {
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"EnhancementUserStory with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "EnhancementUserStory updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating EnhancementUserStory with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while updating the record",
                Errors = new List<string> { ex.Message }
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
            {
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"EnhancementUserStory with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "EnhancementUserStory deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting EnhancementUserStory with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while deleting the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }
}
