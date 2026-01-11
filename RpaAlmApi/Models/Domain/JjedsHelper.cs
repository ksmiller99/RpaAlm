using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// JjedsHelper domain model (Employee directory cache)
/// Primary key: WWID (string)
/// </summary>
public class JjedsHelper : IEntity<string>
{
    public string Id { get; set; } = string.Empty; // WWID
    public string? CommonName { get; set; }
    public string? Email { get; set; }
    public DateTime? JjedsCreated { get; set; }
    public DateTime? JjedsLastChanged { get; set; }
}
