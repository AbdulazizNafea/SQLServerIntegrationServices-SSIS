if  exists (select * from information_schema.routines where routine_name = 'GetProductName')
drop function GetProductName
go
go
CREATE FUNCTION GetProductName(@ProductID int)
RETURNS nvarchar(50)
AS BEGIN
	DECLARE @Name nvarchar(50)
	SELECT @Name = Name
	FROM Production.Product 
	WHERE ProductID = @ProductID
	RETURN @Name 
END
