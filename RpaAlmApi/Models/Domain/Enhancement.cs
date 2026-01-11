using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Enhancement domain model
/// </summary>
public class Enhancement : IEntity
{
    public int Id { get; set; }
    public string? Scope { get; set; }
}
