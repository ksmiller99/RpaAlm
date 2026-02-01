using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class EnhancementUserStoryRepository : BaseRepository<EnhancementUserStory>, IEnhancementUserStoryRepository
{
    public EnhancementUserStoryRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "EnhancementUserStory")
    {
    }

    protected override EnhancementUserStory MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            EnhancementId = GetNullableInt(reader, "EnhancementID"),
            JiraIssue = GetNullableString(reader, "JiraIssue"),
            StoryPoints = GetNullableInt(reader, "StoryPoints"),
            JiraIssueLink = GetNullableString(reader, "JiraIssueLink"),
            JiraIssueSummary = GetNullableString(reader, "JiraIssueSummary"),
            StoryPointCostId = GetNullableInt(reader, "StoryPointCostID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, EnhancementUserStory entity)
    {
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDbNull(entity.EnhancementId));
        command.Parameters.AddWithValue("@JiraIssue", GetValueOrDbNull(entity.JiraIssue));
        command.Parameters.AddWithValue("@StoryPoints", GetValueOrDbNull(entity.StoryPoints));
        command.Parameters.AddWithValue("@JiraIssueLink", GetValueOrDbNull(entity.JiraIssueLink));
        command.Parameters.AddWithValue("@JiraIssueSummary", GetValueOrDbNull(entity.JiraIssueSummary));
        command.Parameters.AddWithValue("@StoryPointCostID", GetValueOrDbNull(entity.StoryPointCostId));
    }

    protected override void AddUpdateParameters(SqlCommand command, EnhancementUserStory entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDbNull(entity.EnhancementId));
        command.Parameters.AddWithValue("@JiraIssue", GetValueOrDbNull(entity.JiraIssue));
        command.Parameters.AddWithValue("@StoryPoints", GetValueOrDbNull(entity.StoryPoints));
        command.Parameters.AddWithValue("@JiraIssueLink", GetValueOrDbNull(entity.JiraIssueLink));
        command.Parameters.AddWithValue("@JiraIssueSummary", GetValueOrDbNull(entity.JiraIssueSummary));
        command.Parameters.AddWithValue("@StoryPointCostID", GetValueOrDbNull(entity.StoryPointCostId));
    }
}
