using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IAutomationService
{
    Task<IEnumerable<AutomationDto>> GetAllAsync();
    Task<AutomationDto?> GetByIdAsync(int id);
    Task<AutomationDto> CreateAsync(AutomationCreateRequest request);
    Task<bool> UpdateAsync(int id, AutomationUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
