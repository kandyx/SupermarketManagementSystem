<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomManagement.aspx.cs" Inherits="Pages_CustomManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table style="width: 1000px; margin: 0px auto;">
                <tr>
                    <td>
                        <asp:TextBox ID="customIdTextBox" runat="server"></asp:TextBox>
                        <asp:Button ID="selectButton" runat="server" Text="搜索" OnClick="selectButton_Click" />
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px">
                        <asp:Repeater ID="customrepeater" runat="server" Visible="False">
                            <HeaderTemplate>
                                <table border="1" style="width: 1000px; text-align: center; border-collapse: collapse;">
                                    <thead style="background-color: Teal;">
                                        <tr>
                                            <th>ID</th>
                                            <th>姓名</th>
                                            <th>电话</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Panel ID="plItem" runat="server">
                                    <tr>
                                        <td><%#Eval("customId") %></td>
                                        <td><%#Eval("customName") %></td>
                                        <td><%#Eval("phone") %></td>
                                    </tr>
                                </asp:Panel>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td style="width: 1000px">
                        <asp:Button ID="Updata" runat="server" Text="编辑" BackColor="Teal" OnClick="Updata_Click" Visible="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Delete" runat="server" Text="删除" BackColor="Teal" OnClick="Delete_Click" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 1000px">
                        <asp:Button ID="Add" runat="server" Text="添加" BackColor="Teal" OnClick="Add_Click" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 1000px">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Pages/Default.aspx">返回到上一页面</asp:LinkButton></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
