
/*

select EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, Gender, 
BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone,
Extension, ReportsTo, CurrentSalary, e.DivisionID, e.DepartmentID
, d.DepartmentName, div.DivisionName 
INTO EmployeeDepartment 
FROM Eastwind.dbo.Employees as e INNER JOIN Eastwind.dbo.Departments as d on 
e.DepartmentID = d.DepartmentID and e.DivisionID = d.DivisionID 
INNER JOIN Eastwind.dbo.Divisions as div ON d.DivisionID = div.DivisionID 

*/


if exists (select * from information_schema.tables where table_name = 'EmployeeDepartment')
drop table [dbo].[EmployeeDepartment]
go
CREATE TABLE [dbo].[EmployeeDepartment](
	[EmployeeID] [int] NOT NULL,
	[LastName] [varchar](20)  COLLATE Latin1_General_CI_AI NOT NULL,
	[FirstName] [varchar](10)  COLLATE Latin1_General_CI_AI NOT NULL,
	[Title] [varchar](30)  COLLATE Latin1_General_CI_AI NULL,
	[TitleOfCourtesy] [varchar](25) COLLATE Latin1_General_CI_AI  NULL,
	[Gender] [char](1)  COLLATE Latin1_General_CI_AI NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [varchar](60)  COLLATE Latin1_General_CI_AI NULL,
	[City] [varchar](15)  COLLATE Latin1_General_CI_AI NULL,
	[Region] [varchar](15)  COLLATE Latin1_General_CI_AI NULL,
	[PostalCode] [varchar](10)  COLLATE Latin1_General_CI_AI NULL,
	[Country] [varchar](15)  COLLATE Latin1_General_CI_AI NULL,
	[HomePhone] [varchar](24)  COLLATE Latin1_General_CI_AI NULL,
	[Extension] [varchar](4)  COLLATE Latin1_General_CI_AI NULL,
	[ReportsTo] [int] NULL,
	[CurrentSalary] [money] NULL,
	[DivisionID] [numeric](5, 0) NULL,
	[DepartmentID] [numeric](5, 0) NULL,
	[DepartmentName] [varchar](40)  COLLATE Latin1_General_CI_AI NOT NULL,
	[DivisionName] [varchar](40)  COLLATE Latin1_General_CI_AI NOT NULL
) 
go
bulk insert dbo.EmployeeDepartment from 'c:\134\Scripts\EmployeeDepartment.txt' 
with (datafiletype = 'char', fieldterminator = '\t', rowterminator = '\n')
go





