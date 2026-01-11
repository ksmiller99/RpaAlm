using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IAutomationEnvironmentService
{
    Task<IEnumerable<AutomationEnvironmentDto>> GetAllAsync();
    Task<AutomationEnvironmentDto?> GetByIdAsync(int id);
    Task<AutomationEnvironmentDto> CreateAsync(AutomationEnvironmentCreateRequest request);
    Task<bool> UpdateAsync(int id, AutomationEnvironmentUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
