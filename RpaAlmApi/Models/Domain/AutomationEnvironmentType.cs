using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// AutomationEnvironmentType domain model
/// </summary>
public class AutomationEnvironmentType : IEntity
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
