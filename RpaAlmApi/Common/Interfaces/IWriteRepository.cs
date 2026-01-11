namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Interface for write operations
/// </summary>
/// <typeparam name="T">Entity type</typeparam>
public interface IWriteRepository<T> where T : class
{
    Task<int> CreateAsync(T entity);
    Task<int> UpdateAsync(T entity);
    Task<int> DeleteAsync(int id);
}
