namespace RpaAlmApi.Models.Main;

public class EnhancementUserStoryDto
{
    public int ID { get; set; }
    public int EnhancementID { get; set; }
    public string JiraIssue { get; set; } = string.Empty;
    public DateTime JiraIssueDate { get; set; }
    public int StoryPoints { get; set; }
    public string JiraIssueLink { get; set; } = string.Empty;
    public string JiraIssueSummary { get; set; } = string.Empty;
    public decimal JiraIssueCost { get; set; }
}
