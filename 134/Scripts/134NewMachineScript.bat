REM ****************134 script to reconfigure new machine name by Charles Kangai ****************************

sqlcmd -Usa -Psapw -Q"declare @servr varchar(20) declare @query varchar(8000) select @servr = [name] from master.sys.servers while @servr is not null begin   set @query = 'sp_dropserver ' + @servr + ', @droplogins = ''droplogins'''   EXECUTE(@query)   set @servr = null   select @servr = [name] from master.sys.servers end"
sqlcmd -E -Q"sp_addserver %COMPUTERNAME%, LOCAL"

sqlcmd -E -Q"sp_addserver %COMPUTERNAME%, LOCAL"

net stop mssqlserver /y
net start mssqlserver /y
net stop SQLServerReportingServices
net start SQLServerReportingServices

sqlcmd -Usa -Psapw -Q"USE [master] declare @strDropLogin nvarchar(255), @strLogin nvarchar(255) if exists (select * from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'Administrator') begin	select @strLogin = [name] from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'Administrator' set @strDropLogin = 'DROP LOGIN [' + @strLogin + ']' exec (@strDropLogin) end if not exists (select * from sys.server_principals where [name] = @@servername + '\Administrator') begin declare @x varchar(100) set @x = 'CREATE LOGIN [' + @@servername + '\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master]' exec (@x) end declare @y varchar(100) set @y = 'EXEC master..sp_addsrvrolemember @loginame = ''' + @@SERVERNAME + '\Administrator'', @rolename=''sysadmin''' exec(@y)"

sqlcmd -Usa -Psapw -Q"USE [master] declare @strDropLogin nvarchar(255), @strLogin nvarchar(255) if exists (select * from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'George') begin	select @strLogin = [name] from sys.server_principals where substring([name], charindex('\', [name], 1) + 1, 99) = 'George' set @strDropLogin = 'DROP LOGIN [' + @strLogin + ']' exec (@strDropLogin) end if not exists (select * from sys.server_principals where [name] = @@servername + '\George') begin declare @x varchar(100) set @x = 'CREATE LOGIN [' + @@servername + '\George] FROM WINDOWS WITH DEFAULT_DATABASE=[master]' exec (@x) end"

rsconfig -c -s%COMPUTERNAME% -dReportServer -aWindows -iSSRS