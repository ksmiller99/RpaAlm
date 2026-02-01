using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Automation domain model (Core RPA automation records)
/// </summary>
public class Automation : IEntity
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public int? SegmentId { get; set; }
    public int? RegionId { get; set; }
    public int? FunctionId { get; set; }
    public int? StatusId { get; set; }
    public string? BtoWwid { get; set; } // Business Technical Owner
    public string? BoWwid { get; set; }  // Business Owner
    public string? FcWwid { get; set; }  // Finance Contact
    public string? Zcode { get; set; }   // For chargebacks   
    public string? CostCenter { get; set; }  // For Chargebacks
    public string? SseWwid { get; set; } // Senior Service Engineer
    public string? LseWwid { get; set; } // Lead Service Engineer
}
