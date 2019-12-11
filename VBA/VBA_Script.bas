Attribute VB_Name = "Module1"
Sub domyhomework()
    Dim ws As Worksheet
    Dim lastrow As Long
    Dim currentTicker As String
    Dim volumeCount As Double
    Dim tickerOffset As Long
    Dim openValue As Long
        
    For Each ws In ActiveWorkbook.Worksheets
        'Set the variables to track the worksheet
        lastrow = ws.Cells(Rows.Count, "A").End(xlUp).Row
        currentTicker = ws.Cells(2, 1).Value
        volumeCount = ws.Cells(2, 7).Value
        openValue = ws.Cells(2, 3).Value
        tickerOffset = 2
        
        For x = 2 To lastrow
            If ws.Cells(x, 1).Value = currentTicker Then
                'Add to the volume counte if the row is still the same ticker
                volumeCount = volumeCount + ws.Cells(x, 7).Value
            Else
                'If the row is a new ticker, record the last ticker's information
                ws.Cells(tickerOffset, 9).Value = currentTicker
                ws.Cells(tickerOffset, 10).Value = ws.Cells(x - 1, 6).Value - openValue
                'Format the cells to reflect positive or negative change
                If ws.Cells(tickerOffset, 10).Value > 0 Then
                    ws.Cells(tickerOffset, 10).Interior.Color = RGB(156, 204, 101)
                Else
                    ws.Cells(tickerOffset, 10).Interior.Color = RGB(244, 67, 54)
                End If
                ws.Cells(tickerOffset, 10).Font.Color = RGB(255, 255, 255)
                ws.Cells(tickerOffset, 10).Font.Bold = True
                'Don't divide by Zero. BTW how can a stock be worth nothing? How do you buy at the price of free?
                If openValue = 0 Then
                    ws.Cells(tickerOffset, 11).Value = "-"
                    ws.Cells(tickerOffset, 11).HorizontalAlignment = xlCenter
                Else
                    ws.Cells(tickerOffset, 11).Value = FormatPercent(ws.Cells(x - 1, 6).Value / openValue)
                End If
                ws.Cells(tickerOffset, 12).Value = volumeCount
                'Reset the tracking variables to start tracking the new ticker
                currentTicker = ws.Cells(x, 1).Value
                volumeCount = ws.Cells(x, 7).Value
                openValue = ws.Cells(x, 3).Value
                tickerOffset = tickerOffset + 1
                
            End If
            
        Next x
        'Set the headers
        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Total Change"
        ws.Cells(1, 11).Value = "Percent Change"
        ws.Cells(1, 12).Value = "Total Volume"
        
    Next ws

End Sub


