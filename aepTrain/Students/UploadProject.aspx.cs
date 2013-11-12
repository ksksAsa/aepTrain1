using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Students_UploadProject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int chaptID = Convert.ToInt32(DropDownList1.SelectedValue);
        int userID = Convert.ToInt32(Session["UserID"]);
        
        try {
            con.Open();
            string fileName = FileUpload1.PostedFile.FileName;
            string myFullPath = Server.MapPath("MyProjects/" + fileName);
            FileUpload1.SaveAs(Server.MapPath("MyProjects/" + fileName));
            string insertSql = "insert into StudentsProjects(fullPath,chapter_id,fileName,userID) values (@PATH,@CHAPTERID,@FILENAME,@USERID)";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con;
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = insertSql;
            SqlParameter fullPath = new SqlParameter("@PATH", SqlDbType.VarChar, 200);
            fullPath.Value = myFullPath;
            cmd1.Parameters.Add(fullPath);

            SqlParameter chaperid = new SqlParameter("@CHAPTERID", SqlDbType.Int);
            chaperid.Value = chaptID;
            cmd1.Parameters.Add(chaperid);

            SqlParameter filnm = new SqlParameter("@FILENAME", SqlDbType.VarChar, 50);
            filnm.Value = fileName;
            cmd1.Parameters.Add(filnm);
            

            SqlParameter userid = new SqlParameter("@USERID", SqlDbType.Int);
            userid.Value = userID;
            cmd1.Parameters.Add(userid);

            if (RecordExists(ref con, "SELECT fileName FROM StudentsProjects WHERE chapter_id =" + chaptID + " AND userID=" + userID + " "))
            {
                Label2.Visible = true;
                Label2.Text = "Έχετε εισάγει ήδη την εργασία";
                con.Close();
            }
            else
            {
                cmd1.ExecuteNonQuery();
                Label2.Visible = true;
                Label2.Text = "Επιτυχία εισαγωγής";
                con.Close();
            }
        }
        catch {
            Label2.Visible = true;
            Label2.Text = "Πρόβλημα στην εισαγωγή";
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
        catch {
            Label2.Visible = true;
            Label2.Text = "Προσωρινό πρόβλημα, δοκιμάστε αργότερα";
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
        else {
            if (reader != null) {
                reader.Close();
                reader.Dispose();
            }
            return false;
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Visible = false;
    }
}