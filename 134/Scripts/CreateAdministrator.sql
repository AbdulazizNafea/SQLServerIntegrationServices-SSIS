USE [master]
GO

declare @strDropLogin nvarchar(255), @strLogin nvarchar(255)
if exists (select * from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'Administrator')
begin
	select @strLogin = [name] from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'Administrator'
	set @strDropLogin = 'DROP LOGIN [' + @strLogin + ']'
	exec (@strDropLogin)
end

if not exists (select * from sys.server_principals where [name] = @@servername + '\Administrator')
  begin
    declare @x varchar(100)
    set @x = 'CREATE LOGIN [' + @@servername + '\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master]'
    exec (@x)
  end
GO
declare @x varchar(100)
set @x = 'EXEC master..sp_addsrvrolemember @loginame = ''' + @@SERVERNAME + '\Administrator'', @rolename=''sysadmin'''
exec(@x)




