namespace RpaAlmApi.Models.Create;

public class CreateSlaItemDto
{
    public int SlaMasterID { get; set; }
    public int SlaItemTypeID { get; set; }
    public int EnhancementID { get; set; }
    public int Quantity { get; set; }
    public decimal Cost { get; set; }
    public decimal Total { get; set; }
}
