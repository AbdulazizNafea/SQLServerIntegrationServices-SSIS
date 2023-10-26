		'
		' Add your code here
        '
        Dim fileName As String = "c:\134\Exercises\Ex25xmlEmployees.xml"
        Dim oStreamWriter As New IO.StreamWriter(fileName)
        Dim fileContents As String = ************  'Todo here
        Try
            oStreamWriter.Write(fileContents)
        Catch ex As Exception
            MsgBox(ex.Message)
            Dts.TaskResult = ScriptResults.Failure
            Return

        End Try
        oStreamWriter.Close()
		