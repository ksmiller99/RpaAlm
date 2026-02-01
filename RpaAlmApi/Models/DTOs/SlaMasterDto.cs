namespace RpaAlmApi.Models.DTOs;

public class SlaMasterDto
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public int? ComplexityId { get; set; }
    public int? MedalId { get; set; }
    public string? Zcode { get; set; }
    public string? CostCenter { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
}
