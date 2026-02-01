using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class AutomationEnvironmentRepository : BaseRepository<AutomationEnvironment>, IAutomationEnvironmentRepository
{
    public AutomationEnvironmentRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "AutomationEnvironment")
    {
    }

    protected override AutomationEnvironment MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AutomationId = GetNullableInt(reader, "AutomationID"),
            AppId = GetNullableString(reader, "AppID"),
            EnvironmentTypeId = GetNullableInt(reader, "EnvironmentTypeID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, AutomationEnvironment entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@AppID", GetValueOrDbNull(entity.AppId));
        command.Parameters.AddWithValue("@EnvironmentTypeID", GetValueOrDbNull(entity.EnvironmentTypeId));
    }

    protected override void AddUpdateParameters(SqlCommand command, AutomationEnvironment entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@AppID", GetValueOrDbNull(entity.AppId));
        command.Parameters.AddWithValue("@EnvironmentTypeID", GetValueOrDbNull(entity.EnvironmentTypeId));
    }
}
