using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

/// <summary>
/// Service implementation for Status business logic
/// </summary>
public class StatusService : IStatusService
{
    private readonly IStatusRepository _repository;
    private readonly IMapper _mapper;
    private readonly ILogger<StatusService> _logger;

    public StatusService(
        IStatusRepository repository,
        IMapper mapper,
        ILogger<StatusService> logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<IEnumerable<StatusDto>> GetAllAsync()
    {
        try
        {
            var statuses = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<StatusDto>>(statuses);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all statuses");
            throw;
        }
    }

    public async Task<StatusDto?> GetByIdAsync(int id)
    {
        try
        {
            var status = await _repository.GetByIdAsync(id);
            return status == null ? null : _mapper.Map<StatusDto>(status);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving status with ID {Id}", id);
            throw;
        }
    }

    public async Task<StatusDto> CreateAsync(StatusCreateRequest request)
    {
        try
        {
            var status = _mapper.Map<Status>(request);
            var newId = await _repository.CreateAsync(status);

            status.Id = newId;
            return _mapper.Map<StatusDto>(status);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating status with code {Code}", request.Code);
            throw;
        }
    }

    public async Task<bool> UpdateAsync(int id, StatusUpdateRequest request)
    {
        try
        {
            var existingStatus = await _repository.GetByIdAsync(id);
            if (existingStatus == null)
            {
                return false;
            }

            var status = _mapper.Map<Status>(request);
            status.Id = id;

            var rowsAffected = await _repository.UpdateAsync(status);
            return rowsAffected > 0;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating status with ID {Id}", id);
            throw;
        }
    }

    public async Task<bool> DeleteAsync(int id)
    {
        try
        {
            var existingStatus = await _repository.GetByIdAsync(id);
            if (existingStatus == null)
            {
                return false;
            }

            var rowsAffected = await _repository.DeleteAsync(id);
            return rowsAffected > 0;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting status with ID {Id}", id);
            throw;
        }
    }
}
