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
            AutomationID = GetNullableInt(reader, "AutomationID"),
            ComplexityID = GetNullableInt(reader, "ComplexityID"),
            MedalID = GetNullableInt(reader, "MedalID"),
            Zcode = GetNullableString(reader, "Zcode"),
            CostCenter = GetNullableString(reader, "CostCenter"),
            StartDate = GetNullableDateTime(reader, "StartDate"),
            EndDate = GetNullableDateTime(reader, "EndDate")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, SlaMaster entity)
    {
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@ComplexityID", GetValueOrDBNull(entity.ComplexityID));
        command.Parameters.AddWithValue("@MedalID", GetValueOrDBNull(entity.MedalID));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDBNull(entity.CostCenter));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDBNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDBNull(entity.EndDate));
    }

    protected override void AddUpdateParameters(SqlCommand command, SlaMaster entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@AutomationID", GetValueOrDBNull(entity.AutomationID));
        command.Parameters.AddWithValue("@ComplexityID", GetValueOrDBNull(entity.ComplexityID));
        command.Parameters.AddWithValue("@MedalID", GetValueOrDBNull(entity.MedalID));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDBNull(entity.CostCenter));
        command.Parameters.AddWithValue("@StartDate", GetValueOrDBNull(entity.StartDate));
        command.Parameters.AddWithValue("@EndDate", GetValueOrDBNull(entity.EndDate));
    }
}
