using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IADDomainService
{
    Task<IEnumerable<ADDomainDto>> GetAllAsync();
    Task<ADDomainDto?> GetByIdAsync(int id);
    Task<ADDomainDto> CreateAsync(ADDomainCreateRequest request);
    Task<bool> UpdateAsync(int id, ADDomainUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
