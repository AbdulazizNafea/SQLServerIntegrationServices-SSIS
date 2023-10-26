
if exists (select * from information_schema.tables where table_name = 'SpreadsheetFiles')
drop table SpreadsheetFiles
go
create table SpreadsheetFiles
(FileID int identity(1,1), FileFolder nvarchar(255), [FileName] nvarchar(255)
, FileData varbinary(max))
go

