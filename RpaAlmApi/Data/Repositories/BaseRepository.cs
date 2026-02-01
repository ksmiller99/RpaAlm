using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;
using System.Data;

namespace RpaAlmApi.Data.Repositories;

/// <summary>
/// Base repository implementing common CRUD operations using stored procedures
/// </summary>
/// <typeparam name="T">Entity type</typeparam>
public abstract class BaseRepository<T> : IRepository<T> where T : class, IEntity, new()
{
    protected readonly IDbConnectionFactory ConnectionFactory;
    protected readonly string TableName;

    protected BaseRepository(IDbConnectionFactory connectionFactory, string tableName)
    {
        ConnectionFactory = connectionFactory;
        TableName = tableName;
    }

    /// <summary>
    /// Get all entities
    /// </summary>
    public virtual async Task<IEnumerable<T>> GetAllAsync()
    {
        var entities = new List<T>();

        using var connection = ConnectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_GetAll{TableName}", connection)
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

    /// <summary>
    /// Get entity by ID
    /// </summary>
    public virtual async Task<T?> GetByIdAsync(int id)
    {
        using var connection = ConnectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_GetByID{TableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue("@ID", id);

        await connection.OpenAsync();
        using var reader = await command.ExecuteReaderAsync();

        if (await reader.ReadAsync())
        {
            return MapFromReader(reader);
        }

        return null;
    }

    /// <summary>
    /// Create new entity
    /// </summary>
    public virtual async Task<int> CreateAsync(T entity)
    {
        using var connection = ConnectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Insert{TableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        AddInsertParameters(command, entity);

        var newIdParam = new SqlParameter("@NewID", SqlDbType.Int)
        {
            Direction = ParameterDirection.Output
        };
        command.Parameters.Add(newIdParam);

        await connection.OpenAsync();
        await command.ExecuteNonQueryAsync();

        return (int)newIdParam.Value;
    }

    /// <summary>
    /// Update existing entity
    /// </summary>
    public virtual async Task<int> UpdateAsync(T entity)
    {
        using var connection = ConnectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Update{TableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue("@ID", entity.Id);
        AddUpdateParameters(command, entity);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    /// <summary>
    /// Delete entity by ID
    /// </summary>
    public virtual async Task<int> DeleteAsync(int id)
    {
        using var connection = ConnectionFactory.CreateConnection();
        using var command = new SqlCommand($"sp_Delete{TableName}", connection)
        {
            CommandType = CommandType.StoredProcedure
        };

        command.Parameters.AddWithValue("@ID", id);

        await connection.OpenAsync();
        return await command.ExecuteNonQueryAsync();
    }

    /// <summary>
    /// Map SqlDataReader to entity (must be implemented by derived classes)
    /// </summary>
    protected abstract T MapFromReader(SqlDataReader reader);

    /// <summary>
    /// Add parameters for Insert operation (must be implemented by derived classes)
    /// </summary>
    protected abstract void AddInsertParameters(SqlCommand command, T entity);

    /// <summary>
    /// Add parameters for Update operation (must be implemented by derived classes)
    /// </summary>
    protected abstract void AddUpdateParameters(SqlCommand command, T entity);

    /// <summary>
    /// Helper method to safely get value from reader
    /// </summary>
    protected static object GetValueOrDbNull(object? value)
    {
        return value ?? DBNull.Value;
    }

    /// <summary>
    /// Helper method to safely read nullable int from reader
    /// </summary>
    protected static int? GetNullableInt(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetInt32(ordinal);
    }

    /// <summary>
    /// Helper method to safely read nullable string from reader
    /// </summary>
    protected static string? GetNullableString(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetString(ordinal);
    }

    /// <summary>
    /// Helper method to safely read nullable DateTime from reader
    /// </summary>
    protected static DateTime? GetNullableDateTime(SqlDataReader reader, string columnName)
    {
        var ordinal = reader.GetOrdinal(columnName);
        return reader.IsDBNull(ordinal) ? null : reader.GetDateTime(ordinal);
    }
}
