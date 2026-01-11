using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Interfaces;

public interface ICmdbHelperRepository
{
    Task<IEnumerable<CmdbHelper>> GetAllAsync();
    Task<CmdbHelper?> GetByIdAsync(string appId);
    Task<int> CreateAsync(CmdbHelper entity);
    Task<int> UpdateAsync(CmdbHelper entity);
    Task<int> DeleteAsync(string appId);
}
