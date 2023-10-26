' Microsoft SQL Server Integration Services Script Task
' Write scripts using Microsoft Visual Basic
' The ScriptMain class is the entry point of the Script Task.

Imports System
Imports System.Data
Imports System.Math
Imports System.Xml
Imports Microsoft.SqlServer.Dts.Runtime

Public Class ScriptMain

	' The execution engine calls this method when the task executes.
	' To access the object model, use the Dts object. Connections, variables, events,
	' and logging features are available as static members of the Dts class.
	' Before returning from this method, set the value of Dts.TaskResult to indicate success or failure.
	' 
	' To open Code and Text Editor Help, press F1.
	' To open Object Browser, press Ctrl+Alt+J.

	Public Sub Main()
		'
		' Add your code here
        '
        MsgBox(Dts.Variables("CustomerName").Value.ToString)
		Dts.TaskResult = Dts.Results.Success
	End Sub

End Class
