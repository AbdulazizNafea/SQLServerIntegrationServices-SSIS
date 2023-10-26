sqlcmd -S%COMPUTERNAME% -E -dmaster -ic:\134\Scripts\CreateDB134Database.sql
sqlcmd -S%COMPUTERNAME% -E -dmaster -ic:\134\Scripts\CreateSourceDB134Database.sql
sqlcmd -S%COMPUTERNAME% -E -dSourceDB134 -ic:\134\Scripts\CreateLedgerSourceTable.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\authorstablescript.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateProcessCustomers.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateOrders.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateNewEmployee.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateSalesDataTable.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateEmployeeDepartment.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\procHighestSalaryByDivisionByGender.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateRegion.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateProdInfo.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreatePayroll.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateHighValueOrders.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateCustomerImportRowErrors.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateSummarySales.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateSpreadsheetFiles.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateCarSales.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateBlobData.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\GetProductName.sql
sqlcmd -S%COMPUTERNAME% -E -dAdventureworks -ic:\134\Scripts\CreateWebService.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateCustomers.sql
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateNewProducts.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\OLEDBCommand.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateprocUpdateTeam.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateprocCustomerDataTransfer.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateLedgerTargetDataTable.sql 
sqlcmd -S%COMPUTERNAME% -E -dSourceDB134 -ic:\134\Scripts\CreateprocCleanSource.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreateIndividualCustomers.sql 
sqlcmd -S%COMPUTERNAME% -E -dDB134 -ic:\134\Scripts\CreatePublications.sql 
sqlcmd -S%COMPUTERNAME% -E -ddb134 -ic:\134\Scripts\SpecialGiftCustomers.sql 
sqlcmd -S%COMPUTERNAME% -E -ddb134 -ic:\134\Scripts\CreateOrderDetails.sql 
sqlcmd -S%COMPUTERNAME% -E -ddb134 -ic:\134\Scripts\CreateEmployees.sql 
sqlcmd -S%COMPUTERNAME% -E -ddb134 -ic:\134\Scripts\CreateMyProcedure.sql 
::Need to restart sqlserver before we can create user accounts
net stop sqlserveragent
net stop mssqlserver
net start mssqlserver
net start sqlserveragent
c:\windows\system32\perl5\tools\wait.exe .2
::Now can create user account
sqlcmd -S%COMPUTERNAME% -E -ic:\134\Scripts\CreateGeorge.sql 
c:\windows\system32\perl5\tools\wait.exe .2