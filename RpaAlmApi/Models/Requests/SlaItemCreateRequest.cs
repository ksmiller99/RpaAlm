namespace RpaAlmApi.Models.Requests;

public class SlaItemCreateRequest
{
    public int? SlaMasterID { get; set; }
    public int? SlaItemTypeID { get; set; }
    public int? EnhancementID { get; set; }
}
