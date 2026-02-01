using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class JjedsHelperController : ControllerBase
{
    private readonly ILogger<JjedsHelperController> _logger;
    private readonly IJjedsHelperService _service;

    public JjedsHelperController(
        IJjedsHelperService service,
        ILogger<JjedsHelperController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<JjedsHelperDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<JjedsHelperDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all JjedsHelper records");
            return StatusCode(500, new ApiResponse<IEnumerable<JjedsHelperDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = [ex.Message]
            });
        }
    }

    [HttpGet("{wwid}")]
    public async Task<ActionResult<ApiResponse<JjedsHelperDto>>> GetByWwid(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
                return NotFound(new ApiResponse<JjedsHelperDto>
                {
                    Success = false,
                    Message = $"JjedsHelper with ID {id} not found"
                });

            return Ok(new ApiResponse<JjedsHelperDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving JjedsHelper with ID {id}");
            return StatusCode(500, new ApiResponse<JjedsHelperDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<JjedsHelperDto>>> Create([FromBody] JjedsHelperCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<JjedsHelperDto>
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
                nameof(GetByWwid),
                new { wwid = result.Wwid },
                new ApiResponse<JjedsHelperDto>
                {
                    Success = true,
                    Data = result,
                    Message = "JjedsHelper created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating JjedsHelper");
            return StatusCode(500, new ApiResponse<JjedsHelperDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPut("{wwid}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] JjedsHelperUpdateRequest request)
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
                    Message = $"JjedsHelper with ID {id} not found"
                });

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "JjedsHelper updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating JjedsHelper with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while updating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpDelete("{wwid}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        try
        {
            var result = await _service.DeleteAsync(id);
            if (!result)
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"JjedsHelper with ID {id} not found"
                });

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "JjedsHelper deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error deleting JjedsHelper with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while deleting the record",
                Errors = [ex.Message]
            });
        }
    }
}