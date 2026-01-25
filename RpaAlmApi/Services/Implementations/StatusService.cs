using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

/// <summary>
/// Service implementation for RpaStatus business logic
/// </summary>
public class StatusService : IStatusService
{
    private readonly IRpaStatusRepository _repository;
    private readonly IMapper _mapper;
    private readonly ILogger<StatusService> _logger;

    public StatusService(
        IRpaStatusRepository repository,
        IMapper mapper,
        ILogger<StatusService> logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<IEnumerable<RpaStatusDto>> GetAllAsync()
    {
        try
        {
            var statuses = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<RpaStatusDto>>(statuses);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all statuses");
            throw;
        }
    }

    public async Task<RpaStatusDto?> GetByIdAsync(int id)
    {
        try
        {
            var status = await _repository.GetByIdAsync(id);
            return status == null ? null : _mapper.Map<RpaStatusDto>(status);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving status with ID {Id}", id);
            throw;
        }
    }

    public async Task<RpaStatusDto> CreateAsync(RpaStatusCreateRequest request)
    {
        try
        {
            var status = _mapper.Map<RpaStatus>(request);
            var newId = await _repository.CreateAsync(status);

            status.Id = newId;
            return _mapper.Map<RpaStatusDto>(status);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating status with code {Code}", request.Code);
            throw;
        }
    }

    public async Task<bool> UpdateAsync(int id, RpaStatusUpdateRequest request)
    {
        try
        {
            var existingStatus = await _repository.GetByIdAsync(id);
            if (existingStatus == null)
            {
                return false;
            }

            var status = _mapper.Map<RpaStatus>(request);
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
