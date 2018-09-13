<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPurchase.aspx.cs" Inherits="Pages_AddPurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="commodityId" DataSourceID="SqlDataSource1" EnableTheming="True" >
            <Columns>
                <asp:BoundField DataField="commodityId" HeaderText="commodityId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="commodityId" />
                <asp:BoundField DataField="commodityName" HeaderText="commodityName" 
                    SortExpression="commodityName" />
                <asp:BoundField DataField="category" HeaderText="category" 
                    SortExpression="category" />
                <asp:BoundField DataField="sellPrice" HeaderText="sellPrice" 
                    SortExpression="sellPrice" />
                <asp:BoundField DataField="buyPrice" HeaderText="buyPrice" 
                    SortExpression="buyPrice" />
                <asp:BoundField DataField="amount" HeaderText="amount" 
                    SortExpression="amount" />
                <asp:BoundField DataField="supplierId" HeaderText="supplierId" 
                    SortExpression="supplierId" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:commodity %>" 
            SelectCommand="SELECT * FROM [commodity]"></asp:SqlDataSource>
    
        <br />
        &nbsp;<br />
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="commodityId" EnableTheming="True" 
            onrowcancelingedit="GridView2_RowCancelingEdit" 
            onrowdeleting="GridView2_RowDeleting" onrowediting="GridView2_RowEditing" 
            onrowupdating="GridView2_RowUpdating" ShowHeaderWhenEmpty="True">
            <Columns>
             <asp:CommandField ButtonType="Button" HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                
              
                <asp:TemplateField HeaderText="commodityId" SortExpression="commodityId">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="commodityId" 
                            DataValueField="commodityId">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("commodityId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="amount" HeaderText="amount" 
                    SortExpression="amount" />
     
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text="商品ID"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="commodityId" 
            DataValueField="commodityId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:commodity %>" 
            SelectCommand="SELECT [commodityId] FROM [commodity]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="Label2" runat="server" Text="预采购数量"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
    
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="提交" />
    
    </div>
    </form>
</body>
</html>
