using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class ViAssignmentsRepository : BaseRepository<ViAssignments>, IViAssignmentsRepository
{
    public ViAssignmentsRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "ViAssignments")
    {
    }

    protected override ViAssignments MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            VirtualIdentityId = GetNullableInt(reader, "VirtualIdentityID"),
            AutomationEnvironmentId = GetNullableInt(reader, "AutomationEnvironmentID"),
            Percentage = GetNullableInt(reader, "Percentage"),
            StartDate = GetNullableDateTime(reader, "StartDate"),
            EndDate = GetNullableDateTime(reader, "EndDate")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, ViAssignments entity)
    {
        command.Parameters.AddWithValue("@VirtualIdentityID", GetValueOrDbNull(entity.VirtualIdentityId));
        command.Parameters.AddWithValue("@AutomationEnvironmentID", GetValueOrDbNull(entity.AutomationEnvironmentId));
        command.Parameters.AddWithValue("@Percentage", GetValueOrDbNull(entity.Percentage));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDbNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDbNull(entity.EndDate));
    }

    protected override void AddUpdateParameters(SqlCommand command, ViAssignments entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@VirtualIdentityID", GetValueOrDbNull(entity.VirtualIdentityId));
        command.Parameters.AddWithValue("@AutomationEnvironmentID", GetValueOrDbNull(entity.AutomationEnvironmentId));
        command.Parameters.AddWithValue("@Percentage", GetValueOrDbNull(entity.Percentage));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDbNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDbNull(entity.EndDate));
    }
}
