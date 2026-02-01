namespace RpaAlmApi.Models.DTOs;

public class JjedsHelperDto
{
    public int Id { get; set; }
    public string Wwid { get; set; } = string.Empty;
    public string? CommonName { get; set; }
    public string? Email { get; set; }
    public DateTime? JjedsCreated { get; set; }
    public DateTime? JjedsLastChanged { get; set; }
}
