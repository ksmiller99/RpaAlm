using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IJjedsHelperService
{
    Task<IEnumerable<JjedsHelperDto>> GetAllAsync();
    Task<JjedsHelperDto?> GetByIdAsync(int id);
    Task<JjedsHelperDto> CreateAsync(JjedsHelperCreateRequest request);
    Task<bool> UpdateAsync(int id, JjedsHelperUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
