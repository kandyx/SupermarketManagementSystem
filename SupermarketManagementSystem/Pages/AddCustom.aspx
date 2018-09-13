<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCustom.aspx.cs" Inherits="Pages_AddCustom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table style="width: 300px; background-color: #99ccff; margin: 0px auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="用户信息录入"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 300px; background-color: #99ccff; margin: 0px auto;">
                <tr>
                    <td>
                        姓名</td>
                    <td>
                        <asp:TextBox ID="customNameTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text="电话"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="phoneTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                </table>
            <table style="width: 300px; background-color: #99ccff; margin: 0px auto;">
                <tr>
                    <td>
                        <asp:Button ID="AddButton" runat="server" Text="添加" OnClick="AddButton_Click" />
                    </td>
                </tr>
                                <tr>
                    <td style="width: 1000px">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Pages/CustomManagement.aspx">返回到上一页面</asp:LinkButton></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
