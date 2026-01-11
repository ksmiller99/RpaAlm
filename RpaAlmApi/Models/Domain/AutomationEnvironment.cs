using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// AutomationEnvironment domain model (Automation deployment environments)
/// </summary>
public class AutomationEnvironment : IEntity
{
    public int Id { get; set; }
    public int? AutomationID { get; set; }
    public string? AppID { get; set; }
    public int? EnvironmentTypeID { get; set; }
}
