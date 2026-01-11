using RpaAlmApi.Models.DTOs;
using RpaAlmApi.Models.Requests;

namespace RpaAlmApi.Services.Interfaces;

public interface IFunctionService
{
    Task<IEnumerable<FunctionDto>> GetAllAsync();
    Task<FunctionDto?> GetByIdAsync(int id);
    Task<FunctionDto> CreateAsync(FunctionCreateRequest request);
    Task<bool> UpdateAsync(int id, FunctionUpdateRequest request);
    Task<bool> DeleteAsync(int id);
}
