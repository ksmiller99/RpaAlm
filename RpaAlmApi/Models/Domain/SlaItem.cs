using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// SlaItem domain model (SLA line items)
/// </summary>
public class SlaItem : IEntity
{
    public int Id { get; set; }
    public int? SlaMasterId { get; set; }
    public int? SlaItemTypeId { get; set; }
    public int? EnhancementId { get; set; }
}
