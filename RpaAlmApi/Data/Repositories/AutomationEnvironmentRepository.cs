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
            AutomationID = GetNullableInt(reader, "AutomationID"),
            AppID = GetNullableString(reader, "AppID"),
            EnvironmentTypeID = GetNullableInt(reader, "EnvironmentTypeID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, AutomationEnvironment entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@AppID", GetValueOrDBNull(entity.AppID));
        command.Parameters.AddWithValue("@EnvironmentTypeID", GetValueOrDBNull(entity.EnvironmentTypeID));
    }

    protected override void AddUpdateParameters(SqlCommand command, AutomationEnvironment entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@AppID", GetValueOrDBNull(entity.AppID));
        command.Parameters.AddWithValue("@EnvironmentTypeID", GetValueOrDBNull(entity.EnvironmentTypeID));
    }
}
