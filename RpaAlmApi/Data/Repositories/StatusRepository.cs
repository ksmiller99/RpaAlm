using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

/// <summary>
/// Repository for Status entity
/// </summary>
public class StatusRepository : BaseRepository<Status>, IStatusRepository
{
    public StatusRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Status")
    {
    }

    protected override Status MapFromReader(SqlDataReader reader)
    {
        return new Status
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Code = GetNullableString(reader, "Code"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Status entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, Status entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }
}
