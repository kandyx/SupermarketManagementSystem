<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="Pages_AddEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <h1>
            <asp:Label ID="Label2" runat="server" Text="增加ID"></asp:Label>
            </h1>
            <br />
            <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="账户："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="密码："></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" />
        </div>
    </form>
</body>
</html>
