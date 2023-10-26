if exists (select * from information_schema.tables where table_name= 'BlobData')
drop table dbo.BlobData
go
create table dbo.BlobData
(PictureID int identity (1,1), FilePath varchar(50),Picture varbinary(max))
go