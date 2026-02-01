using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ComplexityController : ControllerBase
{
    private readonly ILogger<ComplexityController> _logger;
    private readonly IComplexityService _service;

    public ComplexityController(
        IComplexityService service,
        ILogger<ComplexityController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<ComplexityDto>>>> GetAll()
    {
        try
        {
            var result = await _service.GetAllAsync();
            return Ok(new ApiResponse<IEnumerable<ComplexityDto>>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all Complexity records");
            return StatusCode(500, new ApiResponse<IEnumerable<ComplexityDto>>
            {
                Success = false,
                Message = "An error occurred while retrieving records",
                Errors = [ex.Message]
            });
        }
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<ComplexityDto>>> GetById(int id)
    {
        try
        {
            var result = await _service.GetByIdAsync(id);
            if (result == null)
                return NotFound(new ApiResponse<ComplexityDto>
                {
                    Success = false,
                    Message = $"Complexity with ID {id} not found"
                });

            return Ok(new ApiResponse<ComplexityDto>
            {
                Success = true,
                Data = result
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving Complexity with ID {id}");
            return StatusCode(500, new ApiResponse<ComplexityDto>
            {
                Success = false,
                Message = "An error occurred while retrieving the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<ComplexityDto>>> Create([FromBody] ComplexityCreateRequest request)
    {
        try
        {
            if (!ModelState.IsValid)
                return BadRequest(new ApiResponse<ComplexityDto>
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
                new ApiResponse<ComplexityDto>
                {
                    Success = true,
                    Data = result,
                    Message = "Complexity created successfully"
                });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating Complexity");
            return StatusCode(500, new ApiResponse<ComplexityDto>
            {
                Success = false,
                Message = "An error occurred while creating the record",
                Errors = [ex.Message]
            });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] ComplexityUpdateRequest request)
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
                    Message = $"Complexity with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = "Complexity updated successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating Complexity with ID {id}");
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
                    Message = $"Complexity with ID {id} not found"
                });

            return Ok(new ApiResponse<bool?>
            {
                Success = true,
                Data = null,
                Message = $"Complexity with ID {id} deleted successfully"
            });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error deleting Complexity with ID {id}");
            return StatusCode(500, new ApiResponse<bool>
            {
                Success = false,
                Message = $"An error occurred while deleting the Complexity record with ID {id}",
                Errors = [ex.Message]
            });
        }
    }
}