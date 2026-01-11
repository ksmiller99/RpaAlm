using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IAutomationEnvironmentTypeService
{
    Task<IEnumerable<AutomationEnvironmentTypeDto>> GetAllAsync();
    Task<AutomationEnvironmentTypeDto?> GetByIdAsync(int id);
    Task<AutomationEnvironmentTypeDto> CreateAsync(AutomationEnvironmentTypeCreateRequest request);
    Task<bool> UpdateAsync(int id, AutomationEnvironmentTypeUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
