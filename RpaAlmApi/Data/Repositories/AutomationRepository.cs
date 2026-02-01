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
        return new()
        {
            Id = reader.GetInt32(reader.GetOrdinal("ID")),
            Name = GetNullableString(reader, "Name"),
            SegmentId = GetNullableInt(reader, "SegmentID"),
            RegionId = GetNullableInt(reader, "RegionID"),
            FunctionId = GetNullableInt(reader, "FunctionID"),
            StatusId = GetNullableInt(reader, "StatusID"),
            BtoWwid = GetNullableString(reader, "BtoWWID"),
            BoWwid = GetNullableString(reader, "BoWWID"),
            FcWwid = GetNullableString(reader, "FcWWID"),
            Zcode = GetNullableString(reader, "Zcode"),
            CostCenter = GetNullableString(reader, "CostCenter"),
            SseWwid = GetNullableString(reader, "SseWWID"),
            LseWwid = GetNullableString(reader, "LseWWID")
        };
    }

    protected override void AddInsertParameters(SqlCommand command, Automation entity)
    {
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@SegmentID", GetValueOrDbNull(entity.SegmentId));
        command.Parameters.AddWithValue("@RegionID", GetValueOrDbNull(entity.RegionId));
        command.Parameters.AddWithValue("@FunctionID", GetValueOrDbNull(entity.FunctionId));
        command.Parameters.AddWithValue("@StatusID", GetValueOrDbNull(entity.StatusId));
        command.Parameters.AddWithValue("@BtoWWID", GetValueOrDbNull(entity.BtoWwid));
        command.Parameters.AddWithValue("@BoWWID", GetValueOrDbNull(entity.BoWwid));
        command.Parameters.AddWithValue("@FcWWID", GetValueOrDbNull(entity.FcWwid));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDbNull(entity.CostCenter));
        command.Parameters.AddWithValue("@SseWWID", GetValueOrDbNull(entity.SseWwid));
        command.Parameters.AddWithValue("@LseWWID", GetValueOrDbNull(entity.LseWwid));
    }

    protected override void AddUpdateParameters(SqlCommand command, Automation entity)
    {
        command.Parameters.AddWithValue("@ID", entity.Id);
        command.Parameters.AddWithValue("@Name", GetValueOrDbNull(entity.Name));
        command.Parameters.AddWithValue("@SegmentID", GetValueOrDbNull(entity.SegmentId));
        command.Parameters.AddWithValue("@RegionID", GetValueOrDbNull(entity.RegionId));
        command.Parameters.AddWithValue("@FunctionID", GetValueOrDbNull(entity.FunctionId));
        command.Parameters.AddWithValue("@StatusID", GetValueOrDbNull(entity.StatusId));
        command.Parameters.AddWithValue("@BtoWWID", GetValueOrDbNull(entity.BtoWwid));
        command.Parameters.AddWithValue("@BoWWID", GetValueOrDbNull(entity.BoWwid));
        command.Parameters.AddWithValue("@FcWWID", GetValueOrDbNull(entity.FcWwid));
        command.Parameters.AddWithValue("@Zcode", GetValueOrDbNull(entity.Zcode));
        command.Parameters.AddWithValue("@CostCenter", GetValueOrDbNull(entity.CostCenter));
        command.Parameters.AddWithValue("@SseWWID", GetValueOrDbNull(entity.SseWwid));
        command.Parameters.AddWithValue("@LseWWID", GetValueOrDbNull(entity.LseWwid));
    }
}

