if exists (select * from information_schema.tables where table_name = 'OrderDetails')
drop table OrderDetails
go
create table OrderDetails
(OrderID int, ProductID int, Quantity smallint, UnitPrice money, Discount float)
go