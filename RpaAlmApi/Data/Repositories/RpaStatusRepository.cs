using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

/// <summary>
/// Repository for RpaStatus entity
/// </summary>
public class RpaStatusRepository : BaseRepository<RpaStatus>, IRpaStatusRepository
{
    public RpaStatusRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "RpaStatus")
    {
    }

    protected override RpaStatus MapFromReader(SqlDataReader reader)
    {
        return new RpaStatus
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Code = GetNullableString(reader, "Code"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, RpaStatus entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, RpaStatus entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }
}
