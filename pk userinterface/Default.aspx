<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="lb_title" runat="server">Title</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_title" runat="server"></asp:TextBox>
&nbsp;
            <asp:ListBox ID="listbox_resutl" runat="server" style="z-index: 1; top:1px; position: absolute; height: 116px; width: 141px"></asp:ListBox>
            <br />
            <asp:LinkButton ID="lb_director" runat="server">Director</asp:LinkButton>
            &nbsp;<asp:TextBox ID="tb_director" runat="server"></asp:TextBox>
            <br />
            <asp:LinkButton ID="lb_grade" runat="server">Grade</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tb_grade" runat="server"></asp:TextBox>
            <br />
            <asp:LinkButton ID="lb_type" runat="server">Type</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_type" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
    </form>
</body>
</html>
