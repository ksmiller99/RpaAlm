using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class EnhancementUserStoryCreateRequest
{
    public int? EnhancementId { get; set; }

    [StringLength(50)]
    public string? JiraIssue { get; set; }

    public int? StoryPoints { get; set; }

    [StringLength(500)]
    public string? JiraIssueLink { get; set; }

    [StringLength(500)]
    public string? JiraIssueSummary { get; set; }

    public int? StoryPointCostId { get; set; }
}
