using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class AutomationEnvironmentTypeUpdateRequest
{
    [StringLength(50)]
    public string? Code { get; set; }

    [StringLength(255)]
    public string? Description { get; set; }
}
