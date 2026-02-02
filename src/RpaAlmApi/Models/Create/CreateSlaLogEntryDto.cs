namespace RpaAlmApi.Models.Create;

public class CreateSlaLogEntryDto
{
    public int SlaMasterID { get; set; }
    public int CreatedJjedsID { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Comment { get; set; } = string.Empty;
}
