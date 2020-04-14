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
            <!-- 設定gridview的datasource，TemplateField是放元件的欄位，ItemTemplate是平常顯示時的欄位，EditItemTemplate是編輯時的欄位-->
            <asp:AccessDataSource ID="data" runat="server" SelectCommand ="SELECT * FROM [video]" DataFile ="~/App_Data/dvd0330.mdb"></asp:AccessDataSource>
            <asp:GridView ID="GridView1" runat="server" CellPadding="3"  BackColor="White" BorderColor="#003300" BorderStyle="Groove" BorderWidth="3px" DataSourceID ="data"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowDeleting ="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating"
                AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="5" >
                <Columns>
                    <asp:TemplateField>  
                        <ItemTemplate>  
                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  </br></br>
                            <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete"/>  </br></br>
                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>   
                        </EditItemTemplate>  
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">  
                        <ItemTemplate>  
                            <asp:Label ID="id" runat="server" Text='<%#Eval("vno") %>'></asp:Label>  
                        </ItemTemplate>  
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Picture">  
                        <ItemTemplate>  
                            <asp:Image ID="picture" ImageUrl='<%# Eval("picture","~/img/{0}") %>' runat="server"></asp:Image>
                        </ItemTemplate>  
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload2" runat="server" />
                        </EditItemTemplate> 
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Title">  
                        <ItemTemplate>  
                            <asp:Label ID="lb_title" runat="server" Text='<%#Eval("title") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_title" runat="server" Text='<%#Eval("title") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Director">  
                        <ItemTemplate>  
                            <asp:Label ID="lb_director" runat="server" Text='<%#Eval("director") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_director" runat="server" Text='<%#Eval("director") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Grade">  
                        <ItemTemplate>  
                            <asp:Label ID="lb_grade" runat="server" Text='<%#Eval("grade") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:DropDownList ID="list_grade" runat="server" DataSourceID="grade_db" DataTextField="grade" DataValueField="grade"  SelectedValue='<%#Eval("grade")%>' >
                            </asp:DropDownList>
                        </EditItemTemplate>  
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Type">  
                        <ItemTemplate>  
                            <asp:Label ID="lb_type" runat="server" Text='<%#Eval("type") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_type" runat="server" Text='<%#Eval("type") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Trailer">  
                        <ItemTemplate>  
                            <asp:HyperLink runat="server" ID="trailer"  Text='<%# Eval("trailer") %>'  NavigateUrl='<%# Eval("trailer") %>' Target="_blank"></asp:HyperLink>
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_trailer" runat="server" Text='<%#Eval("trailer") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField> 
               </Columns>
                <EmptyDataRowStyle BackColor="#FFCCFF" Font-Bold="True" ForeColor="Red" />
                <HeaderStyle BackColor="#9999FF" BorderColor="#99CCFF" />
                <RowStyle BackColor="#99CCFF" BorderColor="#99FFCC" />
        </asp:GridView>
            <asp:AccessDataSource ID="grade_db" runat="server" DataFile="~/App_Data/dvd0330.mdb" SelectCommand="SELECT [grade] FROM [videograde]"></asp:AccessDataSource>
            <br />
        </div>
    </form>
</body>
</html>
