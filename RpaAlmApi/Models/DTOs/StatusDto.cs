namespace RpaAlmApi.Models.DTOs;

/// <summary>
/// Status Data Transfer Object for API responses
/// </summary>
public class StatusDto
{
    public int Id { get; set; }
    public string? Code { get; set; }
    public string? Description { get; set; }
}
