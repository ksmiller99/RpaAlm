using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class SlaLogEntryCreateRequest
{
    public int? SlaMasterId { get; set; }

    [StringLength(9)]
    public string? CreatedWwid { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? Comment { get; set; }
}
