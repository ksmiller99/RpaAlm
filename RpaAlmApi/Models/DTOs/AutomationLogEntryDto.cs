namespace RpaAlmApi.Models.DTOs;

public class AutomationLogEntryDto
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public string? CreatedWwid { get; set; }
    public DateTime? CreatedDate { get; set; }
    public string? Comment { get; set; }
}
