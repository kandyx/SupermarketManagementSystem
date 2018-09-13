<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PurchaseManagement.aspx.cs" Inherits="Pages_PurchaseManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
        </asp:Repeater>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="添加订单" />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="回到首页" />
        <br />
    </div>
    </form>
</body>
</html>
