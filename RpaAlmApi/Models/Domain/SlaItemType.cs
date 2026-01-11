using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// SlaItemType domain model
/// </summary>
public class SlaItemType : IEntity
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public int? Cost { get; set; }
    public int? Disabled { get; set; }
}
