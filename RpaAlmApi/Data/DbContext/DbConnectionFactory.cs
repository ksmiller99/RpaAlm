using Microsoft.Data.SqlClient;
using RpaAlmApi.Common.Interfaces;

namespace RpaAlmApi.Data.DbContext;

/// <summary>
/// Factory for creating SQL Server database connections
/// </summary>
public class DbConnectionFactory : IDbConnectionFactory
{
    private readonly string _connectionString;

    public DbConnectionFactory(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("RpaDataDev")
            ?? throw new InvalidOperationException("Connection string 'RpaDataDev' not found");
    }

    public SqlConnection CreateConnection()
    {
        return new SqlConnection(_connectionString);
    }
}
