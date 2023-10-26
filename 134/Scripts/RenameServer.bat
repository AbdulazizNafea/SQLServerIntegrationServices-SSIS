sqlcmd -Usa -Psapw -Q"declare @servr varchar(20) declare @query varchar(8000) select @servr = [name] from master.sys.servers while @servr is not null begin   set @query = 'sp_dropserver ' + @servr + ', @droplogins = ''droplogins'''   EXECUTE(@query)   set @servr = null   select @servr = [name] from master.sys.servers end"
sqlcmd -E -Q"sp_addserver %COMPUTERNAME%, LOCAL"

net stop sqlserveragent
net stop mssqlserver
net start mssqlserver
net start sqlserveragent

iisreset /noforce



