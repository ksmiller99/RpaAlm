using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Interfaces;

public interface IJjedsHelperRepository
{
    Task<IEnumerable<JjedsHelper>> GetAllAsync();
    Task<JjedsHelper?> GetByIdAsync(string wwid);
    Task<int> CreateAsync(JjedsHelper entity);
    Task<int> UpdateAsync(JjedsHelper entity);
    Task<int> DeleteAsync(string wwid);
}
