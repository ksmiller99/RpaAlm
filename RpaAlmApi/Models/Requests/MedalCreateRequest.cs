using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class MedalCreateRequest
{
    [Required(ErrorMessage = "Name is required")]
    [StringLength(255)]
    public string Name { get; set; } = string.Empty;

    public string? Description { get; set; }
}
