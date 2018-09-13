using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_AddCustom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert into custom (customName,phone) values(@customName,@phone) ", conn);
        SqlParameter customName = new SqlParameter("@customName", SqlDbType.NVarChar, 50);
        SqlParameter phone = new SqlParameter("@phone", SqlDbType.VarChar, 20);
        customName.Value = this.customNameTextBox.Text;
        phone.Value = this.phoneTextBox.Text;
        cmd.Parameters.Add(customName);
        cmd.Parameters.Add(phone);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('添加成功！ ');location='CustomManagement.aspx';</script>");
    }
}