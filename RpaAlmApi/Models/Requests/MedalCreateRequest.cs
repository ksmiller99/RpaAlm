using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class MedalCreateRequest
{
    [StringLength(255)]
    public string? Name { get; set; }

    public string? Description { get; set; }
}
