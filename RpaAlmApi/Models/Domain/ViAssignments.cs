using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// ViAssignments domain model (Virtual identity to environment assignments)
/// </summary>
public class ViAssignments : IEntity
{
    public int Id { get; set; }
    public int? VirtualIdentityId { get; set; }
    public int? AutomationEnvironmentId { get; set; }
    public int? Percentage { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
}
