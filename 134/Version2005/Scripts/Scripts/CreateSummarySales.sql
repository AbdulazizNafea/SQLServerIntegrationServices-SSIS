
if exists (select * from information_schema.tables where table_name = 'SummarySales')
drop table dbo.SummarySales
go
create table dbo.SummarySales
(
OrderID int
, OrderDate datetime
, ProductID int
, Quantity smallint
, UnitPrice money
, NetAmount money
, ProductName nvarchar(40)
, CategoryName nvarchar(15)
)
go

bulk insert dbo.SummarySales from 'c:\134\Scripts\SummarySales.txt' 
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n')
go