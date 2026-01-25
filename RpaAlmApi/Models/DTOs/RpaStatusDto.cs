namespace RpaAlmApi.Models.DTOs;

/// <summary>
/// RpaStatus Data Transfer Object for API responses
/// </summary>
public class RpaStatusDto
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
