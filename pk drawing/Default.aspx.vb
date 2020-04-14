Imports System.Data.OleDb
Partial Class _Default
    Inherits Page
    Implements ICallbackEventHandler
    Dim S As String
    Dim i As Integer
    Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements ICallbackEventHandler.RaiseCallbackEvent
        Dim Conn As OleDbConnection
        Dim Cmd As OleDbCommand
        Dim Rd As OleDbDataReader
        Dim SQL As String
        Dim a() As String
        a = eventArgument.Split(",")
        Conn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("dvd0407.mdb"))
        Conn.Open()
        If a(0) = 1 Then
            i = 1
            SQL = "select (select count(type) from video where type = '動作') AS Expr1, (select count(type) from video where type = '冒險') AS Expr2, (select count(type) from video where type = '恐怖驚悚') AS Expr3, (select count(type) from video where type = '卡通動畫') AS Expr4, (select count(type) from video where type = '恐怖喜劇') AS Expr5 FROM video; "
            Cmd = New OleDbCommand(SQL, Conn)
            Rd = Cmd.ExecuteReader()
            If Rd.Read() Then
                S = Rd.Item(0) & "," & Rd.Item(1) & "," & Rd.Item(2) & "," & Rd.Item(3) & "," & Rd.Item(4)
            End If
            Rd.Close()
        End If
        Conn.Close()
    End Sub
    Protected Overridable Function GetCallbackResult() As String _
    Implements ICallbackEventHandler.GetCallbackResult
        If i = 1 Then Return S
    End Function
    Private Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load, Me.Load
        Dim cbReference As String
        cbReference = Page.ClientScript.GetCallbackEventReference(Me, "", "", "")
    End Sub
End Class
