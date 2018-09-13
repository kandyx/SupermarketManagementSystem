<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeManagement.aspx.cs" Inherits="Pages_EmployeeManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form" runat="server">
        <div>
            <h1>员工信息管理界面</h1>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="employeeId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="employeeId" SortExpression="employeeId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Bind("employeeId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("employeeId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="employeeName" HeaderText="employeeName" SortExpression="employeeName" />
                    <asp:TemplateField HeaderText="roleId" SortExpression="roleId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roleId" DataValueField="roleId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SupermarketManagementDBConnectionString %>" SelectCommand="SELECT [roleId] FROM [role]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("roleId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="account" HeaderText="account" SortExpression="account" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:CommandField ButtonType="Button" HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="Label7" runat="server" Text="查找姓名："></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="确认" />
            <br />
&nbsp;<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField HeaderText="employeeId" SortExpression="employeeId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("employeeId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("employeeId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="employeeName" HeaderText="employeeName" SortExpression="employeeName" />
                    <asp:TemplateField HeaderText="roleId" SortExpression="roleId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="roleId" DataValueField="roleId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SupermarketManagementDBConnectionString %>" SelectCommand="SELECT [roleId] FROM [role]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("roleId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:BoundField DataField="account" HeaderText="account" SortExpression="account" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:CommandField ButtonType="Button" HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="添加员工" />
            <br />
        </div>
    </form>
</body>
</html>
