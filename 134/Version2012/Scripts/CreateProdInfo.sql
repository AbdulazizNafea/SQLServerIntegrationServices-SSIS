
if exists (select * from information_schema.tables where table_name = 'ProdInfo')
drop table ProdInfo
go
create table ProdInfo
(SQLProductType char(2), SQLProductID char(2)
, SQLProductName varchar(30)
, SQLCategoryName varchar(20)
, SQLManufacturingDate smalldatetime)
go


