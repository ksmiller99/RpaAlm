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
        return new()
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
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
        command.Parameters.AddWithValue("@Cost", GetValueOrDbNull(entity.Cost));
        command.Parameters.AddWithValue("@Disabled", GetValueOrDbNull(entity.Disabled));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaItemType entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
        command.Parameters.AddWithValue("@Cost", GetValueOrDbNull(entity.Cost));
        command.Parameters.AddWithValue("@Disabled", GetValueOrDbNull(entity.Disabled));
    }
}
