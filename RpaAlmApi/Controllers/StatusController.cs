using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

/// <summary>
/// API Controller for Status management
/// </summary>
[ApiController]
[Route("api/[controller]")]
[Produces("application/json")]
public class StatusController : ControllerBase
{
    private readonly IStatusService _statusService;
    private readonly ILogger<StatusController> _logger;

    public StatusController(IStatusService statusService, ILogger<StatusController> logger)
    {
        _statusService = statusService;
        _logger = logger;
    }

    /// <summary>
    /// Get all statuses
    /// </summary>
    /// <returns>List of all statuses</returns>
    [HttpGet]
    [ProducesResponseType(typeof(ApiResponse<IEnumerable<StatusDto>>), StatusCodes.Status200OK)]
    public async Task<ActionResult<ApiResponse<IEnumerable<StatusDto>>>> GetAll()
    {
        try
        {
            var statuses = await _statusService.GetAllAsync();
            return Ok(ApiResponse<IEnumerable<StatusDto>>.SuccessResponse(statuses));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all statuses");
            return StatusCode(500, ApiResponse<IEnumerable<StatusDto>>.ErrorResponse(
                "An error occurred while retrieving statuses",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Get status by ID
    /// </summary>
    /// <param name="id">Status ID</param>
    /// <returns>Status details</returns>
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ApiResponse<StatusDto>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<StatusDto>), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ApiResponse<StatusDto>>> GetById(int id)
    {
        try
        {
            var status = await _statusService.GetByIdAsync(id);

            if (status == null)
            {
                return NotFound(ApiResponse<StatusDto>.ErrorResponse(
                    $"Status with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<StatusDto>.SuccessResponse(status));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving status with ID {Id}", id);
            return StatusCode(500, ApiResponse<StatusDto>.ErrorResponse(
                "An error occurred while retrieving the status",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Create a new status
    /// </summary>
    /// <param name="request">Status creation request</param>
    /// <returns>Created status</returns>
    [HttpPost]
    [ProducesResponseType(typeof(ApiResponse<StatusDto>), StatusCodes.Status201Created)]
    [ProducesResponseType(typeof(ApiResponse<StatusDto>), StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<ApiResponse<StatusDto>>> Create([FromBody] StatusCreateRequest request)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ApiResponse<StatusDto>.ErrorResponse(
                "Validation failed",
                ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList()
            ));
        }

        try
        {
            var status = await _statusService.CreateAsync(request);
            return CreatedAtAction(
                nameof(GetById),
                new { id = status.Id },
                ApiResponse<StatusDto>.SuccessResponse(status, "Status created successfully")
            );
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating status");
            return StatusCode(500, ApiResponse<StatusDto>.ErrorResponse(
                "An error occurred while creating the status",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Update an existing status
    /// </summary>
    /// <param name="id">Status ID</param>
    /// <param name="request">Status update request</param>
    /// <returns>Success status</returns>
    [HttpPut("{id}")]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status404NotFound)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] StatusUpdateRequest request)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ApiResponse<bool>.ErrorResponse(
                "Validation failed",
                ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList()
            ));
        }

        try
        {
            var success = await _statusService.UpdateAsync(id, request);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"Status with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool>.SuccessResponse(true, "Status updated successfully"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating status with ID {Id}", id);
            return StatusCode(500, ApiResponse<bool>.ErrorResponse(
                "An error occurred while updating the status",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Delete a status
    /// </summary>
    /// <param name="id">Status ID</param>
    /// <returns>Success status</returns>
    [HttpDelete("{id}")]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var success = await _statusService.DeleteAsync(id);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"Status with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool>.SuccessResponse(true, "Status deleted successfully"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting status with ID {Id}", id);
            return StatusCode(500, ApiResponse<bool>.ErrorResponse(
                "An error occurred while deleting the status",
                new List<string> { ex.Message }
            ));
        }
    }
}
