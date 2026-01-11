using Microsoft.Data.SqlClient;

namespace RpaAlmApi.Common.Interfaces;

/// <summary>
/// Factory interface for creating database connections
/// </summary>
public interface IDbConnectionFactory
{
    SqlConnection CreateConnection();
}
