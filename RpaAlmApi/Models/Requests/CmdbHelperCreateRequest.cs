using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class CmdbHelperCreateRequest
{
    [Required(ErrorMessage = "AppID is required")]
    [StringLength(50)]
    public string AppId { get; set; } = string.Empty;

    [StringLength(255)]
    public string? Name { get; set; }

    [StringLength(50)]
    public string? Zcode { get; set; }
}
