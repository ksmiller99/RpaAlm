using AutoMapper;
using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Services.Implementations;

/// <summary>
/// Base service with common CRUD logic
/// </summary>
public abstract class BaseService<TEntity, TDto, TCreateRequest, TUpdateRequest>
    where TEntity : class, IEntity, new()
{
    protected readonly IRepository<TEntity> Repository;
    protected readonly IMapper Mapper;
    protected readonly ILogger Logger;

    protected BaseService(
        IRepository<TEntity> repository,
        IMapper mapper,
        ILogger logger)
    {
        Repository = repository;
        Mapper = mapper;
        Logger = logger;
    }

    public virtual async Task<IEnumerable<TDto>> GetAllAsync()
    {
        try
        {
            var entities = await Repository.GetAllAsync();
            return Mapper.Map<IEnumerable<TDto>>(entities);
        }
        catch (Exception ex)
        {
            Logger.LogError(ex, $"Error retrieving all {typeof(TEntity).Name}");
            throw;
        }
    }

    public virtual async Task<TDto?> GetByIdAsync(int id)
    {
        try
        {
            var entity = await Repository.GetByIdAsync(id);
            return entity == null ? default : Mapper.Map<TDto>(entity);
        }
        catch (Exception ex)
        {
            Logger.LogError(ex, $"Error retrieving {typeof(TEntity).Name} with ID {id}");
            throw;
        }
    }

    public virtual async Task<TDto> CreateAsync(TCreateRequest request)
    {
        try
        {
            var entity = Mapper.Map<TEntity>(request);
            var newId = await Repository.CreateAsync(entity);

            entity.Id = newId;
            return Mapper.Map<TDto>(entity);
        }
        catch (Exception ex)
        {
            Logger.LogError(ex, $"Error creating {typeof(TEntity).Name}");
            throw;
        }
    }

    public virtual async Task<bool> UpdateAsync(int id, TUpdateRequest request)
    {
        try
        {
            var existingEntity = await Repository.GetByIdAsync(id);
            if (existingEntity == null)
            {
                return false;
            }

            var entity = Mapper.Map<TEntity>(request);
            entity.Id = id;

            var rowsAffected = await Repository.UpdateAsync(entity);
            if (rowsAffected == -1) throw new($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            Logger.LogError(ex, $"Error updating {typeof(TEntity).Name} with ID {id}");
            throw;
        }
    }

    public virtual async Task<bool> DeleteAsync(int id)
    {
        try
        {
            var existingEntity = await Repository.GetByIdAsync(id);
            if (existingEntity == null)
            {
                return false;
            }

            var rowsAffected = await Repository.DeleteAsync(id);
            if (rowsAffected == -1) throw new($"NOCOUNT is set to TRUE in stored procedure.");
            return rowsAffected == 1;
        }
        catch (Exception ex)
        {
            Logger.LogError(ex,$"Error deleting {typeof(TEntity).Name} with ID {id}");
            throw;
        }
    }
}
