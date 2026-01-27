using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class FunctionRepository : BaseRepository<Function>, IFunctionRepository
{
    public FunctionRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Function")
    {
    }

    protected override Function MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Code = GetNullableString(reader, "Code"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Function entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, Function entity)
    {
        command.Parameters.AddWithValue("@Code", GetValueOrDBNull(entity.Code));
        command.Parameters.AddWithValue("@Description", GetValueOrDBNull(entity.Description));
    }
}
