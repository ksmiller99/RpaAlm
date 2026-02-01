namespace RpaAlmApi.Models.DTOs;

public class VirtualIdentityDto
{
    public int Id { get; set; }
    public string? Wwid { get; set; }
    public string? HostName { get; set; }
    public string? IPv4 { get; set; }
    public int? ADDomainId { get; set; }
    public DateTime? Created { get; set; }
    public DateTime? Retired { get; set; }
}
