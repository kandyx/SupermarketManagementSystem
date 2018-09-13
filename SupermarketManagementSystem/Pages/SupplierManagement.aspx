<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplierManagement.aspx.cs" Inherits="Pages_SupplierManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
    
        &nbsp;&nbsp;&nbsp;
            
            <asp:SqlDataSource ID="supplierSqlDataSource" runat="server" ConnectionString="<%$ appSettings:connectionString %>" SelectCommand="SELECT * FROM [supplier]" DeleteCommand="DELETE FROM [supplier] WHERE [supplierId] = @original_supplierId" InsertCommand="INSERT INTO [supplier] ([supplierName], [phone]) VALUES (@supplierName, @phone)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [supplier] SET [supplierName] = @supplierName, [phone] = @phone WHERE [supplierId] = @original_supplierId">
                <DeleteParameters>
                    <asp:Parameter Name="original_supplierId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="supplierName" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="supplierName" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="original_supplierId" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>
    
    </div>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ListView ID="supplierListView" runat="server" DataKeyNames="supplierId" DataSourceID="supplierSqlDataSource" InsertItemPosition="LastItem"  >
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <AlternatingItemTemplate>
                     
                    <tr style="">
                        <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="supplierIdLabel" runat="server" Text='<%# Eval("supplierId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supplierNameLabel" runat="server" Text='<%# Eval("supplierName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                        
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                        <td>
                            <asp:Label ID="supplierIdLabel1" runat="server" Text='<%# Eval("supplierId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' /> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="姓名必须输入" ControlToValidate="supplierNameTextBox" Display="Static"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="电话必须输入" ControlToValidate="phoneTextBox" Display="Static"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="supplierIdLabel" runat="server" Text='<%# Eval("supplierId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supplierNameLabel" runat="server" Text='<%# Eval("supplierName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">supplierId</th>
                                        <th runat="server">supplierName</th>
                                        <th runat="server">phone</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>
                            <asp:Label ID="supplierIdLabel" runat="server" Text='<%# Eval("supplierId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="supplierNameLabel" runat="server" Text='<%# Eval("supplierName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            </p>
        &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        &nbsp;</form>
</body>
</html>
