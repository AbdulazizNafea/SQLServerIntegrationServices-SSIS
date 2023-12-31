Public Class ScriptMain
    Inherits UserComponent
    Dim strCountry As String = "", intCounter As Integer = 0

    Public Overrides Sub Input0_ProcessInput(ByVal Row As Input0Buffer)
        While Row.NextRow
            If Buffer.Country <> strCountry Then
                intCounter = 1
                strCountry = Buffer.Country
                AggregatedRowsBuffer.AddRow()
                AggregatedRowsBuffer.Country = strCountry
                AggregatedRowsBuffer.FirstName = Row.FirstName
                AggregatedRowsBuffer.LastName = Row.LastName
                AggregatedRowsBuffer.Email = Row.Email
                AggregatedRowsBuffer.TotalAmount = Row.TotalAmount
            ElseIf intCounter < 20 Then
                strCountry = Row.Country
                intCounter = intCounter + 1
                AggregatedRowsBuffer.AddRow()
                AggregatedRowsBuffer.Country = strCountry
                AggregatedRowsBuffer.FirstName = Row.FirstName
                AggregatedRowsBuffer.LastName = Row.LastName
                AggregatedRowsBuffer.Email = Row.Email
                AggregatedRowsBuffer.TotalAmount = Row.TotalAmount
            End If
        End While

        If Row.EndOfRowset Then
            AggregatedRowsBuffer.SetEndOfRowset()
        End If
    End Sub

End Class