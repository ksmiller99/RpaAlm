namespace RpaAlmApi.Models.Create;

public class CreateVirtualIdentityDto
{
    public int JjedsID { get; set; }
    public int AdDomainID { get; set; }
    public string HostName { get; set; } = string.Empty;
    public string IPv4 { get; set; } = string.Empty;
    public DateTime Created { get; set; }
    public DateTime Retired { get; set; }
}
