namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Base interface for entities with integer primary key
/// </summary>
public interface IEntity
{
    int Id { get; set; }
}
