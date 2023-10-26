
if exists (select * from information_schema.tables where table_name = 'LedgerTargetData')
drop table dbo.LedgerTargetData
go
CREATE TABLE [dbo].[LedgerTargetData] (
	[OrderID] [int] NOT NULL ,
	[CustomerID] [nchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[customer] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Product] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CategoryName] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Quantity] [smallint] NOT NULL ,
	[UnitPrice] [money] NOT NULL ,
	[Discount] [real] NOT NULL ,
	[Supplier] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[shipper] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PostalCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Region] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Country] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OrderDate] [datetime] NULL ,
	[RequiredDate] [datetime] NULL ,
	[ShippedDate] [datetime] NULL ,
	[UpdateFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) 