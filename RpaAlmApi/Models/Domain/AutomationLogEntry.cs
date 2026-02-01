using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// AutomationLogEntry domain model (Audit log for automation changes)
/// </summary>
public class AutomationLogEntry : IEntity
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public string? CreatedWwid { get; set; }
    public DateTime? CreatedDate { get; set; }
    public string? Comment { get; set; }
}
