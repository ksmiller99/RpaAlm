using AutoMapper;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Services.Implementations;

/// <summary>
/// Base service with common CRUD logic
/// </summary>
public abstract class BaseService<TEntity, TDto, TCreateRequest, TUpdateRequest>
    where TEntity : class, IEntity, new()
{
    protected readonly IRepository<TEntity> _repository;
    protected readonly IMapper _mapper;
    protected readonly ILogger _logger;

    protected BaseService(
        IRepository<TEntity> repository,
        IMapper mapper,
        ILogger logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }

    public virtual async Task<IEnumerable<TDto>> GetAllAsync()
    {
        try
        {
            var entities = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<TDto>>(entities);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving all {EntityType}", typeof(TEntity).Name);
            throw;
        }
    }

    public virtual async Task<TDto?> GetByIdAsync(int id)
    {
        try
        {
            var entity = await _repository.GetByIdAsync(id);
            return entity == null ? default : _mapper.Map<TDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving {EntityType} with ID {Id}", typeof(TEntity).Name, id);
            throw;
        }
    }

    public virtual async Task<TDto> CreateAsync(TCreateRequest request)
    {
        try
        {
            var entity = _mapper.Map<TEntity>(request);
            var newId = await _repository.CreateAsync(entity);

            entity.Id = newId;
            return _mapper.Map<TDto>(entity);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating {EntityType}", typeof(TEntity).Name);
            throw;
        }
    }

    public virtual async Task<bool> UpdateAsync(int id, TUpdateRequest request)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(id);
            if (existingEntity == null)
            {
                return false;
            }

            var entity = _mapper.Map<TEntity>(request);
            entity.Id = id;

            var rowsAffected = await _repository.UpdateAsync(entity);
            return rowsAffected > 0;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating {EntityType} with ID {Id}", typeof(TEntity).Name, id);
            throw;
        }
    }

    public virtual async Task<bool> DeleteAsync(int id)
    {
        try
        {
            var existingEntity = await _repository.GetByIdAsync(id);
            if (existingEntity == null)
            {
                return false;
            }

            var rowsAffected = await _repository.DeleteAsync(id);
            return rowsAffected > 0;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting {EntityType} with ID {Id}", typeof(TEntity).Name, id);
            throw;
        }
    }
}
