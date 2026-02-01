using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class CmdbHelperRepository : BaseRepository<CmdbHelper>, ICmdbHelperRepository
{
    public CmdbHelperRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "CmdbHelper")
    {
    }

    protected override CmdbHelper MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AppId = reader.GetString(reader.GetOrdinal("AppID")),
            Name = GetNullableString(reader, "Name"),
            Zcode = GetNullableString(reader, "Zcode")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, CmdbHelper entity)
    {
        command.Parameters.AddWithValue("@AppID", GetValueOrDbNull(entity.AppId));
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
    }

    protected override void AddUpdateParameters(SqlCommand command, CmdbHelper entity)
    {
        command.Parameters.AddWithValue("@AppID", GetValueOrDbNull(entity.AppId));
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
    }
}
