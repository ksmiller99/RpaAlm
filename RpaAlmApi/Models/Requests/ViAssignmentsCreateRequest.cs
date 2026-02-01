namespace RpaAlmApi.Models.Requests;

public class ViAssignmentsCreateRequest
{
    public int? VirtualIdentityId { get; set; }
    public int? AutomationEnvironmentId { get; set; }
    public int? Percentage { get; set; }
    public DateTime? StartDate { get; set; }
    public DateTime? EndDate { get; set; }
}
