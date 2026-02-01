namespace RpaAlmApi.Models.Main;

public class SlaLogEntryDto
{
    public int ID { get; set; }
    public int SlaMasterID { get; set; }
    public int CreatedJjedsID { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Comment { get; set; } = string.Empty;
}
