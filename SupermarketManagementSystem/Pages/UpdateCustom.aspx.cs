using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_UpdateCustom : System.Web.UI.Page
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
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        String sql = "select customName, phone  from custom where customId = " + Request.QueryString.Get("customId");
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds, "custom");
        conn.Close();
        DataTable customTable = ds.Tables[0];
        customNameTextBox.Text = customTable.Rows[0]["customName"].ToString();
        phoneTextBox.Text = customTable.Rows[0]["phone"].ToString();
        this.Label2.Text = Request.QueryString.Get("customId");
    }

    protected void UpdataButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("update custom SET  customName = @customName , phone = @phone WHERE customId = " + this.Label2.Text.ToString(), conn);
        SqlParameter customName = new SqlParameter("@customName", SqlDbType.NVarChar, 50);
        SqlParameter phone = new SqlParameter("@phone", SqlDbType.VarChar, 20);
        customName.Value = this.customNameTextBox.Text;
        phone.Value = this.phoneTextBox.Text;

        cmd.Parameters.Add(customName);
        cmd.Parameters.Add(phone);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('成功！ ');location='CustomManagement.aspx';</script>");
    }
}