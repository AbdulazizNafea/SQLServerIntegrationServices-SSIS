select EmployeeID, FirstName, LastName, CurrentSalary AS Salary, HireDate 
from dbo.EmployeeDepartment for xml path('Employee'), ROOT('Employees')