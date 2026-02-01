using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class SlaMasterRepository : BaseRepository<SlaMaster>, ISlaMasterRepository
{
    public SlaMasterRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "SlaMaster")
    {
    }

    protected override SlaMaster MapFromReader(SqlDataReader reader)
    {
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            AutomationId = GetNullableInt(reader, "AutomationID"),
            ComplexityId = GetNullableInt(reader, "ComplexityID"),
            MedalId = GetNullableInt(reader, "MedalID"),
            Zcode = GetNullableString(reader, "Zcode"),
            CostCenter = GetNullableString(reader, "CostCenter"),
            StartDate = GetNullableDateTime(reader, "StartDate"),
            EndDate = GetNullableDateTime(reader, "EndDate")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaMaster entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@ComplexityID", GetValueOrDbNull(entity.ComplexityId));
        command.Parameters.AddWithValue("@MedalID", GetValueOrDbNull(entity.MedalId));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDbNull(entity.CostCenter));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDbNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDbNull(entity.EndDate));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaMaster entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDbNull(entity.AutomationId));
        command.Parameters.AddWithValue("@ComplexityID", GetValueOrDbNull(entity.ComplexityId));
        command.Parameters.AddWithValue("@MedalID", GetValueOrDbNull(entity.MedalId));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDbNull(entity.CostCenter));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDbNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDbNull(entity.EndDate));
    }
}
