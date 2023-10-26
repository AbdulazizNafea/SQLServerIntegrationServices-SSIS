
if  exists (select * from information_schema.routines where specific_name = 'HighestSalaryByDivisionByGender')
drop proc HighestSalaryByDivisionByGender
go
create proc HighestSalaryByDivisionByGender 
(@DivisionID int, @Gender char(1), @Salary money OUTPUT, @Employee varchar(255) OUTPUT)
as 
select top(1) @Employee = FirstName + ' ' + LastName , @Salary = cast(CurrentSalary as float)
from EmployeeDepartment where DivisionID = @DivisionID and Gender = @Gender 
order by CurrentSalary desc
go