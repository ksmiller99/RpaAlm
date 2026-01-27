using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class VirtualIdentityRepository : BaseRepository<VirtualIdentity>, IVirtualIdentityRepository
{
    public VirtualIdentityRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "VirtualIdentity")
    {
    }

    protected override VirtualIdentity MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AccountName = GetNullableString(reader, "AccountName"),
            HostName = GetNullableString(reader, "HostName"),
            WWID = GetNullableString(reader, "WWID"),
            IPv4 = GetNullableString(reader, "IPv4"),
            ADDomainID = GetNullableInt(reader, "ADDomainID"),
            Email = GetNullableString(reader, "Email"),
            Created = GetNullableDateTime(reader, "Created"),
            Retired = GetNullableDateTime(reader, "Retired")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, VirtualIdentity entity)
    {
        command.Parameters.AddWithValue("@AccountName", GetValueOrDBNull(entity.AccountName));
        command.Parameters.AddWithValue("@HostName", GetValueOrDBNull(entity.HostName));
        command.Parameters.AddWithValue("@WWID", GetValueOrDBNull(entity.WWID));
        command.Parameters.AddWithValue("@IPv4", GetValueOrDBNull(entity.IPv4));
        command.Parameters.AddWithValue("@ADDomainID", GetValueOrDBNull(entity.ADDomainID));
        command.Parameters.AddWithValue("@Email", GetValueOrDBNull(entity.Email));
        command.Parameters.AddWithValue("@Created", GetValueOrDBNull(entity.Created));
        command.Parameters.AddWithValue("@Retired", GetValueOrDBNull(entity.Retired));
    }

    protected override void AddUpdateParameters(SqlCommand command, VirtualIdentity entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AccountName", GetValueOrDBNull(entity.AccountName));
        command.Parameters.AddWithValue("@HostName", GetValueOrDBNull(entity.HostName));
        command.Parameters.AddWithValue("@WWID", GetValueOrDBNull(entity.WWID));
        command.Parameters.AddWithValue("@IPv4", GetValueOrDBNull(entity.IPv4));
        command.Parameters.AddWithValue("@ADDomainID", GetValueOrDBNull(entity.ADDomainID));
        command.Parameters.AddWithValue("@Email", GetValueOrDBNull(entity.Email));
        command.Parameters.AddWithValue("@Created", GetValueOrDBNull(entity.Created));
        command.Parameters.AddWithValue("@Retired", GetValueOrDBNull(entity.Retired));
    }
}
