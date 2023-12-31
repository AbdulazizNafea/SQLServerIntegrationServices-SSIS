USE [master]
GO

declare @strDropLogin nvarchar(255), @strLogin nvarchar(255)
if exists (select * from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 6) = 'George')
begin
	select @strLogin = [name] from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 6) = 'George'
	set @strDropLogin = 'DROP LOGIN [' + @strLogin + ']'
	exec (@strDropLogin)
end

if not exists (select * from sys.server_principals where [name] = @@servername + '\George')
  begin
    declare @x varchar(100)
    set @x = 'CREATE LOGIN [' + @@servername + '\George] FROM WINDOWS WITH DEFAULT_DATABASE=[master]'
    exec (@x)
  end
GO

USE [msdb]
GO
if not exists (select * from sys.database_principals where [name] = 'AuditUsers')
CREATE ROLE [AuditUsers]
GO
if exists (select * from sys.database_principals where [name] = 'George')
drop user George
GO
USE [DB134]
GO
if exists (select * from sys.database_principals where [name] = 'George')
drop user George

USE [msdb]
GO
declare @x varchar(100)
set @x = 'CREATE USER [George] FOR LOGIN [' + @@servername + '\George]'
exec (@x)
GO
EXEC sp_addrolemember N'AuditUsers', N'George'
GO

USE [DB134]
GO
declare @x varchar(100)
set @x = 'CREATE USER [George] FOR LOGIN [' + @@servername + '\George]'
exec (@x)
GO

EXEC sp_addrolemember N'db_datareader', N'George'
EXEC sp_addrolemember N'db_datawriter', N'George'
EXEC sp_addrolemember N'db_ddladmin', N'George'
GRANT EXECUTE ON HighestSalaryByDivisionByGender TO George
GRANT EXECUTE ON procCustomerDataTransfer TO George
GRANT EXECUTE ON ProcessCustomers TO George
GRANT EXECUTE ON procUpdateTeam TO George