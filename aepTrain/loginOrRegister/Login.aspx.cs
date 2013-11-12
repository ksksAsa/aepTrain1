using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.SessionState;

public partial class LoginOrRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    
    protected void loginBtn_Click(object sender, EventArgs e)
    {

       
            //δημιουργία connection string σύνδεση με βάση και έλεγχος
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
           
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from Users where username =@USERNAME and password=@PASSWORD", con);
            cmd.Parameters.AddWithValue("@USERNAME", logusrnTextbox.Text);
            cmd.Parameters.AddWithValue("@PASSWORD", logpswTextBox.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                
                Session["USERNAME"] = logusrnTextbox.Text.ToString();
                string username = (string)Session["USERNAME"];
                //Server.Transfer("~/Default.aspx");
                foreach (DataRow myRow in dt.Rows)
                {
                   string roleid = myRow["roleID"].ToString();
                   Session["UserID"] = myRow["userID"].ToString();
                   if (roleid=="3")
                   {
                       Response.Redirect("~/Students/DefaultStudent.aspx",false);
                       con.Close();
                   }
                   else
                   {
                       Response.Redirect("~/Default.aspx", false);
                   }
                }
                
                
                
            }
            else
            {

                //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Λάθος username ή κωδικός')</script>");
                con.Close();
            }
        }

        catch (SqlException ex)
        {
            string errorMessage = "Error in registering user";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
            
        }

        finally {
            con.Close();
        }

    }
}