
if exists (select * from information_schema.tables where table_name = 'Customers')
drop table dbo.Customers
go
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5)  NOT NULL,
	[CompanyName] [nvarchar](40)  NOT NULL,
	[ContactName] [nvarchar](30)  NULL,
	[ContactTitle] [nvarchar](30)  NULL,
	[Address] [nvarchar](60)  NULL,
	[City] [nvarchar](15)  NULL,
	[Region] [nvarchar](30)  NOT NULL,
	[PostalCode] [nvarchar](10)  NULL,
	[Country] [nvarchar](15)  NULL,
	[Phone] [nvarchar](24)  NULL,
	[Fax] [nvarchar](24)  NULL
) 
go
