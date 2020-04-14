Imports System.Data
Imports System.Data.OleDb
Partial Class _Default
    Inherits System.Web.UI.Page
    Implements System.Web.UI.ICallbackEventHandler
    Dim S As String
    Dim i As Integer
    Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
        Dim Conn As OleDbConnection
        Dim Cmd As OleDbCommand
        Dim Rd As OleDbDataReader
        Dim SQL As String
        Dim a() As String
        a = eventArgument.Split(",")
        Conn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("dvd0330.mdb"))
        Conn.Open()
        If a(0) = 1 Then
            i = 1
            SQL = "select * from video where title='" & a(1) & "'"
            Cmd = New OleDbCommand(SQL, Conn)
            Rd = Cmd.ExecuteReader()
            If Rd.Read() Then
                S = Rd.Item(0) & "," & Rd.Item(1) & "," & Rd.Item(2) & "," & Rd.Item(3)
            End If
            Rd.Close()
        ElseIf a(0) = 2 Then
            SQL = "delete from video where title='" & a(1) & "'"
            Cmd = New OleDbCommand(SQL, Conn)
            Cmd.ExecuteNonQuery()
        ElseIf a(0) = 3 Then
            MsgBox(a(4))
            SQL = "insert into video(title,director,grade,type) values('" & a(1) & "','" & a(2) & "','" & a(3) & "','" & a(4) & "')"
            Cmd = New OleDbCommand(SQL, Conn)
            Cmd.ExecuteNonQuery()
        ElseIf a(0) = 4 Then
            SQL = "update video set director='" & a(2) & "',grade='" & a(3) & "',type='" & a(4) & "' where title='" & a(1) & "'"
            Cmd = New OleDbCommand(SQL, Conn)
            Cmd.ExecuteNonQuery()
        End If
        Conn.Close()
    End Sub
    Protected Overridable Function GetCallbackResult() As String _
    Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
        If i = 1 Then Return S
    End Function
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load
        Dim cbReference As String
        cbReference = Page.ClientScript.GetCallbackEventReference(Me, "", "", "")
    End Sub
End Class
