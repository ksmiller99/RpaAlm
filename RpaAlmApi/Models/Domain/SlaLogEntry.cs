using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// SlaLogEntry domain model (Audit log for SLA changes)
/// </summary>
public class SlaLogEntry : IEntity
{
    public int Id { get; set; }
    public int? SlaMasterId { get; set; }
    public string? CreatedWwid { get; set; }
    public DateTime? CreatedDate { get; set; }
    public string? Comment { get; set; }
}
