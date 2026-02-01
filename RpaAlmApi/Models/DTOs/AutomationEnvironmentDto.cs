namespace RpaAlmApi.Models.DTOs;

public class AutomationEnvironmentDto
{
    public int Id { get; set; }
    public int? AutomationId { get; set; }
    public string? AppId { get; set; }
    public int? EnvironmentTypeId { get; set; }
}
