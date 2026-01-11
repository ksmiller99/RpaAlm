using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class EnhancementRepository : BaseRepository<Enhancement>, IEnhancementRepository
{
    public EnhancementRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Enhancement")
    {
    }

    protected override Enhancement MapFromReader(SqlDataReader reader)
    {
        return new Enhancement
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Scope = GetNullableString(reader, "Scope")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Enhancement entity)
    {
        command.Parameters.AddWithValue("@Scope", GetValueOrDBNull(entity.Scope));
    }

    protected override void AddUpdateParameters(SqlCommand command, Enhancement entity)
    {
        command.Parameters.AddWithValue("@Scope", GetValueOrDBNull(entity.Scope));
    }
}
