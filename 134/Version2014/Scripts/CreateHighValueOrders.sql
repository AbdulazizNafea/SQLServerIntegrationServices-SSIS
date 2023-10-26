
if exists (select * from information_schema.tables where table_name = 'HighValueOrders')
drop table dbo.HighValueOrders
go
create table dbo.HighValueOrders
(OrderID int
, ProductID int
, Quantity smallint
, UnitPrice money
, Discount real
, NetAmount money
, CategoryID int
, ProductName nvarchar(40)
, CategoryName nvarchar(15)
)
go