using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Function domain model
/// </summary>
public class Function : IEntity
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
