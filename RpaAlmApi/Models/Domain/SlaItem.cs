using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// SlaItem domain model (SLA line items)
/// </summary>
public class SlaItem : IEntity
{
    public int Id { get; set; }
    public int? SlaMasterID { get; set; }
    public int? SlaItemTypeID { get; set; }
    public int? EnhancementID { get; set; }
}
