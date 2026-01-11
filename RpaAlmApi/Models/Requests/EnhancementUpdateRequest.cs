using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class EnhancementUpdateRequest
{
    [StringLength(255)]
    public string? Scope { get; set; }
}
