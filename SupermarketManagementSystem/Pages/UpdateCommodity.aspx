<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCommodity.aspx.cs" Inherits="Pages_UpdateCommodity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style3
        {
            font-size: x-large;
        }
        .style1
        {
            width: 73%;
        }
        .style2
        {
            width: 107px;
        }
        .style4
        {
            width: 107px;
            height: 27px;
        }
        .style5
        {
            height: 27px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 修改商品信息</span><br 
            class="style3" />
        </strong>
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="商品名"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="商品名不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="类别"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="类别不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="Label3" runat="server" Text="销售价格"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="请输入正确的价格" 
                        MaximumValue="9999999999" MinimumValue="0"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="价格不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="style2">
                    <asp:Label ID="Label4" runat="server" Text="采购价格"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="请输入正确的价格" 
                        MaximumValue="9999999999" MinimumValue="0"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="价格不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label5" runat="server" Text="数量"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="请输入正确的数量" 
                        ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="数量不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    供应商</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="supplierName" 
                        DataValueField="supplierId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ appSettings:connectionString %>" 
                        SelectCommand="SELECT [supplierId], [supplierName] FROM [supplier]">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="保存" 
            style="height: 27px" />
    
    </div>
    </form>
</body>
</html>
