Imports Microsoft.SqlServer.Dts.DtsClient

Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        '**************Read data from a datareader object***************
        Dim MyReader As IDataReader, strResult As String
        Dim dtsConn As New DtsConnection()
        dtsConn.ConnectionString = "/File C:\134\Demo\DataMigration\DataMigration\Ch4Blob.dtsx"
        dtsConn.Open()
        Dim SSISCommand As New DtsCommand()
        SSISCommand.CommandText = "DReader"
        SSISCommand.Connection = dtsConn

        MyReader = SSISCommand.ExecuteReader(CommandBehavior.SequentialAccess)
        While MyReader.Read()
            strResult = MyReader.Item(0).ToString
            MsgBox(strResult)
        End While
        MyReader.Close()
    End Sub
End Class
