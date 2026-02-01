using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class SlaLogEntryRepository : BaseRepository<SlaLogEntry>, ISlaLogEntryRepository
{
    public SlaLogEntryRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "SlaLogEntry")
    {
    }

    protected override SlaLogEntry MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            SlaMasterId = GetNullableInt(reader, "SlaMasterID"),
            CreatedWwid = GetNullableString(reader, "CreatedWWID"),
            CreatedDate = GetNullableDateTime(reader, "CreatedDate"),
            Comment = GetNullableString(reader, "Comment")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaLogEntry entity)
    {
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDbNull(entity.SlaMasterId));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDbNull(entity.CreatedWwid));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDbNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDbNull(entity.Comment));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaLogEntry entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@SlaMasterID", GetValueOrDbNull(entity.SlaMasterId));
        command.Parameters.AddWithValue("@CreatedWWID", GetValueOrDbNull(entity.CreatedWwid));
        command.Parameters.AddWithValue("@CreatedDate", GetValueOrDbNull(entity.CreatedDate));
        command.Parameters.AddWithValue("@Comment", GetValueOrDbNull(entity.Comment));
    }
}
