using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Region domain model
/// </summary>
public class Region : IEntity
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
