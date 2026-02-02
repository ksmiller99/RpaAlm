namespace RpaAlmApi.Models.Create;

public class CreateAutomationEnvironmentDto
{
    public int AutomationID { get; set; }
    public int CmdbID { get; set; }
    public int? EnvironmentTypeID { get; set; }
}
