Imports Microsoft.SqlServer.Dts.Runtime

Module Module1

    Sub Main()
        Dim oApp As New Microsoft.SqlServer.Dts.Runtime.Application
        Dim oPackage As New Microsoft.SqlServer.Dts.Runtime.Package
        Dim oResults As Microsoft.SqlServer.Dts.Runtime.DTSExecResult
        oPackage = oApp.LoadPackage("C:\134\Demo\DataMigration\DataMigration\Ch4ImportBlob.dtsx", Nothing)
        oResults = oPackage.Execute()
        Console.WriteLine(oResults.ToString)
        Console.ReadLine()
    End Sub

End Module
