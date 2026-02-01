using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class JjedsHelperRepository : BaseRepository<JjedsHelper>, IJjedsHelperRepository
{
    public JjedsHelperRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "JjedsHelper")
    {
    }

    protected override JjedsHelper MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Wwid = reader.GetString(reader.GetOrdinal("WWID")),
            CommonName = GetNullableString(reader, "CommonName"),
            Email = GetNullableString(reader, "Email"),
            JjedsCreated = GetNullableDateTime(reader, "JjedsCreated"),
            JjedsLastChanged = GetNullableDateTime(reader, "JjedsLastChanged")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, JjedsHelper entity)
    {
        command.Parameters.AddWithValue("@WWID", GetValueOrDbNull(entity.Wwid));
        command.Parameters.AddWithValue("@CommonName", GetValueOrDbNull(entity.CommonName));
        command.Parameters.AddWithValue("@Email", GetValueOrDbNull(entity.Email));
        command.Parameters.AddWithValue("@JjedsCreated", GetValueOrDbNull(entity.JjedsCreated));
        command.Parameters.AddWithValue("@JjedsLastChanged", GetValueOrDbNull(entity.JjedsLastChanged));
    }

    protected override void AddUpdateParameters(SqlCommand command, JjedsHelper entity)
    {
        command.Parameters.AddWithValue("@WWID", GetValueOrDbNull(entity.Wwid));
        command.Parameters.AddWithValue("@CommonName", GetValueOrDbNull(entity.CommonName));
        command.Parameters.AddWithValue("@Email", GetValueOrDbNull(entity.Email));
        command.Parameters.AddWithValue("@JjedsCreated", GetValueOrDbNull(entity.JjedsCreated));
        command.Parameters.AddWithValue("@JjedsLastChanged", GetValueOrDbNull(entity.JjedsLastChanged));
    }
}
