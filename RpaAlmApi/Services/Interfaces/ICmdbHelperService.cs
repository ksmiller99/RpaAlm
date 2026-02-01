using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ICmdbHelperService
{
    Task<IEnumerable<CmdbHelperDto>> GetAllAsync();
    Task<CmdbHelperDto?> GetByIdAsync(int id);
    Task<CmdbHelperDto> CreateAsync(CmdbHelperCreateRequest request);
    Task<bool> UpdateAsync(int id, CmdbHelperUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
