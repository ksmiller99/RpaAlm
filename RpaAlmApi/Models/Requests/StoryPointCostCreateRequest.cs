namespace RpaAlmApi.Models.Requests;

public class StoryPointCostCreateRequest
{
    public int? Points { get; set; }
    public int? MaxHours { get; set; }
    public int? TotalCost { get; set; }
    public int? JnJCostShare { get; set; }
    public DateTime? EffectiveDate { get; set; }
}
