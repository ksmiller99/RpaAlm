using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class VirtualIdentityCreateRequest
{
    [StringLength(255)]
    public string? AccountName { get; set; }

    [StringLength(255)]
    public string? HostName { get; set; }

    [StringLength(9)]
    public string? Wwid { get; set; }

    [StringLength(15)]
    public string? IPv4 { get; set; }

    public int? ADDomainId { get; set; }

    [StringLength(255)]
    [EmailAddress]
    public string? Email { get; set; }

    public DateTime? Created { get; set; }

    public DateTime? Retired { get; set; }
}
