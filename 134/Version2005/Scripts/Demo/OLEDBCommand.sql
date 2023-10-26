use DB134
go
if exists (select * from information_schema.tables where table_name = 'ProjectTeam')
drop table ProjectTeam
go
CREATE TABLE ProjectTeam 
(TeamMemberID INT PRIMARY KEY NOT NULL, 
TeamMemberName varchar(20) NOT NULL, 
TeamMemberAddress varchar(50))

go
--insert sample data
INSERT INTO ProjectTeam VALUES (456, 'CKangai', '456 Reston Pkwy')
INSERT INTO ProjectTeam VALUES (789, 'JOpiola', '789 Home Place')
