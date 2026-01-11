using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IEnhancementUserStoryService
{
    Task<IEnumerable<EnhancementUserStoryDto>> GetAllAsync();
    Task<EnhancementUserStoryDto?> GetByIdAsync(int id);
    Task<EnhancementUserStoryDto> CreateAsync(EnhancementUserStoryCreateRequest request);
    Task<bool> UpdateAsync(int id, EnhancementUserStoryUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
