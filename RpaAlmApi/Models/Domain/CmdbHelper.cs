using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// CmdbHelper domain model (CMDB application cache)
/// Primary key: AppID (string)
/// </summary>
public class CmdbHelper : IEntity<string>
{
    public string Id { get; set; } = string.Empty; // AppID
    public string? Name { get; set; }
    public string? Zcode { get; set; }
}
