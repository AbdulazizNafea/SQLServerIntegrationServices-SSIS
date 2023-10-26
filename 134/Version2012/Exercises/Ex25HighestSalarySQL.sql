select top(1) FirstName + ' ' + LastName AS Employee, cast(CurrentSalary as float) as Salary 
from EmployeeDepartment where DivisionID = ? and Gender = ?
order by CurrentSalary desc