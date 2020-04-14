<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <div> 
            <asp:Label ID="Label1" runat="server" Text="Title :" Width="100px"></asp:Label>
            <asp:TextBox ID="title_TB" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Director :" Width="100px"></asp:Label>
            <asp:TextBox ID="Director_TB" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Grade :" Width="100px"></asp:Label>
            <!-- 
                dropdownlist連結到database，DataTextField是把資料表裡面的某個資料欄位設為選項名稱
                DataValueField每個選項所代表的某個資料欄位
                -->
            <asp:DropDownList ID="grade_DropDownList" runat="server" DataSourceID="grade_db" DataTextField="grade" DataValueField="grade" >
            </asp:DropDownList>
             <!-- 
             sqldatasource是連接資料庫的元件，connectionstring是連接資料庫的字串，SelectCommand是從資料庫裡取得資料的指令
             -->
            <asp:SqlDataSource ID="grade_db" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\dvd0407.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [grade] FROM [videograde]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Type :" Width="100px"></asp:Label>
            <asp:DropDownList ID="type_DropDownList" runat="server" DataSourceID="type_db" DataTextField="type" DataValueField="type">
            </asp:DropDownList>
            <asp:SqlDataSource ID="type_db" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\dvd0407.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [type] FROM [videotype]"></asp:SqlDataSource>
            <br />
        </div>
        <div>
            <br />
            <!-- 
             利用placeholder放查詢資料結果，由後端動態填入元件
             -->
            <asp:PlaceHolder ID="result_placeholder" runat="server"></asp:PlaceHolder>
        </div>
        <div>
             <br />
            <asp:Button ID="add_btn" runat="server" Text="新增" OnClick="add_btn_Click" />
&nbsp;
            <asp:Button ID="modify_btn" runat="server" Text="修改" OnClick="modify_btn_Click" />
&nbsp;
            <asp:Button ID="search_btn" runat="server" Text="查詢" OnClick="search_btn_Click" />
&nbsp;
            <asp:Button ID="del_btn" runat="server" Text="刪除" OnClick="del_btn_Click" />

        </div>
    </form>
</body>
</html>
