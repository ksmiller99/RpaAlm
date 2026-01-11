using System.ComponentModel.DataAnnotations;

namespace RpaAlmApi.Models.Requests;

public class SlaLogEntryCreateRequest
{
    public int? SlaMasterID { get; set; }

    [StringLength(9)]
    public string? CreatedWWID { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? Comment { get; set; }
}
