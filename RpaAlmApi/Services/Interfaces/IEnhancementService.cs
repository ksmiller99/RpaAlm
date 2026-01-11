using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IEnhancementService
{
    Task<IEnumerable<EnhancementDto>> GetAllAsync();
    Task<EnhancementDto?> GetByIdAsync(int id);
    Task<EnhancementDto> CreateAsync(EnhancementCreateRequest request);
    Task<bool> UpdateAsync(int id, EnhancementUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
