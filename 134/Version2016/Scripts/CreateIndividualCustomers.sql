
if exists (select * from information_schema.tables where table_name = 'IndividualCustomers')
drop table IndividualCustomers
go
create table IndividualCustomers 
(CustomerID INT
, FirstName nvarchar(50)
, LastName	nvarchar(50)
, Phone		nvarchar(25)
, Email		nvarchar(50)
, City		nvarchar(30)
, Country	nvarchar(50)
, TotalAmount money
)
go
bulk insert IndividualCustomers from 'c:\134\Scripts\IndividualCustomers.txt' 
with (datafiletype = 'widechar', fieldterminator = '\t', rowterminator = '\n')