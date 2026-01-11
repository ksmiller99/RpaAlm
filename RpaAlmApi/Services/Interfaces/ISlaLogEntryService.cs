using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface ISlaLogEntryService
{
    Task<IEnumerable<SlaLogEntryDto>> GetAllAsync();
    Task<SlaLogEntryDto?> GetByIdAsync(int id);
    Task<SlaLogEntryDto> CreateAsync(SlaLogEntryCreateRequest request);
    Task<bool> UpdateAsync(int id, SlaLogEntryUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
