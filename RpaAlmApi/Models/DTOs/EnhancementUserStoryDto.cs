namespace RpaAlmApi.Models.DTOs;

public class EnhancementUserStoryDto
{
    public int Id { get; set; }
    public int? EnhancementId { get; set; }
    public string? JiraIssue { get; set; }
    public int? StoryPoints { get; set; }
    public string? JiraIssueLink { get; set; }
    public string? JiraIssueSummary { get; set; }
    public int? StoryPointCostId { get; set; }
}
