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
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AutomationId = GetNullableInt(reader, "AutomationID"),
            CreatedWwid = GetNullableString(reader, "CreatedWWID"),
            CreatedDate = GetNullableDateTime(reader, "CreatedDate"),
            Comment = GetNullableString(reader, "Comment")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, AutomationLogEntry entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDbNull(entity.CreatedWwid));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDbNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDbNull(entity.Comment));
    }

    protected override void AddUpdateParameters(SqlCommand command, AutomationLogEntry entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDbNull(entity.CreatedWwid));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDbNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDbNull(entity.Comment));
    }
}
