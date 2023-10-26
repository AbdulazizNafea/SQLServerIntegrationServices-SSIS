        Dim topSalary As String, person As String, strMsg As String
        topSalary = Dts.Variables("TopSalary").Value.ToString
        person = trim(Dts.Variables("FullName").Value.ToString)
        strMsg = "Person: " & person
        strMsg += ControlChars.CrLf & "Salary: " & topSalary
        MsgBox(strMsg)
		