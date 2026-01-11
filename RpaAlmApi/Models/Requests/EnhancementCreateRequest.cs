using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class EnhancementCreateRequest
{
    [StringLength(255)]
    public string? Scope { get; set; }
}
