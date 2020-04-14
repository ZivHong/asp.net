using System;
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    OleDbDataReader dbread = null;
    OleDbCommand cmd = new OleDbCommand();
    OleDbConnection conn = new OleDbConnection("Provider= Microsoft.Jet.OLEDB.4.0; Data Source = |DataDirectory|/dvd.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ValidateUser(object sender, System.Web.UI.WebControls.AuthenticateEventArgs e)
    {
        string userName = login.UserName;
        string password = login.Password;
        bool result = dblogin(userName, password);
        if ((result))
        {
            e.Authenticated = true;
            Response.Redirect("normal.html");
        }
        else
        {
            e.Authenticated = false;
        }
       
    }
    protected bool dblogin(string userName, string password) 
    {
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from member where username = :UserName and password = :Password";
        cmd.Parameters.AddWithValue("UserName", userName);
        cmd.Parameters.AddWithValue("Password", password);
        cmd.Connection = conn;
        conn.Open();
        string result = Convert.ToString(cmd.ExecuteScalar());
        if (string.IsNullOrEmpty(result))
        {
            //invalid user/password , return flase
            return false;
        }
        else
        {
            // valid login
            return true;
        }
    }
}