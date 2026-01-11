using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class ADDomainUpdateRequest
{
    [StringLength(255)]
    public string? Domain { get; set; }

    [StringLength(255)]
    public string? Description { get; set; }
}
