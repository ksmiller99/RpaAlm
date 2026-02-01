using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class AutomationEnvironmentUpdateRequest
{
    public int? AutomationId { get; set; }

    [StringLength(10)]
    public string? AppId { get; set; }

    public int? EnvironmentTypeId { get; set; }
}
