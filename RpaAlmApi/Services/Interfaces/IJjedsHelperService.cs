using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IJjedsHelperService
{
    Task<IEnumerable<JjedsHelperDto>> GetAllAsync();
    Task<JjedsHelperDto?> GetByWwidAsync(string wwid);
    Task<JjedsHelperDto> CreateAsync(JjedsHelperCreateRequest request);
    Task<bool> UpdateAsync(string wwid, JjedsHelperUpdateRequest request);
    Task<bool> DeleteAsync(string wwid);
}
