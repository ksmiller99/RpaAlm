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
            Wwid = GetNullableString(reader, "WWID"),
            IPv4 = GetNullableString(reader, "IPv4"),
            ADDomainId = GetNullableInt(reader, "ADDomainID"),
            Email = GetNullableString(reader, "Email"),
            Created = GetNullableDateTime(reader, "Created"),
            Retired = GetNullableDateTime(reader, "Retired")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, VirtualIdentity entity)
    {
        command.Parameters.AddWithValue("@AccountName", GetValueOrDbNull(entity.AccountName));
        command.Parameters.AddWithValue("@HostName", GetValueOrDbNull(entity.HostName));
        command.Parameters.AddWithValue("@WWID", GetValueOrDbNull(entity.Wwid));
        command.Parameters.AddWithValue("@IPv4", GetValueOrDbNull(entity.IPv4));
        command.Parameters.AddWithValue("@ADDomainID", GetValueOrDbNull(entity.ADDomainId));
        command.Parameters.AddWithValue("@Email", GetValueOrDbNull(entity.Email));
        command.Parameters.AddWithValue("@Created", GetValueOrDbNull(entity.Created));
        command.Parameters.AddWithValue("@Retired", GetValueOrDbNull(entity.Retired));
    }

    protected override void AddUpdateParameters(SqlCommand command, VirtualIdentity entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AccountName", GetValueOrDbNull(entity.AccountName));
        command.Parameters.AddWithValue("@HostName", GetValueOrDbNull(entity.HostName));
        command.Parameters.AddWithValue("@WWID", GetValueOrDbNull(entity.Wwid));
        command.Parameters.AddWithValue("@IPv4", GetValueOrDbNull(entity.IPv4));
        command.Parameters.AddWithValue("@ADDomainID", GetValueOrDbNull(entity.ADDomainId));
        command.Parameters.AddWithValue("@Email", GetValueOrDbNull(entity.Email));
        command.Parameters.AddWithValue("@Created", GetValueOrDbNull(entity.Created));
        command.Parameters.AddWithValue("@Retired", GetValueOrDbNull(entity.Retired));
    }
}
