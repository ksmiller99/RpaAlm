using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ISlaItemService
{
    Task<IEnumerable<SlaItemDto>> GetAllAsync();
    Task<SlaItemDto?> GetByIdAsync(int id);
    Task<SlaItemDto> CreateAsync(SlaItemCreateRequest request);
    Task<bool> UpdateAsync(int id, SlaItemUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
