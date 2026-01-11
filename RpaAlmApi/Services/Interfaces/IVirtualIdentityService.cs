using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IVirtualIdentityService
{
    Task<IEnumerable<VirtualIdentityDto>> GetAllAsync();
    Task<VirtualIdentityDto?> GetByIdAsync(int id);
    Task<VirtualIdentityDto> CreateAsync(VirtualIdentityCreateRequest request);
    Task<bool> UpdateAsync(int id, VirtualIdentityUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
