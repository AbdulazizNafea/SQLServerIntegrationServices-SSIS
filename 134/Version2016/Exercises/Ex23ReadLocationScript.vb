        Dim location As String,  oStream As New System.IO.StreamReader("*****") 'Todo: 1
        Dim infoString As String
        location = oStream.ReadLine
        oStream.Close()
        ************= location                  'Todo: 2
        infoString = "Location: " & location
        infoString = infoString & ControlChars.CrLf & "User name: " & ************     'Todo: 3
        infoString = infoString & ControlChars.CrLf & "Machine name: " & Dts.Variables("MachineName").Value.ToString
        infoString = infoString & ControlChars.CrLf & "Package name: " & Dts.Variables("PackageName").Value.ToString
        infoString = infoString & ControlChars.CrLf & "Start time: " & Dts.Variables("StartTime").Value.ToString
        Dts.Variables("InfoToWrite").Value = infoString