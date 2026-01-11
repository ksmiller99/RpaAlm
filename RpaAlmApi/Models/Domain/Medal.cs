using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Medal domain model
/// </summary>
public class Medal : IEntity
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
}
