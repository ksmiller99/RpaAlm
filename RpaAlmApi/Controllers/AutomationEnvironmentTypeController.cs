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
    private readonly ILogger<AutomationEnvironmentTypeController> _logger;
    private readonly IAutomationEnvironmentTypeService _service;

    public AutomationEnvironmentTypeController(
        IAutomationEnvironmentTypeService service,
        ILogger<AutomationEnvironmentTypeController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<AutomationEnvironmentTypeDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<AutomationEnvironmentTypeDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all AutomationEnvironmentType records");
            return StatusCode(500, new ApiResponse<IEnumerable<AutomationEnvironmentTypeDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = [ex.Message]
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<AutomationEnvironmentTypeDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
                return NotFound(new ApiResponse<AutomationEnvironmentTypeDto>
                {
                    Success = false,
                    Message = $"AutomationEnvironmentType with ID {id} not found"
                });

            return Ok(new ApiResponse<AutomationEnvironmentTypeDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving AutomationEnvironmentType with ID {id}");
            return StatusCode(500, new ApiResponse<AutomationEnvironmentTypeDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<AutomationEnvironmentTypeDto>>> Create(
        [FromBody] AutomationEnvironmentTypeCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<AutomationEnvironmentTypeDto>
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
                new ApiResponse<AutomationEnvironmentTypeDto>
                {
                    Success = true,
                    Data = result,
                    Message = "AutomationEnvironmentType created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating AutomationEnvironmentType");
            return StatusCode(500, new ApiResponse<AutomationEnvironmentTypeDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id,
        [FromBody] AutomationEnvironmentTypeUpdateRequest request)
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
                    Message = $"AutomationEnvironmentType with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = "AutomationEnvironmentType updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating AutomationEnvironmentType with ID {id}");
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
                    Message = $"AutomationEnvironmentType with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = $"AutomationEnvironmentType with ID {id} deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error deleting AutomationEnvironmentType with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = $"An error occurred while deleting the AutomationEnvironmentType record with ID {id}",
                Errors = [ex.Message]
            });
        }
    }
}