<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SellManagement.aspx.cs" Inherits="Pages_SellManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;<asp:Label ID="Label1" runat="server" Text="商品ID"></asp:Label>
&nbsp;<asp:TextBox ID="IDBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="searchButton" runat="server" OnClick="Button1_Click" style="height: 21px" Text="搜索" />
            <br />
        </div>
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="商品名称"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="商品价格"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="库存"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;</p>
        <p>
            &nbsp;
            <asp:Label ID="Label6" runat="server" Text="购买数量"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="添加" />
        </p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />

        <asp:Repeater ID="Repeater1" runat="server"   >
            <HeaderTemplate>

                    <table id="tablePrint" class="tbShow">

                        <tr class="th">
                            <td>商品ID</td>

                            <td >商品名称</td>

                            <td >价格</td>

                            <td >购买数量</td>

                            <td >总价</td>

                        </tr>

                </HeaderTemplate>
            <ItemTemplate>

                    <tr id="trIdrep" onmouseover="this.bgColor='#C4DFF7'" onmouseout="this.bgColor='#ffffff'">

                        <td >

   

                            <asp:TextBox ID="idx" runat="server" Text='<%#Eval("commodityId")%>'></asp:TextBox>

                        </td>

                        <td>

                            <asp:TextBox ID="userSchool" runat="server" Text='<%#Eval("commodityName")%>'></asp:TextBox></td>

                        <td>

                            <asp:TextBox ID="userClass" runat="server" Text='<%#Eval("buyPrice")%>'></asp:TextBox></td>
                         <td>

                            <asp:TextBox ID="TextBox5" runat="server" Text='<%#Eval("amount")%>'></asp:TextBox></td>
                          <td>

                            <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("sum")%>'></asp:TextBox></td>



                    </tr>

                </ItemTemplate>

                <FooterTemplate>


                    </table>

                </FooterTemplate>

        </asp:Repeater>

&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="提交" OnClick="Button2_Click" />

    </form>
</body>
</html>
