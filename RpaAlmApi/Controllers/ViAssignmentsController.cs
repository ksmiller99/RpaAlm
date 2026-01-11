using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ViAssignmentsController : ControllerBase
{
    private readonly IViAssignmentsService _service;
    private readonly ILogger<ViAssignmentsController> _logger;

    public ViAssignmentsController(IViAssignmentsService service, ILogger<ViAssignmentsController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<ViAssignmentsDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<ViAssignmentsDto>> { Success = true, Data = result });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all ViAssignments records");
            return StatusCode(500, new ApiResponse<IEnumerable<ViAssignmentsDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<ViAssignmentsDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null) return NotFound(new ApiResponse<ViAssignmentsDto> { Success = false, Message = $"ViAssignments with ID {id} not found" });
            return Ok(new ApiResponse<ViAssignmentsDto> { Success = true, Data = result });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving ViAssignments with ID {Id}", id);
            return StatusCode(500, new ApiResponse<ViAssignmentsDto> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<ViAssignmentsDto>>> Create([FromBody] ViAssignmentsCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid) return BadRequest(new ApiResponse<ViAssignmentsDto> { Success = false, Message = "Invalid request data" });
            var result = await _service.CreateAsync(request);
            return CreatedAtAction(nameof(GetById), new { id = result.Id }, new ApiResponse<ViAssignmentsDto> { Success = true, Data = result, Message = "Created successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating ViAssignments");
            return StatusCode(500, new ApiResponse<ViAssignmentsDto> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] ViAssignmentsUpdateRequest request)
    {
        try
        {
            if (!ModelState.IsValid) return BadRequest(new ApiResponse<bool> { Success = false, Message = "Invalid request data" });
            var result = await _service.UpdateAsync(id, request);
            if (!result) return NotFound(new ApiResponse<bool> { Success = false, Message = $"ViAssignments with ID {id} not found" });
            return Ok(new ApiResponse<bool> { Success = true, Data = true, Message = "Updated successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating ViAssignments with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var result = await _service.DeleteAsync(id);
            if (!result) return NotFound(new ApiResponse<bool> { Success = false, Message = $"ViAssignments with ID {id} not found" });
            return Ok(new ApiResponse<bool> { Success = true, Data = true, Message = "Deleted successfully" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting ViAssignments with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool> { Success = false, Message = "An error occurred", Errors = new List<string> { ex.Message } });
        }
    }
}
