using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// ADDomain domain model
/// </summary>
public class ADDomain : IEntity
{
    public int Id { get; set; }
    public string? Domain { get; set; }
    public string? Description { get; set; }
}
