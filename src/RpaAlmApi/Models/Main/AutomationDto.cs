namespace RpaAlmApi.Models.Main;

public class AutomationDto
{
    public int ID { get; set; }
    public string Name { get; set; } = string.Empty;
    public int? SegmentID { get; set; }
    public int? RegionID { get; set; }
    public int? FunctionID { get; set; }
    public int RpaStatusID { get; set; }
    public int? BtoJjedsID { get; set; }
    public int? BoJjedsID { get; set; }
    public int? FcJjedsID { get; set; }
    public int? SseJjedsID { get; set; }
    public int? LseJjedsID { get; set; }
}
