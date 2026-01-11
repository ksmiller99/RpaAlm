using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// VirtualIdentity domain model (Service accounts and bot identities)
/// </summary>
public class VirtualIdentity : IEntity
{
    public int Id { get; set; }
    public string? AccountName { get; set; }
    public string? HostName { get; set; }
    public string? WWID { get; set; }
    public string? IPv4 { get; set; }
    public int? ADDomainID { get; set; }
    public string? Email { get; set; }
    public DateTime? Created { get; set; }
    public DateTime? Retired { get; set; }
}
