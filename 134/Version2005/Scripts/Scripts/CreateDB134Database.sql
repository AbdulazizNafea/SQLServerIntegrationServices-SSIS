if not exists (select * from sys.databases where [name] = 'DB134')
CREATE DATABASE [DB134] ON  PRIMARY 
( NAME = N'DB134'
, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\DB134.mdf' 
, SIZE = 40MB 
, FILEGROWTH = 10MB )
 LOG ON 
( NAME = N'DB134_log'
, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\DB134_log.ldf' 
, SIZE = 10MB 
, FILEGROWTH = 10MB )
GO