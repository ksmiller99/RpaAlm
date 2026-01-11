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
        return new EnhancementUserStory
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            EnhancementID = GetNullableInt(reader, "EnhancementID"),
            JiraIssue = GetNullableString(reader, "JiraIssue"),
            StoryPoints = GetNullableInt(reader, "StoryPoints"),
            JiraIssueLink = GetNullableString(reader, "JiraIssueLink"),
            JiraIssueSummary = GetNullableString(reader, "JiraIssueSummary"),
            StoryPointCostID = GetNullableInt(reader, "StoryPointCostID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, EnhancementUserStory entity)
    {
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDBNull(entity.EnhancementID));
        command.Parameters.AddWithValue("@JiraIssue", GetValueOrDBNull(entity.JiraIssue));
        command.Parameters.AddWithValue("@StoryPoints", GetValueOrDBNull(entity.StoryPoints));
        command.Parameters.AddWithValue("@JiraIssueLink", GetValueOrDBNull(entity.JiraIssueLink));
        command.Parameters.AddWithValue("@JiraIssueSummary", GetValueOrDBNull(entity.JiraIssueSummary));
        command.Parameters.AddWithValue("@StoryPointCostID", GetValueOrDBNull(entity.StoryPointCostID));
    }

    protected override void AddUpdateParameters(SqlCommand command, EnhancementUserStory entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDBNull(entity.EnhancementID));
        command.Parameters.AddWithValue("@JiraIssue", GetValueOrDBNull(entity.JiraIssue));
        command.Parameters.AddWithValue("@StoryPoints", GetValueOrDBNull(entity.StoryPoints));
        command.Parameters.AddWithValue("@JiraIssueLink", GetValueOrDBNull(entity.JiraIssueLink));
        command.Parameters.AddWithValue("@JiraIssueSummary", GetValueOrDBNull(entity.JiraIssueSummary));
        command.Parameters.AddWithValue("@StoryPointCostID", GetValueOrDBNull(entity.StoryPointCostID));
    }
}
