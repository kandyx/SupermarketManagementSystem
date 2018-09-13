using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_PurchaseManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            bindItemList();
        }
    }
    void bindItemList()
    {
        //建立数据库连接对象
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectiongString"]);
        //打开连接
        conn.Open();
        //建立从数据库中获取数据的命令
        SqlCommand cmd = new SqlCommand("select * from purchase", conn);
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds, "purchase");
        conn.Close();
        Repeater1.DataSource = ds.Tables["purchase"].DefaultView;
        Repeater1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        /* DateTime now = DateTime.Now;
         //建立数据库连接对象
         SqlConnection conn = new SqlConnection("Server=.\\SQLEXPRESS;database=SupermarketManagementDB;uid=sa;pwd=123456;");
         //打开连接
         conn.Open();
         //建立从数据库中获取数据的命令
         SqlCommand cmd = new SqlCommand("insert into purchase(createTime) values(@createTime)", conn);
         cmd.Parameters.Add("@createTime", SqlDbType.DateTime).Value = now;
         SqlCommand cmd2 = new SqlCommand("select purchaseId from purchase where createTime=@createTime", conn);
         cmd2.Parameters.Add("@createTime", SqlDbType.DateTime).Value = now;
         int purchaseId=(int)cmd2.ExecuteScalar();
         conn.Close();*/
        Response.Redirect("AddPurchase.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("PurchaseManagement.aspx");
    }
}