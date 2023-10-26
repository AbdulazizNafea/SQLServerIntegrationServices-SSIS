if exists (select * from information_schema.tables where table_name = 'authors')
drop table dbo.authors
go
CREATE TABLE [dbo].[authors] (
	[au_id] char(11) NOT NULL ,
	[au_lname] [varchar] (40)  NOT NULL ,
	[au_fname] [varchar] (20)  NOT NULL ,
	[phone] [char] (12)  NOT NULL ,
	[address] [varchar] (40)  NULL ,
	[city] [varchar] (20)  NULL ,
	[state] [char] (2)  NULL ,
	[zip] [char] (5)  NULL ,
	[contract] [bit] NOT NULL 
) 
go