using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// JjedsHelper domain model (Employee directory cache)
/// Primary key: WWID (string)
/// </summary>
public class JjedsHelper : IEntity
{
    public int Id { get; set; }
    public string Wwid { get; set; } = string.Empty; 
    public string? CommonName { get; set; }
    public string? Email { get; set; }
    public DateTime? JjedsCreated { get; set; }
    public DateTime? JjedsLastChanged { get; set; }
}
