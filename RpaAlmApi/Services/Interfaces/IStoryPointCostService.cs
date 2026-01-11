using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IStoryPointCostService
{
    Task<IEnumerable<StoryPointCostDto>> GetAllAsync();
    Task<StoryPointCostDto?> GetByIdAsync(int id);
    Task<StoryPointCostDto> CreateAsync(StoryPointCostCreateRequest request);
    Task<bool> UpdateAsync(int id, StoryPointCostUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
