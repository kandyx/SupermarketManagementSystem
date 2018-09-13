using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_CustomManagement : System.Web.UI.Page
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
        this.customrepeater.Visible = false;
        this.Updata.Visible = false;
        this.Add.Visible = true;
        this.Delete.Visible = false;
    }


    protected void Updata_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateCustom.aspx?customId=" + this.Label1.Text.ToString());
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        //SqlCommand cmd = new SqlCommand("select customId,customName,phone from custom where customId = @customId", conn);
        String sql = "delete from custom where customId = " + this.Label1.Text.ToString();
        SqlCommand cmd = new SqlCommand(sql, conn);
        //SqlParameter customId = new SqlParameter("@customId", SqlDbType.Int);
        //customId.Value = this.customIdTextBox.Text;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        bindItemList();
    }

    protected void Add_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCustom.aspx");
    }

    protected void selectButton_Click(object sender, EventArgs e)
    {
        if (this.customIdTextBox.Text.Trim() != String.Empty)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            //SqlCommand cmd = new SqlCommand("select customId,customName,phone from custom where customId = @customId", conn);
            String sql = "select customId,customName,phone from custom where customId = " + this.customIdTextBox.Text.ToString();
            SqlCommand cmd = new SqlCommand(sql, conn);
            //SqlParameter customId = new SqlParameter("@customId", SqlDbType.Int);
            //customId.Value = this.customIdTextBox.Text;
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds, "custom");
            conn.Close();
            if (ds.Tables[0].Rows.Count != 0)
            {
                this.Label1.Text = this.customIdTextBox.Text.ToString();

                this.customrepeater.DataSource = ds.Tables[0];
                this.customrepeater.DataBind();
                this.customrepeater.Visible = true;
                this.Updata.Visible = true;
                this.Add.Visible = true;
                this.Delete.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('错误！');history.go(-1);</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('错误！');history.go(-1);</script>");
            bindItemList();
        }
    }
}