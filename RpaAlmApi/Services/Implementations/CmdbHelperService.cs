using AutoMapper;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;
using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;
using RpaAlmApi.Services.Interfaces;

namespace RpaAlmApi.Services.Implementations;

public class CmdbHelperService : ICmdbHelperService
{
    private readonly ICmdbHelperRepository _repository;
    private readonly IMapper _mapper;
    private readonly ILogger<CmdbHelperService> _logger;

    public CmdbHelperService(
        ICmdbHelperRepository repository,
        IMapper mapper,
        ILogger<CmdbHelperService> logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }

    public async Task<IEnumerable<CmdbHelperDto>> GetAllAsync()
    {
        try
        {
            var entities = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<CmdbHelperDto>>(entities);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all CmdbHelper records");
            throw;
        }
    }

    public async Task<CmdbHelperDto?> GetByAppIdAsync(string appId)
    {
        try
        {
            var entity = await _repository.GetByIdAsync(appId);
            return entity == null ? null : _mapper.Map<CmdbHelperDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving CmdbHelper with AppID {AppId}", appId);
            throw;
        }
    }

    public async Task<CmdbHelperDto> CreateAsync(CmdbHelperCreateRequest request)
    {
        try
        {
            var entity = _mapper.Map<CmdbHelper>(request);
            entity.Id = request.AppId;
            await _repository.CreateAsync(entity);

            return _mapper.Map<CmdbHelperDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating CmdbHelper with AppID {AppId}", request.AppId);
            throw;
        }
    }

    public async Task<bool> UpdateAsync(string appId, CmdbHelperUpdateRequest request)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(appId);
            if (existingEntity == null)
            {
                return false;
            }

            var entity = _mapper.Map<CmdbHelper>(request);
            entity.Id = appId;

            var rowsAffected = await _repository.UpdateAsync(entity);
            if (rowsAffected == -1) throw new Exception($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating CmdbHelper with AppID {AppId}", appId);
            throw;
        }
    }

    public async Task<bool> DeleteAsync(string appId)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(appId);
            if (existingEntity == null)
            {
                return false;
            }

            var rowsAffected = await _repository.DeleteAsync(appId);
            if (rowsAffected == -1) throw new Exception($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting CmdbHelper with AppID {AppId}", appId);
            throw;
        }
    }
}
