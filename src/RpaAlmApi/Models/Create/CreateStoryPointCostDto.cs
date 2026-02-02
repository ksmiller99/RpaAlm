namespace RpaAlmApi.Models.Create;

public class CreateStoryPointCostDto
{
    public int Points { get; set; }
    public int MaxHours { get; set; }
    public decimal TotalCost { get; set; }
    public int JnJCostPercentage { get; set; }
    public DateTime EffectiveDate { get; set; }
}
