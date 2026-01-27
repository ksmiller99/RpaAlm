using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class JjedsHelperService : IJjedsHelperService
{
    private readonly IJjedsHelperRepository _repository;
    private readonly IMapper _mapper;
    private readonly ILogger<JjedsHelperService> _logger;

    public JjedsHelperService(
        IJjedsHelperRepository repository,
        IMapper mapper,
        ILogger<JjedsHelperService> logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<IEnumerable<JjedsHelperDto>> GetAllAsync()
    {
        try
        {
            var entities = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<JjedsHelperDto>>(entities);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving all JjedsHelper records");
            throw;
        }
    }

    public async Task<JjedsHelperDto?> GetByWwidAsync(string wwid)
    {
        try
        {
            var entity = await _repository.GetByIdAsync(wwid);
            return entity == null ? null : _mapper.Map<JjedsHelperDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error retrieving JjedsHelper with WWID {wwid}");
            throw;
        }
    }

    public async Task<JjedsHelperDto> CreateAsync(JjedsHelperCreateRequest request)
    {
        try
        {
            var entity = _mapper.Map<JjedsHelper>(request);
            entity.Id = request.Wwid;
            await _repository.CreateAsync(entity);

            return _mapper.Map<JjedsHelperDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error creating JjedsHelper with WWID {request.Wwid}");
            throw;
        }
    }

    public async Task<bool> UpdateAsync(string wwid, JjedsHelperUpdateRequest request)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(wwid);
            if (existingEntity == null)
            {
                return false;
            }

            var entity = _mapper.Map<JjedsHelper>(request);
            entity.Id = wwid;

            var rowsAffected = await _repository.UpdateAsync(entity);
            if (rowsAffected == -1) throw new($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error updating JjedsHelper with WWID {wwid}");
            throw;
        }
    }

    public async Task<bool> DeleteAsync(string wwid)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(wwid);
            if (existingEntity == null)
            {
                return false;
            }

            var rowsAffected = await _repository.DeleteAsync(wwid);
            if (rowsAffected == -1) throw new($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex,$"Error deleting JjedsHelper with WWID {wwid}");
            throw;
        }
    }
}
