namespace RpaAlmApi.Models.Requests;

public class SlaItemCreateRequest
{
    public int? SlaMasterId { get; set; }
    public int? SlaItemTypeId { get; set; }
    public int? EnhancementId { get; set; }
}
