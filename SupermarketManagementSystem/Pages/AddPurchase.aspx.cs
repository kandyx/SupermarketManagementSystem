using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_AddPurchase : System.Web.UI.Page
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
        DataTable dt = new DataTable("list");
        /*创建自增列
        DataColumn dc = new DataColumn("itemId",typeof(int));
        dc.AutoIncrement = true;
        dc.AutoIncrementSeed = 1;
        dc.AutoIncrementStep = 1;
        dt.Columns.Add(dc);*/
        dt.Columns.Add("commodityId", typeof(int));
        dt.Columns.Add("amount", typeof(int));

        this.ViewState["table"] = dt;

        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        DataRow dr = dt.NewRow();
        dr["commodityId"] = this.DropDownList3.Text;
        dr["amount"] = Convert.ToInt32(this.TextBox2.Text);
        dt.Rows.Add(dr);

        GridView2.DataSource = dt;
        GridView2.DataBind();
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        dt.Rows.RemoveAt(e.RowIndex);
        // cmd.Parameters.Add("@itemId", SqlDbType.Int).Value = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());
        //cmd.ExecuteNonQuery();
        // conn.Close();
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        dt.Rows[e.RowIndex]["commodityId"] = ((DropDownList)(GridView2.Rows[e.RowIndex].Cells[1].Controls[1])).Text.ToString().Trim();
        dt.Rows[e.RowIndex]["amount"] = Convert.ToInt32(((TextBox)(GridView2.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim());
        GridView2.EditIndex = -1;
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        GridView2.DataSource = dt;
        GridView2.EditIndex = e.NewEditIndex;
        GridView2.DataBind();
    }

    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        GridView2.DataSource = dt;
        GridView2.EditIndex = -1;
        GridView2.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)this.ViewState["table"];
        DateTime now = DateTime.Now;
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
        //打开连接
        conn.Open();
        //建立从数据库中获取数据的命令
        SqlCommand cmd = new SqlCommand("insert into purchase(createTime) values(@createTime)", conn);
        cmd.Parameters.Add("@createTime", SqlDbType.DateTime).Value = now;
        cmd.ExecuteNonQuery();
        SqlCommand cmd2 = new SqlCommand("select purchaseId from purchase where createTime=@createTime", conn);
        cmd2.Parameters.Add("@createTime", SqlDbType.DateTime).Value = now;
        //cmd2.ExecuteNonQuery();
        int purchaseId = (int)cmd2.ExecuteScalar();

        SqlCommand cmd3 = new SqlCommand("insert into purchaseList(purchaseId,commodityId,amount) values(@purchaseId,@commodityId,@amount)", conn);
        foreach (DataRow dataRow in dt.Rows)
        {
            cmd3.Parameters.Add("@purchaseId", SqlDbType.Int).Value = purchaseId;
            cmd3.Parameters.Add("@commodityId", SqlDbType.Int).Value = dataRow["commodityId"];
            cmd3.Parameters.Add("@amount", SqlDbType.Int).Value = dataRow["amount"];
        }

    }
}