if not exists (select * from sys.databases where [name] = 'SourceDB134')
create database SourceDB134
 ON  PRIMARY 
( NAME = N'SourceDB134'
, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SourceDB134.mdf' 
, SIZE = 20MB 
, FILEGROWTH = 10MB )
 LOG ON 
( NAME = N'SourceDB134_log'
, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\SourceDB134_log.ldf' 
, SIZE = 10MB 
, FILEGROWTH = 10MB )
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