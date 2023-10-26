
if exists (select * from information_schema.tables where table_name = 'Payroll')
drop table dbo.Payroll
go
create table dbo.Payroll
(EmployeeID int not null
, FirstName nvarchar(20)
, LastName nvarchar(30)
, PositionTitle nvarchar(40)
, HireDate smalldatetime not null
, Salary money not null
, DepartmentDescription nvarchar(100)
, PayFrequency smallint not null
)

go