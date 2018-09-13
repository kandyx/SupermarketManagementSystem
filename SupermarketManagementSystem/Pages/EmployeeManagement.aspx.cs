using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_EmployeeManagement : System.Web.UI.Page
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
        SqlDataAdapter cmd = new SqlDataAdapter("select * from employee", conn);
        DataSet ds = new DataSet();
        cmd.Fill(ds, "employee");
        GridView1.DataSource = ds.Tables["employee"].DefaultView;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from employee where employeeId=@employeeId", conn);
        cmd.Parameters.Add("@employeeId", SqlDbType.Int).Value = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        cmd.ExecuteNonQuery();
        conn.Close();
        Bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("update employee set employeeName=@employeeName,roleId=@roleId,phone=@phone,address=@address,account=@account,password=@password where employeeId=@employeeId", conn);
        cmd.Parameters.Add("@employeeId", SqlDbType.Int).Value = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        cmd.Parameters.Add("@employeeName", SqlDbType.NVarChar, 50).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@roleId", SqlDbType.Int).Value = Convert.ToInt32(((DropDownList)(GridView1.Rows[e.RowIndex].Cells[2].Controls[1])).Text.ToString());
        cmd.Parameters.Add("@phone", SqlDbType.VarChar, 20).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@address", SqlDbType.NVarChar, 100).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@account", SqlDbType.VarChar, 50).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        this.GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from employee where employeeId=@employeeId", conn);
        cmd.Parameters.Add("@employeeId", SqlDbType.Int).Value = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
        cmd.ExecuteNonQuery();
        conn.Close();
        Bind2();
    }
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        conn.Open();
        SqlCommand cmd = new SqlCommand("update employee set employeeName=@employeeName,roleId=@roleId,phone=@phone,address=@address,account=@account,password=@password where employeeId=@employeeId", conn);
        cmd.Parameters.Add("@employeeId", SqlDbType.Int).Value = Convert.ToInt32(((TextBox)(GridView2.Rows[e.RowIndex].Cells[0].Controls[1])).Text.ToString());
        cmd.Parameters.Add("@employeeName", SqlDbType.NVarChar, 50).Value = ((TextBox)(GridView2.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@roleId", SqlDbType.Int).Value = Convert.ToInt32(((DropDownList)(GridView2.Rows[e.RowIndex].Cells[2].Controls[1])).Text.ToString());
        cmd.Parameters.Add("@phone", SqlDbType.VarChar, 20).Value = ((TextBox)(GridView2.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@address", SqlDbType.NVarChar, 100).Value = ((TextBox)(GridView2.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@account", SqlDbType.VarChar, 50).Value = ((TextBox)(GridView2.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = ((TextBox)(GridView2.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView2.EditIndex = -1;
        Bind2();
    }
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        this.GridView2.EditIndex = e.NewEditIndex;
        Bind2();
    }
    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        Bind2();
    }
    void Bind2()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        string str = this.TextBox4.Text;
        SqlCommand cmd = new SqlCommand("SELECT * FROM [employee] WHERE ([employeeName] = @employeeName)", conn);
        cmd.Parameters.Add("@employeeName", SqlDbType.VarChar, 50).Value = this.TextBox4.Text;
        SqlDataAdapter adt = new SqlDataAdapter();
        adt.SelectCommand = cmd;
        DataSet ds = new DataSet();
        conn.Open();
        adt.SelectCommand.ExecuteNonQuery();
        conn.Close();
        adt.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Bind2();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddEmployee.aspx");
    }
}