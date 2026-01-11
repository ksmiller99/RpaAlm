using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Status domain model
/// </summary>
public class Status : IEntity
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
