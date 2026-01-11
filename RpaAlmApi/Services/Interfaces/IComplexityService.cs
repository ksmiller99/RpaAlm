using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IComplexityService
{
    Task<IEnumerable<ComplexityDto>> GetAllAsync();
    Task<ComplexityDto?> GetByIdAsync(int id);
    Task<ComplexityDto> CreateAsync(ComplexityCreateRequest request);
    Task<bool> UpdateAsync(int id, ComplexityUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
