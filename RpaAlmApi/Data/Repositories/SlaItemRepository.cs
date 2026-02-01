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
            SlaMasterId = GetNullableInt(reader, "SlaMasterID"),
            SlaItemTypeId = GetNullableInt(reader, "SlaItemTypeID"),
            EnhancementId = GetNullableInt(reader, "EnhancementID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaItem entity)
    {
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDbNull(entity.SlaMasterId));
        command.Parameters.AddWithValue("@SlaItemTypeID", GetValueOrDbNull(entity.SlaItemTypeId));
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDbNull(entity.EnhancementId));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaItem entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDbNull(entity.SlaMasterId));
        command.Parameters.AddWithValue("@SlaItemTypeID", GetValueOrDbNull(entity.SlaItemTypeId));
        command.Parameters.AddWithValue("@EnhancementID", GetValueOrDbNull(entity.EnhancementId));
    }
}
