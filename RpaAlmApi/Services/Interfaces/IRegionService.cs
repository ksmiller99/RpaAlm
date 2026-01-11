using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IRegionService
{
    Task<IEnumerable<RegionDto>> GetAllAsync();
    Task<RegionDto?> GetByIdAsync(int id);
    Task<RegionDto> CreateAsync(RegionCreateRequest request);
    Task<bool> UpdateAsync(int id, RegionUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
