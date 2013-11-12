using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
public partial class loginOrRegister_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        //δημιουργία connecion string
        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql =
            "INSERT INTO Users (username,password,firstName,lastName,email,roleID)"
       + " values (@USERNAME,@PASSWORD,@FIRSTNAME,@LASTNAME,@EMAIL,@ROLEID)";
        string username = usrnTextBox.Text.ToString();
        SqlConnection con = new SqlConnection(connectionString);

        //δημιουργία sql εντολής
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = insertSql;

        SqlParameter firstName = new SqlParameter("@FIRSTNAME", SqlDbType.VarChar, 50);
        firstName.Value = nameTextBox.Text.ToString();
        cmd.Parameters.Add(firstName);

        SqlParameter lastName = new SqlParameter("@LASTNAME", SqlDbType.VarChar, 50);
        lastName.Value = surnameTextBox.Text.ToString();
        cmd.Parameters.Add(lastName);

        SqlParameter userName = new SqlParameter("@USERNAME", SqlDbType.VarChar, 50);
        userName.Value = usrnTextBox.Text.ToString();
        cmd.Parameters.Add(userName);

        SqlParameter pwd = new SqlParameter("@PASSWORD", SqlDbType.VarChar, 50);
        pwd.Value = pswTextBox.Text.ToString();
        cmd.Parameters.Add(pwd);

        SqlParameter email = new SqlParameter("@EMAIL", SqlDbType.VarChar, 50);
        email.Value = mailTextBox.Text.ToString();
        cmd.Parameters.Add(email);

        SqlParameter roleID = new SqlParameter("@ROLEID", SqlDbType.Int);
        roleID.Value = 3;
        cmd.Parameters.Add(roleID);

        try
        {
            string checksql = "SELECT Count(*) FROM [Users] WHERE username =@USRN";
            SqlCommand cmdcheck = new SqlCommand(checksql, con);
            SqlParameter usn = new SqlParameter("@USRN", SqlDbType.VarChar, 50);
            usn.Value = username;
            cmdcheck.Parameters.Add(usn);
            con.Open();
            
            cmdcheck.ExecuteNonQuery();
            int exist = (int)cmdcheck.ExecuteScalar();
            if (exist>0)
            {

                lblMessageText.Text = "το username υπάρχει ήδη";
               con.Close();
            }
            else
            {
                cmd.ExecuteNonQuery();
                lblMessageText.Text = "Επιτυχής εγγραφή χρήστη";
                con.Close();
                Thread.Sleep(2000);
                Response.Redirect("~/Login.aspx");
            }
        }

        catch (SqlException ex)
        {
            string errorMessage = "Error in registering user";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
        }

        finally
        {
            con.Close();
        }
    }

    public bool RecordExists(ref System.Data.SqlClient.SqlConnection _connection, string _sql)
    {
        SqlDataReader reader = null;

        try
        {
            System.Data.SqlClient.SqlCommand _sqlCommand = new System.Data.SqlClient.SqlCommand(_sql, _connection);
            reader = _sqlCommand.ExecuteReader();
        }
        catch
        {
            
            lblMessageText.Text = "Προσωρινό πρόβλημα, δοκιμάστε αργότερα";
            return false;
        }

        if (reader != null && reader.Read())
        {
            if (reader != null)
            {
                reader.Close();
                reader.Dispose();
            }
            return true;
        }
        else
        {
            if (reader != null)
            {
                reader.Close();
                reader.Dispose();
            }
            return false;
        }

    }
    
}