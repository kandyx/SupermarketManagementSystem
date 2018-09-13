using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_AddEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert into [employee] ([employeeName], [account], [password]) values (@employeeName, @account, @password)", conn);
        cmd.Parameters.Add("@employeeName", SqlDbType.VarChar, 50).Value = this.TextBox1.Text;
        cmd.Parameters.Add("@account", SqlDbType.VarChar, 50).Value = this.TextBox2.Text;
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = this.TextBox3.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('添加成功，将返回管理界面。')</script>");
        Response.Redirect("EmployeeManagement.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeManagement.aspx");
    }
}