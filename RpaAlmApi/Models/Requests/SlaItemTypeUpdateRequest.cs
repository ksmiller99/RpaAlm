using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class SlaItemTypeUpdateRequest
{
    [StringLength(255)]
    public string? Name { get; set; }

    public string? Description { get; set; }

    public int? Cost { get; set; }

    public int? Disabled { get; set; }
}
