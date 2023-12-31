
if  exists (select * from information_schema.routines where specific_name = 'procUpdateTeam')
drop proc procUpdateTeam
go
create proc [dbo].[procUpdateTeam](
					  @opcode char(1)
					, @TeamMemberid int
					, @name varchar(20)
					, @address varchar(50)

)
as 
if @opcode = 'I'
	insert into ProjectTeam (TeamMemberID, TeamMemberName, TeamMemberAddress)
			 values (@TeamMemberid, @name, @address)
if @opcode = 'D'
	delete from ProjectTeam  where TeamMemberID = @TeamMemberid
if @opcode = 'U'
	update ProjectTeam  set TeamMemberName = @name, TeamMemberAddress = @address 
	where TeamMemberID = @TeamMemberID 

go
