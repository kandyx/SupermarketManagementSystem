using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_SellManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DataTable dt = new DataTable();   //实例一个新表
            dt.Columns.Add("commodityId", typeof(string));
            dt.Columns.Add("commodityName", typeof(string));
            dt.Columns.Add("buyPrice", typeof(double));
            dt.Columns.Add("amount", typeof(double));
            dt.Columns.Add("sum", typeof(double));
            dt.Columns.Add("total", typeof(double));
            this.ViewState["table"] = dt;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String str = ConfigurationManager.AppSettings["connectionString"];
        SqlConnection sqlConnection = new SqlConnection(str);
        SqlCommand getbuyPriceTable_sql = new SqlCommand("select commodityName,buyPrice,amount " + "from commodity " + "where commodityId = " + IDBox.Text, sqlConnection);
        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
        DataSet dataSet = new DataSet();
        sqlConnection.Open();
        sqlDataAdapter.SelectCommand = getbuyPriceTable_sql;
        sqlDataAdapter.Fill(dataSet, "Commodity");
        sqlConnection.Close();
        DataTable CommodityTable = dataSet.Tables["Commodity"];
        TextBox1.Text = CommodityTable.Rows[0]["commodityName"].ToString();
        TextBox2.Text = CommodityTable.Rows[0]["buyPrice"].ToString();
        TextBox3.Text = CommodityTable.Rows[0]["amount"].ToString();


    }

    protected void Button1_Click1(object sender, EventArgs e)
    {


        DataTable dt = (DataTable)this.ViewState["table"];
        DataRow row = dt.NewRow();
        row["commodityId"] = IDBox.Text.ToString();
        row["commodityName"] = TextBox1.Text.ToString();
        row["buyPrice"] = double.Parse(TextBox2.Text.ToString());
        row["amount"] = double.Parse(TextBox4.Text.ToString());
        row["sum"] = double.Parse(TextBox2.Text.ToString()) * double.Parse(TextBox4.Text.ToString());
        dt.Rows.Add(row);
        Repeater1.DataSource = dt;    //绑定数据源
        Repeater1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        String str = ConfigurationManager.AppSettings["connectionString"];
        SqlConnection sqlConnection = new SqlConnection(str);

        DataTable dt = (DataTable)this.ViewState["table"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string s = "insert into sellRecord(commodityID amount)values('" + dt.Rows[i]["commodityId"].ToString() + "','" + dt.Rows[i]["amount"].ToString() + ")";
        }
    }
}