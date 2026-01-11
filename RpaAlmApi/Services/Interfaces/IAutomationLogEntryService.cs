using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IAutomationLogEntryService
{
    Task<IEnumerable<AutomationLogEntryDto>> GetAllAsync();
    Task<AutomationLogEntryDto?> GetByIdAsync(int id);
    Task<AutomationLogEntryDto> CreateAsync(AutomationLogEntryCreateRequest request);
    Task<bool> UpdateAsync(int id, AutomationLogEntryUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
