if not exists (select * from sys.databases where [name] = 'SourceDB134')
create database SourceDB134

GO

go
use SourceDB134
go
if not exists (select* from sys.database_principals where name = 'CleaningAgent')
create user CleaningAgent without login with default_schema = dbo
go
EXEC sp_addrolemember N'db_datareader', N'CleaningAgent'
EXEC sp_addrolemember N'db_datawriter', N'CleaningAgent'
go