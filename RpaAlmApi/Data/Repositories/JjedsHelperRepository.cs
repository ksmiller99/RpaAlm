using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class JjedsHelperRepository : BaseRepositoryStringKey<JjedsHelper>, IJjedsHelperRepository
{
    public JjedsHelperRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "JjedsHelper", "WWID")
    {
    }

    protected override JjedsHelper MapFromReader(SqlDataReader reader)
    {
        return new JjedsHelper
        {
            Id = reader.GetString(reader.GetOrdinal("WWID")),
            CommonName = GetNullableString(reader, "CommonName"),
            Email = GetNullableString(reader, "Email"),
            JjedsCreated = GetNullableDateTime(reader, "JjedsCreated"),
            JjedsLastChanged = GetNullableDateTime(reader, "JjedsLastChanged")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, JjedsHelper entity)
    {
        command.Parameters.AddWithValue("@CommonName", GetValueOrDBNull(entity.CommonName));
        command.Parameters.AddWithValue("@Email", GetValueOrDBNull(entity.Email));
        command.Parameters.AddWithValue("@JjedsCreated", GetValueOrDBNull(entity.JjedsCreated));
        command.Parameters.AddWithValue("@JjedsLastChanged", GetValueOrDBNull(entity.JjedsLastChanged));
    }

    protected override void AddUpdateParameters(SqlCommand command, JjedsHelper entity)
    {
        command.Parameters.AddWithValue("@CommonName", GetValueOrDBNull(entity.CommonName));
        command.Parameters.AddWithValue("@Email", GetValueOrDBNull(entity.Email));
        command.Parameters.AddWithValue("@JjedsCreated", GetValueOrDBNull(entity.JjedsCreated));
        command.Parameters.AddWithValue("@JjedsLastChanged", GetValueOrDBNull(entity.JjedsLastChanged));
    }
}
