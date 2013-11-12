using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Students_SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string subject = messageSubj.Text;
        string body = messageBody.Text;
        string date = DateTime.Now.ToString("MMMM d, yyyy");

        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql = "INSERT INTO Messages(messageSubject,messageFullText,userID,dateSended) values (@MESSAGESUBJECT,@MESSAGEFULLTEXT,'"+ Convert.ToInt32(Session["UserID"])+"',@DATE)";
        SqlConnection con = new SqlConnection(connectionString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = insertSql;

        SqlParameter subj = new SqlParameter("@MESSAGESUBJECT", SqlDbType.VarChar,50);
        subj.Value = subject;
        cmd.Parameters.Add(subj);
        SqlParameter text = new SqlParameter("@MESSAGEFULLTEXT", SqlDbType.Text);
        text.Value = body;
        cmd.Parameters.Add(text);
        SqlParameter thedate = new SqlParameter("@DATE", SqlDbType.VarChar, 50);
        thedate.Value = date;
        cmd.Parameters.Add(thedate);

        try {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            this.messageSubj.Text = string.Empty;
            this.messageBody.Text = string.Empty;
        }
        catch(SqlException ex){
            ex.ToString();
        }

    }
}