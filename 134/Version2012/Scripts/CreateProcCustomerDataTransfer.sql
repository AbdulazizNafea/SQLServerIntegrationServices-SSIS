
if  exists (select * from information_schema.routines where specific_name = 'procCustomerDataTransfer')
drop proc procCustomerDataTransfer
go
CREATE PROCEDURE procCustomerDataTransfer(
	 @OrderID 	[int],
	 @CustomerID 	[nchar](5),
	 @customer 	[nvarchar](40),
	 @Product 	[nvarchar](40),
	 @CategoryName 	[nvarchar](15),
	 @Quantity 	[smallint],
	 @UnitPrice 	[money],
	 @Discount 	[real],
	 @Supplier 	[nvarchar](40),
	 @shipper 	[nvarchar](40),
	 @PostalCode 	[nvarchar](10),
	 @City 	[nvarchar](15),
	 @Region 	[nvarchar](15),
	 @Country 	[nvarchar](15),
	 @OrderDate 	[datetime],
	 @RequiredDate  	[datetime],
	 @ShippedDate 	[datetime],
	 
	 @UpdateFlag 	[char](1))
AS 
if @UpdateFlag = 'D'
	DELETE [dbo].[LedgerTargetData] 
	WHERE  [OrderID] = @OrderID AND	 [CustomerID] = @CustomerID AND [Product] = @Product
if @UpdateFlag = 'U'
	UPDATE [dbo].[LedgerTargetData] 
	SET  	 [customer]	 = @customer,
		[CategoryName]	 = @CategoryName,
		[Quantity]	 = @Quantity,
		[UnitPrice]	 = @UnitPrice,
		[Discount]	 = @Discount,
		[Supplier]	 = @Supplier,
		[shipper]	 = @shipper,
		[PostalCode]	 = @PostalCode,
		[City]	 = @City,
		[Region]	 = @Region,
		[Country]	 = @Country,
		[OrderDate]	 = @OrderDate,
		[RequiredDate]	 = @RequiredDate,
		[ShippedDate]	 = @ShippedDate,
		[UpdateFlag]	 = @UpdateFlag 
	WHERE 
		[OrderID]	 = @OrderID AND	[CustomerID] = @CustomerID AND [Product] = @Product 
if @UpdateFlag = 'I'
INSERT INTO [dbo].[LedgerTargetData] 
	 ( [OrderID],
	 [CustomerID],
	 [customer],
	 [Product],
	 [CategoryName],
	 [Quantity],
	 [UnitPrice],
	 [Discount],
	 [Supplier],
	 [shipper],
	 [PostalCode],
	 [City],
	 [Region],
	 [Country],
	 [OrderDate],
	 [RequiredDate],
	 [ShippedDate],
	 [UpdateFlag]) 
 
VALUES 
	( @OrderID,
	 @CustomerID,
	 @customer,
	 @Product,
	 @CategoryName,
	 @Quantity,
	 @UnitPrice,
	 @Discount,
	 @Supplier,
	 @shipper,
	 @PostalCode,
	 @City,
	 @Region,
	 @Country,
	 @OrderDate,
	 @RequiredDate,
	 @ShippedDate,
	 @UpdateFlag)

GO