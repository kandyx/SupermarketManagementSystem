<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReceivePurchase.aspx.cs" Inherits="Pages_ReceivePurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView AlternatingRowStyle-BorderColor="ActiveBorder" AlternatingRowStyle-Wrap="true" AlternatingRowStyle-BackColor="Yellow" HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField DataField="purchaseId" HeaderText="purchaseId" SortExpression="purchaseId" />
                    <asp:BoundField DataField="createTime" HeaderText="createTime" SortExpression="createTime" />
                    <asp:BoundField DataField="completeTime" HeaderText="completeTime" SortExpression="completeTime" />
                    <asp:BoundField DataField="employeeId" HeaderText="employeeId" SortExpression="employeeId" />
                    <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                    <asp:TemplateField HeaderText="收货">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Update" OnClick="Button1_Click" Text="确认" CommandArgument='<%# Container.DataItemIndex + 1 %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="选择">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
