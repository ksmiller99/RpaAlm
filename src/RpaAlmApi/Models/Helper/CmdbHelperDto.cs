namespace RpaAlmApi.Models.Helper;

public class CmdbHelperDto
{
    public int ID { get; set; }
    public string AppID { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? Zcode { get; set; }
    public string OperationalStatus { get; set; } = string.Empty;
    public DateTime CmdbUpdated { get; set; }
}
