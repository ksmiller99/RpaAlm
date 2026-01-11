using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using System.Data;

namespace RpaAlmApi.Data.Repositories;

/// <summary>
/// Base repository for entities with string primary keys
/// </summary>
/// <typeparam name="T">Entity type</typeparam>
public abstract class BaseRepositoryStringKey<T> where T : class, IEntity<string>, new()
{
    protected readonly IDbConnectionFactory _connectionFactory;
    protected readonly string _tableName;
    protected readonly string _primaryKeyColumn;

    protected BaseRepositoryStringKey(IDbConnectionFactory connectionFactory, string tableName, string primaryKeyColumn)
    {
        _connectionFactory = connectionFactory;
        _tableName = tableName;
        _primaryKeyColumn = primaryKeyColumn;
    }

    public virtual async Task<IEnumerable<T>> GetAllAsync()
    {
        var entities = new List<T>();

        using var connection = _connectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_GetAll{_tableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        await connection.OpenAsync();
        using var reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            entities.Add(MapFromReader(reader));
        }

        return entities;
    }

    public virtual async Task<T?> GetByIdAsync(string id)
    {
        using var connection = _connectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_GetByID{_tableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue($"@{_primaryKeyColumn}", id);

        await connection.OpenAsync();
        using var reader = await command.ExecuteReaderAsync();

        if (await reader.ReadAsync())
        {
            return MapFromReader(reader);
        }

        return null;
    }

    public virtual async Task<int> CreateAsync(T entity)
    {
        using var connection = _connectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Insert{_tableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue($"@{_primaryKeyColumn}", entity.Id);
        AddInsertParameters(command, entity);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    public virtual async Task<int> UpdateAsync(T entity)
    {
        using var connection = _connectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Update{_tableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue($"@{_primaryKeyColumn}", entity.Id);
        AddUpdateParameters(command, entity);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    public virtual async Task<int> DeleteAsync(string id)
    {
        using var connection = _connectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Delete{_tableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue($"@{_primaryKeyColumn}", id);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    protected abstract T MapFromReader(SqlDataReader reader);
    protected abstract void AddInsertParameters(SqlCommand command, T entity);
    protected abstract void AddUpdateParameters(SqlCommand command, T entity);

    protected static object GetValueOrDBNull(object? value)
    {
        return value ?? DBNull.Value;
    }

    protected static int? GetNullableInt(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetInt32(ordinal);
    }

    protected static string? GetNullableString(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetString(ordinal);
    }

    protected static DateTime? GetNullableDateTime(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetDateTime(ordinal);
    }
}
