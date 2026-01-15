using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

/// <summary>
/// Service interface for RPA RpaStatus business logic
/// </summary>
public interface IRpaStatusService
{
    Task<IEnumerable<RpaStatusDto>> GetAllAsync();
    Task<RpaStatusDto?> GetByIdAsync(int id);
    Task<RpaStatusDto> CreateAsync(RpaStatusCreateRequest request);
    Task<bool> UpdateAsync(int id, RpaStatusUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
