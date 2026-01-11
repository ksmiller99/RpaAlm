using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class SlaItemTypeRepository : BaseRepository<SlaItemType>, ISlaItemTypeRepository
{
    public SlaItemTypeRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "SlaItemType")
    {
    }

    protected override SlaItemType MapFromReader(SqlDataReader reader)
    {
        return new SlaItemType
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Name = GetNullableString(reader, "Name"),
            Description = GetNullableString(reader, "Description"),
            Cost = GetNullableInt(reader, "Cost"),
            Disabled = GetNullableInt(reader, "Disabled")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaItemType entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
        command.Parameters.AddWithValue("@Cost", GetValueOrDBNull(entity.Cost));
        command.Parameters.AddWithValue("@Disabled", GetValueOrDBNull(entity.Disabled));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaItemType entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
        command.Parameters.AddWithValue("@Cost", GetValueOrDBNull(entity.Cost));
        command.Parameters.AddWithValue("@Disabled", GetValueOrDBNull(entity.Disabled));
    }
}
