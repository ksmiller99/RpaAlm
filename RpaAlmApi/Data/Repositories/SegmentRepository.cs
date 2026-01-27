using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class SegmentRepository : BaseRepository<Segment>, ISegmentRepository
{
    public SegmentRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Segment")
    {
    }

    protected override Segment MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Code = GetNullableString(reader, "Code"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Segment entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, Segment entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }
}
