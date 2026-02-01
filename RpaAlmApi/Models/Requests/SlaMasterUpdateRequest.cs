using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class SlaMasterUpdateRequest
{
    public int? AutomationId { get; set; }

    public int? ComplexityId { get; set; }

    public int? MedalId { get; set; }

    [StringLength(10)]
    public string? Zcode { get; set; }

    [StringLength(10)]
    public string? CostCenter { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }
}
