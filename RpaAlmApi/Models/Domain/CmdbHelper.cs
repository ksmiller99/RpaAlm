using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Models.Domain;

/// <summary>
/// CmdbHelper domain model (CMDB application cache)
/// Primary key: ID (int)
/// </summary>
public class CmdbHelper : IEntity
{
    public int Id { get; set; }
    public string AppId { get; set; } = string.Empty;
    public string? Name { get; set; }
    public string? Zcode { get; set; }
}
