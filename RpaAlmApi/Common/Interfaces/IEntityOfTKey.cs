namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Base interface for entities with generic primary key type
/// </summary>
/// <typeparam name="TKey">Type of the primary key</typeparam>
public interface IEntity<TKey>
{
    TKey Id { get; set; }
}
