using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class JjedsHelperUpdateRequest
{
    [StringLength(255)]
    public string? CommonName { get; set; }

    [StringLength(255)]
    [EmailAddress]
    public string? Email { get; set; }

    public DateTime? JjedsCreated { get; set; }

    public DateTime? JjedsLastChanged { get; set; }
}
