using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

/// <summary>
/// Service interface for Status business logic
/// </summary>
public interface IStatusService
{
    Task<IEnumerable<StatusDto>> GetAllAsync();
    Task<StatusDto?> GetByIdAsync(int id);
    Task<StatusDto> CreateAsync(StatusCreateRequest request);
    Task<bool> UpdateAsync(int id, StatusUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
