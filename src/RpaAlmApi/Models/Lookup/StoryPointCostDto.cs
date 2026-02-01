namespace RpaAlmApi.Models.Lookup;

public class StoryPointCostDto
{
    public int ID { get; set; }
    public int Points { get; set; }
    public int MaxHours { get; set; }
    public decimal TotalCost { get; set; }
    public int JnJCostPercentage { get; set; }
    public DateTime EffectiveDate { get; set; }
}
