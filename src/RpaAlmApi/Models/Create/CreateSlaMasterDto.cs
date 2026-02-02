namespace RpaAlmApi.Models.Create;

public class CreateSlaMasterDto
{
    public int AutomationID { get; set; }
    public int? ComplexityTypeID { get; set; }
    public int? MedalID { get; set; }
    public string? Zcode { get; set; }
    public string? CostCenter { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public int BtoJjedsId { get; set; }
    public int BoJjedsId { get; set; }
    public int FcJjedsId { get; set; }
    public int SignatureStatus { get; set; }
    public DateTime SignatureStatusDate { get; set; }
}
