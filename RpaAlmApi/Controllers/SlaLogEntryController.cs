using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SlaLogEntryController : ControllerBase
{
    private readonly ISlaLogEntryService _service;
    private readonly ILogger<SlaLogEntryController> _logger;

    public SlaLogEntryController(ISlaLogEntryService service, ILogger<SlaLogEntryController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<SlaLogEntryDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<SlaLogEntryDto>> { Success = true, Data = result });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all SlaLogEntry records");
            return StatusCode(500, new ApiResponse<IEnumerable<SlaLogEntryDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<SlaLogEntryDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null) return NotFound(new ApiResponse<SlaLogEntryDto> { Success = false, Message = $"SlaLogEntry with ID {id} not found" });
            return Ok(new ApiResponse<SlaLogEntryDto> { Success = true, Data = result });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving SlaLogEntry with ID {Id}", id);
            return StatusCode(500, new ApiResponse<SlaLogEntryDto> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<SlaLogEntryDto>>> Create([FromBody] SlaLogEntryCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid) return BadRequest(new ApiResponse<SlaLogEntryDto> { Success = false, Message = "Invalid request data" });
            var result = await _service.CreateAsync(request);
            return CreatedAtAction(nameof(GetById), new { id = result.Id }, new ApiResponse<SlaLogEntryDto> { Success = true, Data = result, Message = "Created successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating SlaLogEntry");
            return StatusCode(500, new ApiResponse<SlaLogEntryDto> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] SlaLogEntryUpdateRequest request)
    {
        try
        {
            if (!ModelState.IsValid) return BadRequest(new ApiResponse<bool> { Success = false, Message = "Invalid request data" });
            var result = await _service.UpdateAsync(id, request);
            if (!result) return NotFound(new ApiResponse<bool> { Success = false, Message = $"SlaLogEntry with ID {id} not found" });
            return Ok(new ApiResponse<bool> { Success = true, Data = true, Message = "Updated successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating SlaLogEntry with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var result = await _service.DeleteAsync(id);
            if (!result) return NotFound(new ApiResponse<bool> { Success = false, Message = $"SlaLogEntry with ID {id} not found" });
            return Ok(new ApiResponse<bool> { Success = true, Data = true, Message = "Deleted successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting SlaLogEntry with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }
}
