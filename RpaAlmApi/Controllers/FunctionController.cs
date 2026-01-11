using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class FunctionController : ControllerBase
{
    private readonly IFunctionService _service;
    private readonly ILogger<FunctionController> _logger;

    public FunctionController(IFunctionService service, ILogger<FunctionController> logger)
    {
        _service = service;
        _logger = logger;
    }

    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<FunctionDto>>>> GetAll()
    {
        var functions = await _service.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<FunctionDto>>.SuccessResponse(functions));
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<FunctionDto>>> GetById(int id)
    {
        var function = await _service.GetByIdAsync(id);
        if (function == null)
            return NotFound(ApiResponse<FunctionDto>.ErrorResponse($"Function with ID {id} not found"));
        return Ok(ApiResponse<FunctionDto>.SuccessResponse(function));
    }

    [HttpPost]
    public async Task<ActionResult<ApiResponse<FunctionDto>>> Create([FromBody] FunctionCreateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<FunctionDto>.ErrorResponse("Validation failed"));

        var function = await _service.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = function.Id },
            ApiResponse<FunctionDto>.SuccessResponse(function, "Function created successfully"));
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Update(int id, [FromBody] FunctionUpdateRequest request)
    {
        if (!ModelState.IsValid)
            return BadRequest(ApiResponse<bool>.ErrorResponse("Validation failed"));

        var success = await _service.UpdateAsync(id, request);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Function with ID {id} not found"));

        return Ok(ApiResponse<bool>.SuccessResponse(true, "Function updated successfully"));
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<bool>>> Delete(int id)
    {
        var success = await _service.DeleteAsync(id);
        if (!success)
            return NotFound(ApiResponse<bool>.ErrorResponse($"Function with ID {id} not found"));

        return Ok(ApiResponse<bool>.SuccessResponse(true, "Function deleted successfully"));
    }
}
