using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class AutomationLogEntryRepository : BaseRepository<AutomationLogEntry>, IAutomationLogEntryRepository
{
    public AutomationLogEntryRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "AutomationLogEntry")
    {
    }

    protected override AutomationLogEntry MapFromReader(SqlDataReader reader)
    {
        return new AutomationLogEntry
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AutomationID = GetNullableInt(reader, "AutomationID"),
            CreatedWWID = GetNullableString(reader, "CreatedWWID"),
            CreatedDate = GetNullableDateTime(reader, "CreatedDate"),
            Comment = GetNullableString(reader, "Comment")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, AutomationLogEntry entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDBNull(entity.CreatedWWID));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDBNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDBNull(entity.Comment));
    }

    protected override void AddUpdateParameters(SqlCommand command, AutomationLogEntry entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDBNull(entity.CreatedWWID));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDBNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDBNull(entity.Comment));
    }
}
