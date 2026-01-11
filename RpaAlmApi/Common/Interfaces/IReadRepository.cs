namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Interface for read operations
/// </summary>
/// <typeparam name="T">Entity type</typeparam>
public interface IReadRepository<T> where T : class
{
    Task<IEnumerable<T>> GetAllAsync();
    Task<T?> GetByIdAsync(int id);
}
