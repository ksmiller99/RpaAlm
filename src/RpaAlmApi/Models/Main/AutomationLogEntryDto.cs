namespace RpaAlmApi.Models.Main;

public class AutomationLogEntryDto
{
    public int ID { get; set; }
    public int AutomationID { get; set; }
    public int CreatedJjedsID { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Comment { get; set; } = string.Empty;
}
