
if exists (select * from information_schema.tables where table_name = 'Publications')
drop table Publications
go
create table Publications
(titleID int not null
, Author varchar(61) NOT NULL
, City varchar(20) NULL 
, Phone char(12) NOT NULL
, Title varchar(80) NOT NULL
)
go
bulk insert Publications from 'c:\134\Scripts\Publications.txt' 
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n')