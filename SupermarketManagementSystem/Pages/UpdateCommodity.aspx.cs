using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_UpdateCommodity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = Request.QueryString["commodityName"];
            TextBox2.Text = Request.QueryString["category"];
            TextBox3.Text = Request.QueryString["sellPrice"];
            TextBox4.Text = Request.QueryString["buyPrice"];
            TextBox5.Text = Request.QueryString["amount"];
            int supplierId = 1;
            int.TryParse(Request.QueryString["supplierId"], out supplierId);
            //DropDownList1.Items.FindByValue("supplierId").Selected = true;
            DropDownList1.SelectedValue = Request.QueryString["supplierId"];

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String commodityId = Request.QueryString["commodityId"];
        String commodityName = TextBox1.Text;
        String category = TextBox2.Text;
        double sellPrice = 0;
        double.TryParse(TextBox3.Text, out sellPrice);
        double buyPrice = 0;
        double.TryParse(TextBox4.Text, out buyPrice);
        int amount = 0;
        int.TryParse(TextBox5.Text, out amount);
        int supplierId = 1;
        int.TryParse(DropDownList1.SelectedItem.Value, out supplierId);

        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("update commodity set commodityName = '" + commodityName + "', category = '" + category + "', sellPrice = '" + sellPrice + "', buyPrice = '" + buyPrice + "', amount = '" + amount + "', supplierId = '" + supplierId + "' where commodityId = '" + commodityId + "'", conn);
        try
        {
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (SqlException)
        {
            conn.Close();
            Response.Write("<script>alert('修改失败');</script>");
        }
        Response.Redirect("CommodityManagement.aspx");

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}