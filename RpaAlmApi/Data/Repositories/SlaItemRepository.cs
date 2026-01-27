using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class SlaItemRepository : BaseRepository<SlaItem>, ISlaItemRepository
{
    public SlaItemRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "SlaItem")
    {
    }

    protected override SlaItem MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            SlaMasterID = GetNullableInt(reader, "SlaMasterID"),
            SlaItemTypeID = GetNullableInt(reader, "SlaItemTypeID"),
            EnhancementID = GetNullableInt(reader, "EnhancementID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaItem entity)
    {
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDBNull(entity.SlaMasterID));
        command.Parameters.AddWithValue("@SlaItemTypeID", GetValueOrDBNull(entity.SlaItemTypeID));
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDBNull(entity.EnhancementID));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaItem entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDBNull(entity.SlaMasterID));
        command.Parameters.AddWithValue("@SlaItemTypeID", GetValueOrDBNull(entity.SlaItemTypeID));
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDBNull(entity.EnhancementID));
    }
}
