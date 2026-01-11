using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ISegmentService
{
    Task<IEnumerable<SegmentDto>> GetAllAsync();
    Task<SegmentDto?> GetByIdAsync(int id);
    Task<SegmentDto> CreateAsync(SegmentCreateRequest request);
    Task<bool> UpdateAsync(int id, SegmentUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
