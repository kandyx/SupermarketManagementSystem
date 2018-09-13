using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }

    private void Bind()
    {
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);

        SqlCommand getRole_sql = new SqlCommand("select roleId " +
                                                "from employee " +
                                                "where employeeId = @userId", sqlConnection);

        //身份管理
    }
}