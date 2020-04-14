<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Ajax Example2</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" 
            style="z-index: 1; left: 31px; top: 92px; position: absolute; height: 22px; width: 41px;" 
            Text="導演"></asp:Label>
    <asp:TextBox ID="NameTxt" runat="server" Style="left: 81px; position: absolute;top: 62px;Height:20px;Width:100px"></asp:TextBox>
    <asp:TextBox ID="DireactorTxt" runat="server" Style="left: 81px; position: absolute;top: 92px;Height:20px;Width:100px"></asp:TextBox>
        <asp:TextBox ID="GradeTxt" runat="server" style="z-index: 1; left: 79px; top: 136px; position: absolute; width: 105px; height: 21px; "></asp:TextBox>
        <asp:Label ID="Label3" runat="server" 
            style="z-index: 1; left: 30px; top: 61px; position: absolute; height: 1px; bottom: 507px;" 
            Text="片名"></asp:Label>
    </div>

    &nbsp;<input type="button"  value="查詢" onclick="Query_Click()" style="Z-INDEX: 306; LEFT: 254px; POSITION: absolute; TOP: 92px;Height:30px;Width:64px; right: 232px;" id="Query"/>   
    <input type="button"  value="刪除" onclick="Delete_Click()" style="Z-INDEX: 306; LEFT: 334px; POSITION: absolute; TOP: 92px;Height:30px;Width:64px" id="Delete"/>
    <input type="button"  value="新增" onclick="Insert_Click()" style="Z-INDEX: 306; LEFT: 414px; POSITION: absolute; TOP: 92px;Height:30px;Width:64px; right: 1057px;" id="Insert"/>
    <input type="button"  value="修改" onclick="Update_Click()" style="Z-INDEX: 306; LEFT: 494px; POSITION: absolute; TOP: 92px;Height:30px;Width:64px" id="Update"/>
    <asp:Label ID="Label1" runat="server" 
        style="z-index: 1; left: 26px; top: 138px; position: absolute; width: 43px; bottom: 411px;" Text="分級"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 26px; top: 173px; position: absolute; width: 40px" Text="類型"></asp:Label>
        <p>
            <asp:TextBox ID="Typetxt" runat="server" style="z-index: 1; left: 79px; top: 176px; position: absolute; width: 109px"></asp:TextBox>
        </p>
    </form>

    </body>
</html>
<script type="text/javascript" language="javascript">
    function Update_Click() {
        WebForm_DoCallback('__Page', '4' + ',' + document.all.NameTxt.value + ',' + document.all.DireactorTxt.value + ',' + document.all.GradeTxt.value + ',' + document.all.Typetxt.value, null, "", null, false);
    }
    function Insert_Click() {
        WebForm_DoCallback('__Page', '3' + ',' + document.all.NameTxt.value + ',' + document.all.DireactorTxt.value + ',' + document.all.GradeTxt.value + ',' + document.all.Typetxt.value, null, "", null, false);
    }
    function Delete_Click() {
        WebForm_DoCallback('__Page', '2' + ',' + document.all.NameTxt.value, null, "", null, false);
    }
    function Query_Click() {
        WebForm_DoCallback('__Page', '1' + ',' + document.all.NameTxt.value, RSD, "", null, false);
    }
    function RSD(DFS) {
        var a = DFS.split(",");
        document.all.DireactorTxt.value = a[1];
        document.all.GradeTxt.value = a[2];
        document.all.Typetxt.value = a[3];

    }
</script>
