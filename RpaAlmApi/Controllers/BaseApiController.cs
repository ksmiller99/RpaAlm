using Microsoft.AspNetCore.Mvc;
using RpaAlmApi.Common;

namespace RpaAlmApi.Controllers;

/// <summary>
/// Base controller with common CRUD operations
/// </summary>
[ApiController]
[Route("api/[controller]")]
[Produces("application/json")]
public abstract class BaseApiController<TDto, TCreateRequest, TUpdateRequest, TService> : ControllerBase
    where TDto : class
{
    protected readonly TService _service;
    protected readonly ILogger _logger;

    protected BaseApiController(TService service, ILogger logger)
    {
        _service = service;
        _logger = logger;
    }

    protected async Task<ActionResult<ApiResponse<IEnumerable<TDto>>>> GetAllAsync(
        Func<Task<IEnumerable<TDto>>> getAllFunc)
    {
        try
        {
            var items = await getAllFunc();
            return Ok(ApiResponse<IEnumerable<TDto>>.SuccessResponse(items));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all items");
            return StatusCode(500, ApiResponse<IEnumerable<TDto>>.ErrorResponse(
                "An error occurred while retrieving items",
                new List<string> { ex.Message }
            ));
        }
    }

    protected async Task<ActionResult<ApiResponse<TDto>>> GetByIdAsync(
        int id,
        Func<int, Task<TDto?>> getByIdFunc,
        string entityName)
    {
        try
        {
            var item = await getByIdFunc(id);

            if (item == null)
            {
                return NotFound(ApiResponse<TDto>.ErrorResponse(
                    $"{entityName} with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<TDto>.SuccessResponse(item));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving item with ID {Id}", id);
            return StatusCode(500, ApiResponse<TDto>.ErrorResponse(
                $"An error occurred while retrieving the {entityName}",
                new List<string> { ex.Message }
            ));
        }
    }

    protected async Task<ActionResult<ApiResponse<TDto>>> CreateAsync(
        TCreateRequest request,
        Func<TCreateRequest, Task<TDto>> createFunc,
        string entityName)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ApiResponse<TDto>.ErrorResponse(
                "Validation failed",
                ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList()
            ));
        }

        try
        {
            var item = await createFunc(request);
            return CreatedAtAction(
                "GetById",
                new { id = GetItemId(item) },
                ApiResponse<TDto>.SuccessResponse(item, $"{entityName} created successfully")
            );
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating {EntityName}", entityName);
            return StatusCode(500, ApiResponse<TDto>.ErrorResponse(
                $"An error occurred while creating the {entityName}",
                new List<string> { ex.Message }
            ));
        }
    }

    protected async Task<ActionResult<ApiResponse<bool>>> UpdateAsync(
        int id,
        TUpdateRequest request,
        Func<int, TUpdateRequest, Task<bool>> updateFunc,
        string entityName)
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
            var success = await updateFunc(id, request);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"{entityName} with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool?>.SuccessResponse(null, $"{entityName} updated successfully"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating {EntityName} with ID {Id}", entityName, id);
            return StatusCode(500, ApiResponse<bool>.ErrorResponse(
                $"An error occurred while updating the {entityName}",
                new List<string> { ex.Message }
            ));
        }
    }

    protected async Task<ActionResult<ApiResponse<bool>>> DeleteAsync(
        int id,
        Func<int, Task<bool>> deleteFunc,
        string entityName)
    {
        try
        {
            var success = await deleteFunc(id);

            if (!success)
            {
                return NotFound(ApiResponse<bool>.ErrorResponse(
                    $"{entityName} with ID {id} not found"
                ));
            }

            return Ok(ApiResponse<bool?>.SuccessResponse(null, $"{entityName} deleted successfully"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting {EntityName} with ID {Id}", entityName, id);
            return StatusCode(500, ApiResponse<bool>.ErrorResponse(
                $"An error occurred while deleting the {entityName}",
                new List<string> { ex.Message }
            ));
        }
    }

    protected abstract int GetItemId(TDto item);
}
