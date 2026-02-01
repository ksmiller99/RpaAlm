using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// SlaMaster domain model (SLA master agreements)
/// </summary>
public class SlaMaster : IEntity
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public int? ComplexityId { get; set; }
    public int? MedalId { get; set; }
    public string? Zcode { get; set; }
    public string? CostCenter { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
}
