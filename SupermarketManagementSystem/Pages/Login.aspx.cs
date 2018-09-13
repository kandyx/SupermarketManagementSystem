using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        String str = ConfigurationManager.AppSettings["connectionString"];
        SqlConnection sqlConnection = new SqlConnection(str);

        SqlCommand sqlCommand = new SqlCommand("select account,password " +
                                               "from employee " +
                                               "where account = @account and password = @password", sqlConnection);
        SqlParameter account_para = new SqlParameter("@account", login.UserName);
        SqlParameter password_para = new SqlParameter("@password", login.Password);
        sqlCommand.Parameters.Add(account_para);
        sqlCommand.Parameters.Add(password_para);

        sqlConnection.Open();

        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        bool hasUser = sqlDataReader.HasRows;
        sqlDataReader.Read();

        if (hasUser)
        {
            e.Authenticated = true;
            String account = sqlDataReader["account"].ToString();
            FormsAuthentication.SetAuthCookie(account, false);
        }
        else
        {
            e.Authenticated = false;
        }

        sqlDataReader.Close();
        sqlConnection.Close();
    }
}