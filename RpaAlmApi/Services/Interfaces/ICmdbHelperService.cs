using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ICmdbHelperService
{
    Task<IEnumerable<CmdbHelperDto>> GetAllAsync();
    Task<CmdbHelperDto?> GetByAppIdAsync(string appId);
    Task<CmdbHelperDto> CreateAsync(CmdbHelperCreateRequest request);
    Task<bool> UpdateAsync(string appId, CmdbHelperUpdateRequest request);
    Task<bool> DeleteAsync(string appId);
}
