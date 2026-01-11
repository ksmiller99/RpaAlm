using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class VirtualIdentityController : ControllerBase
{
    private readonly IVirtualIdentityService _service;
    private readonly ILogger<VirtualIdentityController> _logger;

    public VirtualIdentityController(
        IVirtualIdentityService service,
        ILogger<VirtualIdentityController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<VirtualIdentityDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<VirtualIdentityDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all VirtualIdentity records");
            return StatusCode(500, new ApiResponse<IEnumerable<VirtualIdentityDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<VirtualIdentityDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
            {
                return NotFound(new ApiResponse<VirtualIdentityDto>
                {
                    Success = false,
                    Message = $"VirtualIdentity with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<VirtualIdentityDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving VirtualIdentity with ID {Id}", id);
            return StatusCode(500, new ApiResponse<VirtualIdentityDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<VirtualIdentityDto>>> Create([FromBody] VirtualIdentityCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new ApiResponse<VirtualIdentityDto>
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
                new ApiResponse<VirtualIdentityDto>
                {
                    Success = true,
                    Data = result,
                    Message = "VirtualIdentity created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating VirtualIdentity");
            return StatusCode(500, new ApiResponse<VirtualIdentityDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] VirtualIdentityUpdateRequest request)
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
                    Message = $"VirtualIdentity with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "VirtualIdentity updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating VirtualIdentity with ID {Id}", id);
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
                    Message = $"VirtualIdentity with ID {id} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "VirtualIdentity deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting VirtualIdentity with ID {Id}", id);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while deleting the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }
}
