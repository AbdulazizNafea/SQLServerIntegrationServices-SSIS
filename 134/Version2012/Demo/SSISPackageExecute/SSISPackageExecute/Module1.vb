Imports Microsoft.SqlServer.Dts.Runtime

Module Module1

    Sub Main()
        Dim oApp As New Application
        Dim oPackage As New Package
        Dim oResults As DTSExecResult
        Try
            oPackage = oApp.LoadPackage("c:\134\Data Migration\Data Migration\Package1.dtsx", Nothing)
            oResults = oPackage.Execute()
        Catch ex As Exception
            Console.WriteLine(ex.Message)
        Finally
            Console.WriteLine(oResults.ToString)
            Console.ReadLine()
        End Try
    End Sub

End Module
