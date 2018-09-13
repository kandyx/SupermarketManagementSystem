<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pages_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form" runat="server">
        <div>
            <asp:HyperLink ID="employeeManagementLink" runat="server" NavigateUrl="~/Pages/EmployeeManagement.aspx">员工管理</asp:HyperLink>
            <asp:HyperLink ID="customManagementLink" runat="server" NavigateUrl="~/Pages/CustomManagement.aspx">会员管理</asp:HyperLink>
            <asp:HyperLink ID="commodityManagementLink" runat="server" NavigateUrl="~/Pages/CommodityManagement.aspx">商品管理</asp:HyperLink>
            <asp:HyperLink ID="purchaseManagementLink" runat="server" NavigateUrl="~/Pages/PurchaseManagement.aspx">采购管理</asp:HyperLink>
            <asp:HyperLink ID="repertoryManagementLink" runat="server" NavigateUrl="~/Pages/SellManagement.aspx">库存管理</asp:HyperLink>
            <asp:HyperLink ID="supplierManagementLink" runat="server" NavigateUrl="~/Pages/SupplierManagement.aspx">供货商管理</asp:HyperLink>
        </div>
    </form>
</body>
</html>
