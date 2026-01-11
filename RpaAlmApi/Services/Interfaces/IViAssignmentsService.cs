using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IViAssignmentsService
{
    Task<IEnumerable<ViAssignmentsDto>> GetAllAsync();
    Task<ViAssignmentsDto?> GetByIdAsync(int id);
    Task<ViAssignmentsDto> CreateAsync(ViAssignmentsCreateRequest request);
    Task<bool> UpdateAsync(int id, ViAssignmentsUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
