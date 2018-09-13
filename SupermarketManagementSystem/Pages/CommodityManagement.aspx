<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommodityManagement.aspx.cs" Inherits="Pages_CommodityManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:14px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
 
<!-- Table goes in the document BODY -->


</head>
<body>
    <h2>&nbsp;查看、修改、删除商品信息</h2>
    <form id="form1" runat="server">
    <div>
    <table class="gridtable">
            <thead>
                <tr>
                        <th>商品编号</th>                  
                        <th>商品名</th>            
                        <th>类别</th>                    
                        <th>销售价格</th>                  
                        <th>采购价格</th>                     
                        <th>数量</th>
                        <th>供应商名称</th>
                        <th>状态</th>
                        <th>删除</th>
                        <th>修改</th>
                </tr>
            </thead>
           <asp:Repeater ID="ratTable"  runat="server">
               <ItemTemplate>           
                   <tr>
                        <td><%#Eval("commodityId")%> </td>
                        <td><%#Eval("commodityName")%></td>
                        <td><%#Eval("category")%></td>
                        <td><%#Eval("sellPrice", "{0:f2}")%></td>
                        <td><%#Eval("buyPrice", "{0:f2}")%></td>
                        <td><%#Eval("amount")%></td>
                        <td><%#Eval("supplierName")%></td>
                        <td><div id="<%#Eval("commodityId")%>">未知</div><script type="text/javascript">
                                                    var x = "<%#Eval("amount")%>";
                                                    if (x == "0") {
                                                        x = "缺货";
                                                    }
                                                    else
                                                    {
                                                        x = "正常";
                                                    }
                                                    document.getElementById("<%#Eval("commodityId")%>").innerHTML = x;</script></td>
                        <td><asp:CheckBox ID="cdDelete" ToolTip='<%#Eval("commodityId")%>' Text="" runat="server"/></td>
                        <td><input type="button" value="修改" onclick="javascript:location.href='UpdateCommodity.aspx?commodityId=<%#Eval("commodityId")%>&commodityName=<%#Eval("commodityName")%>&category=<%#Eval("category")%>&sellPrice=<%#Eval("sellPrice", "{0:f2}")%>&buyPrice=<%#Eval("buyPrice", "{0:f2}")%>&amount=<%#Eval("amount")%>&supplierId=<%#Eval("supplierId")%>'" /></td>
                   </tr>                                            
               </ItemTemplate>
           </asp:Repeater>
        </table>

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="返回到添加页面" />
        &nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="删除选中项" />
        <br />

    </div>
    </form>
</body>
</html>
