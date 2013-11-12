using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Teacher_InsertProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int chaptID = Convert.ToInt32(DropDownList1.SelectedValue);
        string level = DropDownList2.SelectedValue;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            con.Open();
            string fileName = FileUpload1.PostedFile.FileName;
            string myFullPath = Server.MapPath("Projects/" + fileName);
            FileUpload1.SaveAs(Server.MapPath("Projects/" + fileName));
            string insertSql = "insert into ProjectsFiles(fullPath,chapter_id,fileName,projectLevel) values (@PATH,@CHAPTERID,@FILENAME,@LEVEL)";
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

            SqlParameter theLevel = new SqlParameter("@LEVEL", SqlDbType.VarChar, 50);
            theLevel.Value = level;
            cmd1.Parameters.Add(theLevel);
            cmd1.ExecuteNonQuery();
            LabelToKeepFileName.Visible = true;
            LabelToKeepFileName.Text = "Επιτυχής προσθήκη";
            con.Close();
        }
        catch { }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelToKeepFileName.Visible = false;
    }
}