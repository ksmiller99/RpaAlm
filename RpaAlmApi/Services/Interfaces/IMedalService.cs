using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IMedalService
{
    Task<IEnumerable<MedalDto>> GetAllAsync();
    Task<MedalDto?> GetByIdAsync(int id);
    Task<MedalDto> CreateAsync(MedalCreateRequest request);
    Task<bool> UpdateAsync(int id, MedalUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
