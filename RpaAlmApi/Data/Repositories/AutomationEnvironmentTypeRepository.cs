using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class AutomationEnvironmentTypeRepository : BaseRepository<AutomationEnvironmentType>, IAutomationEnvironmentTypeRepository
{
    public AutomationEnvironmentTypeRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "AutomationEnvironmentType")
    {
    }

    protected override AutomationEnvironmentType MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Code = GetNullableString(reader, "Code"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, AutomationEnvironmentType entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDbNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, AutomationEnvironmentType entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDbNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
    }
}
