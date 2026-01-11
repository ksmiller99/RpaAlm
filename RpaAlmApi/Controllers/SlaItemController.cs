using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SlaItemController : ControllerBase
{
    private readonly ISlaItemService _service;
    private readonly ILogger<SlaItemController> _logger;

    public SlaItemController(
        ISlaItemService service,
        ILogger<SlaItemController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<SlaItemDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<SlaItemDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all SlaItem records");
            return StatusCode(500, new ApiResponse<IEnumerable<SlaItemDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<SlaItemDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
            {
                return NotFound(new ApiResponse<SlaItemDto>
                {
                    Success = false,
                    Message = $"SlaItem with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<SlaItemDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving SlaItem with ID {Id}", id);
            return StatusCode(500, new ApiResponse<SlaItemDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<SlaItemDto>>> Create([FromBody] SlaItemCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new ApiResponse<SlaItemDto>
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
                new ApiResponse<SlaItemDto>
                {
                    Success = true,
                    Data = result,
                    Message = "SlaItem created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating SlaItem");
            return StatusCode(500, new ApiResponse<SlaItemDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] SlaItemUpdateRequest request)
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
                    Message = $"SlaItem with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "SlaItem updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating SlaItem with ID {Id}", id);
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
                    Message = $"SlaItem with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "SlaItem deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting SlaItem with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while deleting the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }
}
