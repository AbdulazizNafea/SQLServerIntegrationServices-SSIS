
if exists (select * from information_schema.tables where table_name = 'NewProducts')
drop table NewProducts
go
create table NewProducts 
(SQLProductID char(2)
, SQLProductType char(2)
, SQLProductName varchar(30)
, SQLCategoryName varchar(20)
, SQLManufacturingDate smalldatetime
)
go