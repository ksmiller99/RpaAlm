namespace RpaAlmApi.Models.DTOs;

public class StoryPointCostDto
{
    public int Id { get; set; }
    public int? Points { get; set; }
    public int? MaxHours { get; set; }
    public int? TotalCost { get; set; }
    public int? JnJCostShare { get; set; }
    public DateTime? EffectiveDate { get; set; }
}
