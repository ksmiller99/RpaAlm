using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// EnhancementUserStory domain model (Jira user stories)
/// </summary>
public class EnhancementUserStory : IEntity
{
    public int Id { get; set; }
    public int? EnhancementID { get; set; }
    public string? JiraIssue { get; set; }
    public int? StoryPoints { get; set; }
    public string? JiraIssueLink { get; set; }
    public string? JiraIssueSummary { get; set; }
    public int? StoryPointCostID { get; set; }
}
