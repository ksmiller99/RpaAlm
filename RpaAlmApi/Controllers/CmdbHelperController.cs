using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CmdbHelperController : ControllerBase
{
    private readonly ICmdbHelperService _service;
    private readonly ILogger<CmdbHelperController> _logger;

    public CmdbHelperController(
        ICmdbHelperService service,
        ILogger<CmdbHelperController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<CmdbHelperDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<CmdbHelperDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all CmdbHelper records");
            return StatusCode(500, new ApiResponse<IEnumerable<CmdbHelperDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpGet("{appId}")]
    public async Task<ActionResult<ApiResponse<CmdbHelperDto>>> GetByAppId(string appId)
    {
        try
        {
            var result = await _service.GetByAppIdAsync(appId);
            if (result == null)
            {
                return NotFound(new ApiResponse<CmdbHelperDto>
                {
                    Success = false,
                    Message = $"CmdbHelper with AppID {appId} not found"
                });
            }

            return Ok(new ApiResponse<CmdbHelperDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving CmdbHelper with AppID {AppId}", appId);
            return StatusCode(500, new ApiResponse<CmdbHelperDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<CmdbHelperDto>>> Create([FromBody] CmdbHelperCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new ApiResponse<CmdbHelperDto>
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
                nameof(GetByAppId),
                new { appId = result.AppId },
                new ApiResponse<CmdbHelperDto>
                {
                    Success = true,
                    Data = result,
                    Message = "CmdbHelper created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating CmdbHelper");
            return StatusCode(500, new ApiResponse<CmdbHelperDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpPut("{appId}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(string appId, [FromBody] CmdbHelperUpdateRequest request)
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

            var result = await _service.UpdateAsync(appId, request);
            if (!result)
            {
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"CmdbHelper with AppID {appId} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "CmdbHelper updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating CmdbHelper with AppID {AppId}", appId);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while updating the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }

    [HttpDelete("{appId}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(string appId)
    {
        try
        {
            var result = await _service.DeleteAsync(appId);
            if (!result)
            {
                return NotFound(new ApiResponse<bool>
                {
                    Success = false,
                    Message = $"CmdbHelper with AppID {appId} not found"
                });
            }

            return Ok(new ApiResponse<bool>
            {
                Success = true,
                Data = true,
                Message = "CmdbHelper deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting CmdbHelper with AppID {AppId}", appId);
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = "An error occurred while deleting the record",
                Errors = new List<string> { ex.Message }
            });
        }
    }
}
