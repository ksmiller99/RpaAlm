namespace RpaAlmApi.Models.Lookup;

public class SlaItemTypeDto
{
    public int ID { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public decimal Cost { get; set; }
    public DateTime EffectiveDate { get; set; }
    public bool Disabled { get; set; }
}
