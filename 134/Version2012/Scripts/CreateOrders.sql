
if exists (select * from information_schema.tables where table_name = 'Orders')
drop table Orders
go
CREATE TABLE [dbo].[Orders] (
	[OrderID] [int]  NOT NULL ,
	[CustomerID] [nchar] (5)  NULL ,
	[EmployeeID] [int] NULL ,
	[OrderDate] [datetime] NULL ,
	[RequiredDate] [datetime] NULL ,
	[ShippedDate] [datetime] NULL ,
	[ShipVia] [int] NULL ,
	[Freight] [money] NULL ,
	[ShipName] [nvarchar] (40)  NULL ,
	[ShipAddress] [nvarchar] (60)  NULL ,
	[ShipCity] [nvarchar] (15)  NULL ,
	[ShipRegion] [nvarchar] (15)  NULL ,
	[ShipPostalCode] [nvarchar] (10)  NULL ,
	[ShipCountry] [nvarchar] (15)  NULL 
) 
GO
