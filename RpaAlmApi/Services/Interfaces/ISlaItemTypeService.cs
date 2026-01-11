using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ISlaItemTypeService
{
    Task<IEnumerable<SlaItemTypeDto>> GetAllAsync();
    Task<SlaItemTypeDto?> GetByIdAsync(int id);
    Task<SlaItemTypeDto> CreateAsync(SlaItemTypeCreateRequest request);
    Task<bool> UpdateAsync(int id, SlaItemTypeUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
