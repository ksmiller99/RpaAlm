using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

/// <summary>
/// Request model for updating an existing Status
/// </summary>
public class StatusUpdateRequest
{
    [Required(ErrorMessage = "Code is required")]
    [StringLength(50, ErrorMessage = "Code cannot exceed 50 characters")]
    public string Code { get; set; } = string.Empty;

    [StringLength(255, ErrorMessage = "Description cannot exceed 255 characters")]
    public string? Description { get; set; }
}
