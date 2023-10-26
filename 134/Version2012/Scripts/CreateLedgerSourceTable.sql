
if exists (select * from information_schema.tables where table_name = 'LedgerSourceData')
drop table LedgerSourceData
go
CREATE TABLE dbo.LedgerSourceData (
	OrderID int NOT NULL,
	CustomerID nchar(5) NOT NULL,
	Customer nvarchar(40) NOT NULL,
	Product nvarchar(40) NOT NULL,
	CategoryName nvarchar(15) NOT NULL,
	Quantity smallint NOT NULL,
	UnitPrice money NOT NULL,
	Discount real NOT NULL,
	Supplier nvarchar(40) NOT NULL,
	Shipper nvarchar(40) NOT NULL,
	PostalCode nvarchar(10) NULL,
	City nvarchar(15)  NULL,
	Region nvarchar(15) NULL,
	Country nvarchar(15) NULL,
	OrderDate datetime NULL,
	RequiredDate datetime NULL,
	ShippedDate datetime NULL,
	UpdateFlag char(1) DEFAULT('I') NULL)

go

BULK INSERT dbo.LedgerSourceData FROM 'c:\134\Scripts\LedgerSourceData.txt' 
with (datafiletype = 'char', rowterminator = '\n', firstrow = 2)

go
CREATE TRIGGER ledgerSourceData_D_TR ON [LedgerSourceData] 
INSTEAD OF delete
AS
/* flag records that have been deleted but not processed yet */
update ledgerSourceData
	set updateflag = 'D'
FROM LedgerSourceData l INNER JOIN deleted d
	on 	l.orderid = d.orderid
	and l.customerid = d.customerid
	and l.product = d.product
	and d.updateflag <> 'D'

/* do an actual deletion when the cleanup process comes along */
if current_user = 'CleaningAgent'
begin
delete LedgerSourceData 
from LedgerSourceData l INNER JOIN deleted d
	on l.orderid = d.orderid
	and l.customerid = d.customerid
	and l.product = d.product
	and d.updateflag = 'D'
end
GO

go
CREATE  TRIGGER LedgerSourceData_U_TR ON LedgerSourceData 
AFTER UPDATE 
AS
/* This is a new update, flag it */
	UPDATE LedgerSourceData SET UpdateFlag = 'U' 
	FROM inserted INNER JOIN LedgerSourceData
	ON inserted.OrderID = LedgerSourceData.Orderid 
	AND inserted.CustomerID = LedgerSourceData.CustomerID
	AND inserted.UpdateFlag = 'C'

/* Reset the flag to C when we do the cleanup */
if current_user = 'CleaningAgent'
    begin
	UPDATE LedgerSourceData 
	SET UpdateFlag = 'C'
	FROM inserted INNER JOIN LedgerSourceData
	ON inserted.OrderID = LedgerSourceData.OrderID
	AND inserted.CustomerID = LedgerSourceData.CustomerID
	INNER JOIN deleted 
	ON inserted.OrderID = deleted.OrderID
	AND inserted.CustomerID = deleted.CustomerID
	AND deleted.UpdateFlag in ('I', 'U')
    end
GO

