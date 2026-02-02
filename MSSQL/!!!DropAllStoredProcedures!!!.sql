/*
* Caution: Executing these scripts will permanently remove all stored procedures 
* from your database. This action cannot be easily undone and may cause data
* integrity issues. It is highly recommended to back up your database and 
* test this process in a development environment first. 
*/

USE RpaAlmDev;
Go

DECLARE @sql NVARCHAR(MAX) = N'';

-- Generate DROP PROCEDURE statements for all user-defined stored procedures
SELECT @sql += N'DROP PROCEDURE ' + QUOTENAME(s.name) + N'.' + QUOTENAME(p.name) + N';' + CHAR(13) + CHAR(10)
FROM sys.procedures AS p
INNER JOIN sys.schemas AS s ON p.[schema_id] = s.[schema_id]
WHERE p.is_ms_shipped = 0; -- Exclude system stored procedures

-- Optional: Print the generated script to review before execution
DECLARE @size INT = LEN(@sql);
DECLARE @count INT = 0;
WHILE @size > 0
BEGIN
    PRINT SUBSTRING(@sql,(@count*4000)+1,IIF(@size>4000,4000,@size));
	SET @size = @size-4000;
	SET @count = @count+1;
END

-- Execute the generated script
-- EXEC sys.sp_executesql @sql;
