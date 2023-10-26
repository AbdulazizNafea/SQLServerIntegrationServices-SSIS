
::Need to restart sqlserver before we can create user accounts
net stop sqlserveragent
net stop mssqlserver
net start mssqlserver
net start sqlserveragent
::Now can create user account
c:\windows\system32\perl5\tools\wait.exe .2

sqlcmd -S%COMPUTERNAME% -E -ic:\134\Scripts\CreateGeorge.sql 
