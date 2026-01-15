using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using RpaAlmApi.Data.Interfaces;
using RpaAlmApi.Models.Domain;

namespace RpaAlmApi.Data.Repositories;

public class AutomationRepository : BaseRepository<Automation>, IAutomationRepository
{
    public AutomationRepository(IDbConnectionFactory connectionFactory)
        : base(connectionFactory, "Automation")
    {
    }

    protected override Automation MapFromReader(SqlDataReader reader)
    {
        return new Automation
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Name = GetNullableString(reader, "Name"),
            SegmentID = GetNullableInt(reader, "SegmentID"),
            RegionID = GetNullableInt(reader, "RegionID"),
            FunctionID = GetNullableInt(reader, "FunctionID"),
            StatusID = GetNullableInt(reader, "StatusID"),
            BtoWWID = GetNullableString(reader, "BtoWWID"),
            BoWWID = GetNullableString(reader, "BoWWID"),
            FcWWID = GetNullableString(reader, "FcWWID"),
            Zcode = GetNullableString(reader, "Zcode"),
            CostCenter = GetNullableString(reader, "CostCenter"),
            SseWWID = GetNullableString(reader, "SseWWID"),
            LseWWID = GetNullableString(reader, "LseWWID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Automation entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@SegmentID", GetValueOrDBNull(entity.SegmentID));
        command.Parameters.AddWithValue("@RegionID", GetValueOrDBNull(entity.RegionID));
        command.Parameters.AddWithValue("@FunctionID", GetValueOrDBNull(entity.FunctionID));
        command.Parameters.AddWithValue("@StatusID", GetValueOrDBNull(entity.StatusID));
        command.Parameters.AddWithValue("@BtoWWID", GetValueOrDBNull(entity.BtoWWID));
        command.Parameters.AddWithValue("@BoWWID", GetValueOrDBNull(entity.BoWWID));
        command.Parameters.AddWithValue("@FcWWID", GetValueOrDBNull(entity.FcWWID));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDBNull(entity.CostCenter));
        command.Parameters.AddWithValue("@SseWWID", GetValueOrDBNull(entity.SseWWID));
        command.Parameters.AddWithValue("@LseWWID", GetValueOrDBNull(entity.LseWWID));
    }

    protected override void AddUpdateParameters(SqlCommand command, Automation entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@Name", GetValueOrDBNull(entity.Name));
        command.Parameters.AddWithValue("@SegmentID", GetValueOrDBNull(entity.SegmentID));
        command.Parameters.AddWithValue("@RegionID", GetValueOrDBNull(entity.RegionID));
        command.Parameters.AddWithValue("@FunctionID", GetValueOrDBNull(entity.FunctionID));
        command.Parameters.AddWithValue("@StatusID", GetValueOrDBNull(entity.StatusID));
        command.Parameters.AddWithValue("@BtoWWID", GetValueOrDBNull(entity.BtoWWID));
        command.Parameters.AddWithValue("@BoWWID", GetValueOrDBNull(entity.BoWWID));
        command.Parameters.AddWithValue("@FcWWID", GetValueOrDBNull(entity.FcWWID));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDBNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDBNull(entity.CostCenter));
        command.Parameters.AddWithValue("@SseWWID", GetValueOrDBNull(entity.SseWWID));
        command.Parameters.AddWithValue("@LseWWID", GetValueOrDBNull(entity.LseWWID));
    }
}

