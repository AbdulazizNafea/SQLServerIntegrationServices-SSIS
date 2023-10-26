
if exists (select * from information_schema.tables where table_name = 'SpecialGiftCustomers')
drop table SpecialGiftCustomers
go

CREATE TABLE [SpecialGiftCustomers] (
    [Country] NVARCHAR(50),
    [FirstName] NVARCHAR(50),
    [LastName] NVARCHAR(50),
    [Email] NVARCHAR(50),
    [TotalAmount] MONEY
)
go