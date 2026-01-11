using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ISlaMasterService
{
    Task<IEnumerable<SlaMasterDto>> GetAllAsync();
    Task<SlaMasterDto?> GetByIdAsync(int id);
    Task<SlaMasterDto> CreateAsync(SlaMasterCreateRequest request);
    Task<bool> UpdateAsync(int id, SlaMasterUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
