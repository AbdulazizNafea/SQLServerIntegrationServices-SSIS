        Dim FileReader As DataTableReader, FileTable As DataTable
        Try
            Dim strFileSystem As String, strFreeSpace As String, strSize As String, strMsg As String
            FileTable = CType(Dts.Variables("DiskInfo").Value, DataTable)
            FileReader = FileTable.CreateDataReader()
            While FileReader.Read
                strFileSystem = FileReader("FileSystem").ToString
                strSize = FileReader("Size").ToString
                strFreeSpace = FileReader("FreeSpace").ToString
                strMsg = "File system: " & strFileSystem & vbCrLf
                strMsg += "Disk size: " & strSize & vbCrLf
                strMsg += "Free space: " & strFreeSpace
                MsgBox(strMsg)
            End While
        Catch ex As Exception
            MsgBox(ex.Message)
            Dts.TaskResult = ScriptResults.Failure
            Return
        End Try
        FileReader.Close()