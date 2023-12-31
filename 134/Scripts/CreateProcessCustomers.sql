
if exists (select * from information_schema.routines where specific_name = 'ProcessCustomers')
drop proc ProcessCustomers
go
CREATE proc [dbo].[ProcessCustomers](
					  @opcode char(1)
					, @customerid int
					, @name varchar(20)
					, @address varchar(50)

)
as 
if @opcode = 'I'
	insert into CustomerMaintenance(CustomerID, CustomerName, CustomerAddress)
			 values (@customerid, @name, @address)
if @opcode = 'D'
	delete from CustomerMaintenance where CustomerID = @customerid
if @opcode = 'U'
	update CustomerMaintenance set CustomerName = @name, CustomerAddress = @address 
	where CustomerID = @CustomerID 
go