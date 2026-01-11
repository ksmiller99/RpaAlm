namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Combined interface for full CRUD operations
/// </summary>
/// <typeparam name="T">Entity type</typeparam>
public interface IRepository<T> : IReadRepository<T>, IWriteRepository<T> where T : class
{
}
