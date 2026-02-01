namespace RpaAlmApi.Models.Main;

public class SlaItemDto
{
    public int ID { get; set; }
    public int SlaMasterID { get; set; }
    public int SlaItemTypeID { get; set; }
    public int EnhancementID { get; set; }
    public int Quantity { get; set; }
    public decimal Cost { get; set; }
    public decimal Total { get; set; }
}
