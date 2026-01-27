using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class CmdbHelperRepository : BaseRepositoryStringKey<CmdbHelper>, ICmdbHelperRepository
{
    public CmdbHelperRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "CmdbHelper", "AppID")
    {
    }

    protected override CmdbHelper MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetString(reader.GetOrdinal("AppID")),
            Name = GetNullableString(reader, "Name"),
            Zcode = GetNullableString(reader, "Zcode")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, CmdbHelper entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
    }

    protected override void AddUpdateParameters(SqlCommand command, CmdbHelper entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
    }
}
