using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class AutomationCreateRequest
{
    [Required(ErrorMessage = "Name is required")]
    [StringLength(255)]
    public string Name { get; set; } = string.Empty;

    public int? SegmentId { get; set; }

    public int? RegionId { get; set; }

    public int? FunctionId { get; set; }

    public int? StatusId { get; set; }

    [StringLength(9, ErrorMessage = "BtoWWID must be 9 characters")]
    public string? BtoWwid { get; set; }

    [StringLength(9, ErrorMessage = "BoWWID must be 9 characters")]
    public string? BoWwid { get; set; }

    [StringLength(9, ErrorMessage = "FcWWID must be 9 characters")]
    public string? FcWwid { get; set; }

    [StringLength(10)]
    public string? Zcode { get; set; }

    [StringLength(10)]
    public string? CostCenter { get; set; }

    [StringLength(9, ErrorMessage = "SseWWID must be 9 characters")]
    public string? SseWwid { get; set; }

    [StringLength(9, ErrorMessage = "LseWWID must be 9 characters")]
    public string? LseWwid { get; set; }
}
