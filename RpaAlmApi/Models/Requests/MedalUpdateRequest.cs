using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class MedalUpdateRequest
{
    [StringLength(255)]
    public string? Name { get; set; }

    public string? Description { get; set; }
}
