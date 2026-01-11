using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// StoryPointCost domain model
/// </summary>
public class StoryPointCost : IEntity
{
    public int Id { get; set; }
    public int? Points { get; set; }
    public int? MaxHours { get; set; }
    public int? TotalCost { get; set; }
    public int? JnJCostShare { get; set; }
    public DateTime? EffectiveDate { get; set; }
}
