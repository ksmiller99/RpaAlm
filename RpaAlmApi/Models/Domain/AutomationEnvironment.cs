using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// AutomationEnvironment domain model (Automation deployment environments)
/// </summary>
public class AutomationEnvironment : IEntity
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public string? AppId { get; set; }
    public int? EnvironmentTypeId { get; set; }
}
