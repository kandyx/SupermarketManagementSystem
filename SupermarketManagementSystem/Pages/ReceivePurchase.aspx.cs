using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_ReceivePurchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    void Bind()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        SqlDataAdapter cmd = new SqlDataAdapter("select * from purchase", conn);
        DataSet ds = new DataSet();
        cmd.Fill(ds, "purchase");
        GridView1.DataSource = ds.Tables["purchase"].DefaultView;
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "True")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            SqlCommand cmd = new SqlCommand("update purchase set state=  where purchaseId=@purchaseId ");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}