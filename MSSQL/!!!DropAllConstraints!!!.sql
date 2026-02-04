/*
* Caution: Executing these scripts will permanently remove all specified constraints 
* (Foreign Key, Primary Key, Unique, Check, Default) from your database. This action 
* cannot be easily undone and may cause data integrity issues. It is highly recommended 
* to back up your database and test this process in a development environment first. 
*/

USE RpaAlmDev;
Go

DECLARE @sql NVARCHAR(MAX);
SET @sql = N'';

SELECT @sql = @sql + N' ALTER TABLE ' 
    + QUOTENAME(s.name) + N'.' 
    + QUOTENAME(t.name) + N' DROP CONSTRAINT ' 
    + QUOTENAME(c.name) + N';'
	+ CHAR(13)
	+ CHAR(10)
FROM sys.objects AS c
INNER JOIN sys.tables AS t ON c.parent_object_id = t.[object_id]
INNER JOIN sys.schemas AS s ON t.[schema_id] = s.[schema_id]
WHERE c.[type] IN ('D', 'C', 'F', 'PK', 'UQ') -- Types: Default, Check, Foreign Key, Primary Key, Unique
ORDER BY c.[type]; -- Ordering helps avoid issues where a FK relies on a PK/UQ

-- Print the generated script to review it (optional, limited to 4000 chars in print output)
-- Optional: Print the generated script to review before execution
DECLARE @size INT = LEN(@sql);
DECLARE @count INT = 0;
WHILE @size > 0
BEGIN
    PRINT SUBSTRING(@sql,(@count*4000)+1,IIF(@size>4000,4000,@size));
	SET @size = @size-4000;
	SET @count = @count+1;
END

-- Uncomment the following line to execute the script
-- EXEC sys.sp_executesql @sql;
