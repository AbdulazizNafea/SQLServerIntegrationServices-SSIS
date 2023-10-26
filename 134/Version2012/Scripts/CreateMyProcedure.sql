create proc MyProcedure (@DivisionID int, @DepartmentID int , @AverageSalary  Money OUTPUT) as
  select @AverageSalary = AVG(CurrentSalary) FROM EmployeeDepartment 
  WHERE DivisionID = @DivisionID AND DepartmentID = @DepartmentID
  return 0