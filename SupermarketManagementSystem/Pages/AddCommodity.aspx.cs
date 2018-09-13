using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_AddCommodity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

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
        SqlCommand cmd = new SqlCommand("insert into commodity values('" + commodityName + "','" + category + "','" + sellPrice + "','" + buyPrice + "','" + amount + "','" + supplierId + "')", conn);
        try
        {
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (SqlException)
        {
            conn.Close();
            Response.Write("<script>alert('添加失败');</script>");
        }
        Response.Redirect("CommodityManagement.aspx");

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}