
if exists (select * from information_schema.tables where table_name = 'NewEmployee')
drop table dbo.NewEmployee 
go
create table dbo.NewEmployee 
(EmployeeID INT, FirstName nvarchar(30), LastName nvarchar(30), HireDate datetime,
EmployeePhoto image)
go