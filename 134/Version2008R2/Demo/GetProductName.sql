CREATE FUNCTION GetProductName(@ProductID int)
RETURNS nvarchar(50)
AS BEGIN
	DECLARE @Name nvarchar(50)
	SELECT @Name = Name
	FROM Production.Product 
	WHERE ProductID = @ProductID
	RETURN @Name 
END

sp_reserve_http_namespace N'http://ltree22:80/products'
sp_delete_http_namespace_reservation N'http://ltree22:80/products'


CREATE ENDPOINT products_endpoint 
STATE = STARTED
AS HTTP(
	PATH = '/products',
	AUTHENTICATION = (INTEGRATED),
	PORTS = ( CLEAR ),
	SITE = 'LTREE22'
)
FOR SOAP (
	WEBMETHOD 'GetProductName'
		(name = 'AdventureWorks.dbo.GetProductName'),
	WSDL = DEFAULT,
	SCHEMA = STANDARD)

drop endpoint products_endpoint