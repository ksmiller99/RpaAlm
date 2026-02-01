namespace RpaAlmApi.Models.DTOs;

public class SlaLogEntryDto
{
    public int Id { get; set; }
    public int? SlaMasterId { get; set; }
    public string? CreatedWwid { get; set; }
    public DateTime? CreatedDate { get; set; }
    public string? Comment { get; set; }
}
