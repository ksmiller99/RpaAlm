namespace RpaAlmApi.Models.DTOs;

public class AutomationDto
{
    public int Id { get; set; }
    public  string? Name { get; set; }
    public int? SegmentId { get; set; }
    public int? RegionId { get; set; }
    public int? FunctionId { get; set; }
    public int? StatusId { get; set; }
    public string? BtoWwid { get; set; }
    public string? BoWwid { get; set; }
    public string? FcWwid { get; set; }
    public string? SseWwid { get; set; }
    public string? LseWwid { get; set; }
}
