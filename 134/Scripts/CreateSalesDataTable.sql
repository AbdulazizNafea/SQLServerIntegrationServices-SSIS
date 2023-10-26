
if exists (SELECT * FROM information_schema.tables where table_name = 'SalesData')
drop table SalesData
go
CREATE TABLE SalesData
(ProductID int not null,
 TimeID int not null,
 CustomerID int not null,
 PromotionID int not null,
 StoreID int not null,
 StoreSales money not null, 
 StoreCost money not null,
 UnitSales int not null)
go