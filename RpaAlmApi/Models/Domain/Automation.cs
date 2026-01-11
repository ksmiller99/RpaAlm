using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// Automation domain model (Core RPA automation records)
/// </summary>
public class Automation : IEntity
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public int? SegmentID { get; set; }
    public int? RegionID { get; set; }
    public int? FunctionID { get; set; }
    public int? StatusID { get; set; }
    public string? BtoWWID { get; set; } // Business Technical Owner
    public string? BoWWID { get; set; }  // Business Owner
    public string? FcWWID { get; set; }  // Functional Champion
    public string? BuildZcode { get; set; }
    public string? BuildCostCenter { get; set; }
    public string? SseWWID { get; set; } // Senior Service Engineer
    public string? LseWWID { get; set; } // Lead Service Engineer
}
