using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AutomationLogEntryController : ControllerBase
{
    private readonly ILogger<AutomationLogEntryController> _logger;
    private readonly IAutomationLogEntryService _service;

    public AutomationLogEntryController(
        IAutomationLogEntryService service,
        ILogger<AutomationLogEntryController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<AutomationLogEntryDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<AutomationLogEntryDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all AutomationLogEntry records");
            return StatusCode(500, new ApiResponse<IEnumerable<AutomationLogEntryDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = [ex.Message]
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<AutomationLogEntryDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
                return NotFound(new ApiResponse<AutomationLogEntryDto>
                {
                    Success = false,
                    Message = $"AutomationLogEntry with ID {id} not found"
                });

            return Ok(new ApiResponse<AutomationLogEntryDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving AutomationLogEntry with ID {id}");
            return StatusCode(500, new ApiResponse<AutomationLogEntryDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<AutomationLogEntryDto>>> Create(
        [FromBody] AutomationLogEntryCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<AutomationLogEntryDto>
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
                new ApiResponse<AutomationLogEntryDto>
                {
                    Success = true,
                    Data = result,
                    Message = "AutomationLogEntry created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating AutomationLogEntry");
            return StatusCode(500, new ApiResponse<AutomationLogEntryDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id,
        [FromBody] AutomationLogEntryUpdateRequest request)
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
                    Message = $"AutomationLogEntry with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = "AutomationLogEntry updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating AutomationLogEntry with ID {id}");
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
                    Message = $"AutomationLogEntry with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = $"AutomationLogEntry with ID {id} deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error deleting AutomationLogEntry with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = $"An error occurred while deleting the AutomationLogEntry record with ID {id}",
                Errors = [ex.Message]
            });
        }
    }
}