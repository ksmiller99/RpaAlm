using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class MedalRepository : BaseRepository<Medal>, IMedalRepository
{
    public MedalRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Medal")
    {
    }

    protected override Medal MapFromReader(SqlDataReader reader)
    {
        return new Medal
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Name = GetNullableString(reader, "Name"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Medal entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, Medal entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }
}
