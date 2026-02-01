using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class StoryPointCostRepository : BaseRepository<StoryPointCost>, IStoryPointCostRepository
{
    public StoryPointCostRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "StoryPointCost")
    {
    }

    protected override StoryPointCost MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Points = GetNullableInt(reader, "Points"),
            MaxHours = GetNullableInt(reader, "MaxHours"),
            TotalCost = GetNullableInt(reader, "TotalCost"),
            JnJCostShare = GetNullableInt(reader, "JnJCostShare"),
            EffectiveDate = GetNullableDateTime(reader, "EffectiveDate")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, StoryPointCost entity)
    {
        command.Parameters.AddWithValue("@Points", GetValueOrDbNull(entity.Points));
        command.Parameters.AddWithValue("@MaxHours", GetValueOrDbNull(entity.MaxHours));
        command.Parameters.AddWithValue("@TotalCost", GetValueOrDbNull(entity.TotalCost));
        command.Parameters.AddWithValue("@JnJCostShare", GetValueOrDbNull(entity.JnJCostShare));
        command.Parameters.AddWithValue("@EffectiveDate", GetValueOrDbNull(entity.EffectiveDate));
    }

    protected override void AddUpdateParameters(SqlCommand command, StoryPointCost entity)
    {
        command.Parameters.AddWithValue("@Points", GetValueOrDbNull(entity.Points));
        command.Parameters.AddWithValue("@MaxHours", GetValueOrDbNull(entity.MaxHours));
        command.Parameters.AddWithValue("@TotalCost", GetValueOrDbNull(entity.TotalCost));
        command.Parameters.AddWithValue("@JnJCostShare", GetValueOrDbNull(entity.JnJCostShare));
        command.Parameters.AddWithValue("@EffectiveDate", GetValueOrDbNull(entity.EffectiveDate));
    }
}
