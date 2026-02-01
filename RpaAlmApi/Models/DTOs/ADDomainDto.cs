namespace RpaAlmApi.Models.DTOs;

public class ADDomainDto
{
    public int Id { get; set; }
    public required string Domain { get; set; }
    public string? Description { get; set; }
}
