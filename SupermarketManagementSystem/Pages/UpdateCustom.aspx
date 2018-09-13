<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCustom.aspx.cs" Inherits="Pages_UpdateCustom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 300px;
            height: 59px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table style="width: 300px; background-color: #99ccff; margin: 0px auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="用户信息更新"></asp:Label>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 300px; background-color: #99ccff; margin: 0px auto;">
                <tr>
                    <td>
                        <asp:Label ID="userNameLabel" runat="server" Text="姓名"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID= "customNameTextBox" runat="server"></asp:TextBox>
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
        </div>
            <table style="background-color: #99ccff; margin: 0px auto;" class="auto-style1">
                <tr>
                    <td>
                        &nbsp;
                        <asp:Button ID="UpdataButton" runat="server" Text="更新" OnClick="UpdataButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Pages/CustomManagement.aspx">返回到上一页面</asp:LinkButton>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
