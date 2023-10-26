	IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'FileList')
	DROP TABLE FileList
	GO
CREATE TABLE FileList
	(FileFolder nvarchar(255), FileName nvarchar(255))
