if  exists (select * from information_schema.routines where routine_name = 'GetProductName')
drop function GetProductName
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

go
if exists (select * from master.sys.soap_endpoints where name = 'products_endpoint')
drop endpoint products_endpoint
go
CREATE ENDPOINT products_endpoint 
STATE = STARTED
AS HTTP(
	PATH = '/products',
	AUTHENTICATION = (INTEGRATED),
	PORTS = ( CLEAR ),
	SITE = 'localhost'
)
FOR SOAP (
	WEBMETHOD 'GetProductName'
		(name = 'AdventureWorks.dbo.GetProductName'),
	WSDL = DEFAULT,
	SCHEMA = STANDARD)

go

