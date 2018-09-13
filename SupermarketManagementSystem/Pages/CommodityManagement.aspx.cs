using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_CommodityManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string SqlStr = ConfigurationManager.AppSettings["connectionString"];//连接本地的SQL Server数据
            SqlConnection conn = new SqlConnection(SqlStr);                  //实例化SQLConnection对象进行连接数据
            string sqlstr = "SELECT\n" +
"	dbo.commodity.commodityId,\n" +
"	dbo.commodity.commodityName,\n" +
"	dbo.commodity.category,\n" +
"	dbo.commodity.sellPrice,\n" +
"	dbo.commodity.buyPrice,\n" +
"	dbo.commodity.amount,\n" +
"	dbo.commodity.supplierId,\n" +
"	dbo.supplier.supplierId,\n" +
"	dbo.supplier.supplierName,\n" +
"	dbo.supplier.phone \n" +
"FROM\n" +
"	dbo.commodity\n" +
"	INNER JOIN dbo.supplier ON dbo.commodity.supplierId = dbo.supplier.supplierId";//定义SQL查询语句用于查询表数据
            SqlCommand myCmd = new SqlCommand(sqlstr, conn);
            DataSet ds = new DataSet();//定义dataset对象
            conn.Open();//打开数据库
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
            conn.Close();
            da.Fill(ds);
            ratTable.DataSource = ds.Tables[0];
            ratTable.DataBind();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCommodity.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //遍历repeater控件的itemtemplate模版
        int a = ratTable.Items.Count;
        foreach (RepeaterItem item in ratTable.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("cdDelete"); //根据控件id获得控件对象，cdDelete是checkBox控件的id
            if (cb.Checked == true)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from commodity where commodity.commodityId = '" + cb.ToolTip + "'", conn);
                try
                {
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                catch (SqlException)
                {
                    conn.Close();
                    Response.Write("<script>alert('删除失败');</script>");
                }
            }
        }
        Response.Redirect("CommodityManagement.aspx");

    }
}