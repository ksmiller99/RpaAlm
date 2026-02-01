namespace RpaAlmApi.Models.Helper;

public class JjedsHelperDto
{
    public int ID { get; set; }
    public string WWID { get; set; } = string.Empty;
    public string CommonName { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public DateTime JjedsCreated { get; set; }
    public DateTime JjedsLastChanged { get; set; }
}
