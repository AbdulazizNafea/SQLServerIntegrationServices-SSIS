/*
Charles Kangai, e-mail: charlesk@kangai.demon.co.uk

*/
alter database DB134 SET TRUSTWORTHY ON

use DB134
create assembly DTSRunTimeWrap 
from 'C:\Program Files\Microsoft SQL Server\120\SDK\Assemblies\Microsoft.SQLServer.DTSRuntimeWrap.dll'
with permission_set = UNSAFE

create assembly ManagedDTS from 'C:\Program Files\Microsoft SQL Server\120\SDK\Assemblies\Microsoft.SQLServer.ManagedDTS.dll'
with permission_set = UNSAFE

Create Assembly Packages from 'c:\134\SSIS\SSIS\Obj\Debug\SSIS.dll' 
with permission_set = SAFE

select * from sys.assemblies
