using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Segment domain model
/// </summary>
public class Segment : IEntity
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
