using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class ADDomainRepository : BaseRepository<ADDomain>, IADDomainRepository
{
    public ADDomainRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "ADDomain")
    {
    }

    protected override ADDomain MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Domain = GetNullableString(reader, "Domain"),
            Description = GetNullableString(reader, "Description")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, ADDomain entity)
    {
        command.Parameters.AddWithValue("@Domain", GetValueOrDbNull(entity.Domain));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
    }

    protected override void AddUpdateParameters(SqlCommand command, ADDomain entity)
    {
        command.Parameters.AddWithValue("@Domain", GetValueOrDbNull(entity.Domain));
        command.Parameters.AddWithValue("@Description", GetValueOrDbNull(entity.Description));
    }
}
