using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

/// <summary>
/// API Controller for RpaStatus management
/// </summary>
[ApiController]
[Route("api/[controller]")]
[Produces("application/json")]
public class RpaStatusController : ControllerBase
{
    private readonly IRpaStatusService _rpaStatusService;
    private readonly ILogger<RpaStatusController> _logger;

    public RpaStatusController(IRpaStatusService rpaStatusService, ILogger<RpaStatusController> logger)
    {
        _rpaStatusService = rpaStatusService;
        _logger = logger;
    }

    /// <summary>
    /// Get all statuses
    /// </summary>
    /// <returns>List of all statuses</returns>
    [HttpGet]
    [ProducesResponseType(typeof(ApiResponse<IEnumerable<RpaStatusDto>>), StatusCodes.Status200OK)]
    public async Task<ActionResult<ApiResponse<IEnumerable<RpaStatusDto>>>> GetAll()
    {
        try
        {
            var statuses = await _rpaStatusService.GetAllAsync();
            return Ok(ApiResponse<IEnumerable<RpaStatusDto>>.SuccessResponse(statuses));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all statuses");
            return StatusCode(500, ApiResponse<IEnumerable<RpaStatusDto>>.ErrorResponse(
                "An error occurred while retrieving statuses",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Get status by ID
    /// </summary>
    /// <param name="id">RpaStatus ID</param>
    /// <returns>RpaStatus details</returns>
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ApiResponse<RpaStatusDto>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<RpaStatusDto>), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ApiResponse<RpaStatusDto>>> GetById(int id)
    {
        try
        {
            var status = await _rpaStatusService.GetByIdAsync(id);

            if (status == null)
            {
                return NotFound(ApiResponse<RpaStatusDto>.ErrorResponse(
                    $"RpaStatus with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<RpaStatusDto>.SuccessResponse(status));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving status with ID {Id}", id);
            return StatusCode(500, ApiResponse<RpaStatusDto>.ErrorResponse(
                "An error occurred while retrieving the status",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Create a new status
    /// </summary>
    /// <param name="request">RpaStatus creation request</param>
    /// <returns>Created status</returns>
    [HttpPost]
    [ProducesResponseType(typeof(ApiResponse<RpaStatusDto>), StatusCodes.Status201Created)]
    [ProducesResponseType(typeof(ApiResponse<RpaStatusDto>), StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<ApiResponse<RpaStatusDto>>> Create([FromBody] RpaStatusCreateRequest request)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ApiResponse<RpaStatusDto>.ErrorResponse(
                "Validation failed",
                ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList()
            ));
        }

        try
        {
            var status = await _rpaStatusService.CreateAsync(request);
            return CreatedAtAction(
                nameof(GetById),
                new { id = status.Id },
                ApiResponse<RpaStatusDto>.SuccessResponse(status, "RpaStatus created successfully")
            );
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating status");
            return StatusCode(500, ApiResponse<RpaStatusDto>.ErrorResponse(
                "An error occurred while creating the status",
                new List<string> { ex.Message }
            ));
        }
    }

    /// <summary>
    /// Update an existing status
    /// </summary>
    /// <param name="id">RpaStatus ID</param>
    /// <param name="request">RpaStatus update request</param>
    /// <returns>Success status</returns>
    [HttpPut("{id}")]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status404NotFound)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] RpaStatusUpdateRequest request)
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
            var success = await _rpaStatusService.UpdateAsync(id, request);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"RpaStatus with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool?>.SuccessResponse(null, "RpaStatus updated successfully"));
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
    /// <param name="id">RpaStatus ID</param>
    /// <returns>Success status</returns>
    [HttpDelete("{id}")]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ApiResponse<bool>), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var success = await _rpaStatusService.DeleteAsync(id);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"RpaStatus with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool?>.SuccessResponse(null, "RpaStatus deleted successfully"));
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
