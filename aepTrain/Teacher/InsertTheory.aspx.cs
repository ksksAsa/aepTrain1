using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Runtime.InteropServices.ComTypes;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Teacher_InsertTheory : System.Web.UI.Page
{
    string myfullPath;
    int chaptID;
    string fileName;
    public static string example;
   

   public static List<string> myExampleList = new List<string>();

   public static List<string> myAdviceList = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
         
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fileName = FileUpload1.PostedFile.FileName;
        myfullPath = Server.MapPath("Files/" + fileName);
        FileUpload1.SaveAs(Server.MapPath("Files/" + fileName));
        Microsoft.Office.Interop.Word.Application word = new Microsoft.Office.Interop.Word.Application();
        object miss = System.Reflection.Missing.Value;

        object path = Server.MapPath("Files/" + fileName);
        object readOnly = true;
        Microsoft.Office.Interop.Word.Document docs = word.Documents.Open(ref path, ref miss, ref readOnly, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss);
        string totaltext = "";
        for (int i = 0; i < docs.Paragraphs.Count; i++)
        {
            totaltext += " \r\n " + docs.Paragraphs[i + 1].Range.Text.ToString();
        }

        PreviewTheoryTextBox.Text = totaltext;

        //kratao to onoma tou arxeiou doc se label pou den fainetai
        LabelToKeepFileName.Text = fileName;
        docs.Close();
        word.Quit();
        FileUpload1.Visible = false;
       
    }
    protected void submitTheory_Click(object sender, EventArgs e)
    {
        if (adviceTextBox.Text != "")
        {
            myAdviceList.Add(adviceTextBox.Text);
        }
        string selectedChapt = chaptersList1.SelectedValue;
        chaptID = Convert.ToInt32(chaptersList1.SelectedValue);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        try
        {
          /*  SqlCommand cmd = new SqlCommand("select chapter_id from Chapters where chapter_name =@CHAPTERNAME", con);
            cmd.Parameters.AddWithValue("@CHAPTERNAME",selectedChapt);
             SqlDataAdapter da = new SqlDataAdapter(cmd);
             DataTable dt = new DataTable();
             da.Fill(dt);
             if (dt.Rows.Count > 0) {
                 foreach (DataRow myRow in dt.Rows) {
                    // string chaptID_toString = myRow["chapter_id"].ToString();
                    // chaptID = Convert.ToInt32(chaptID_toString);
                     chaptID = Convert.ToInt32(myRow["chapter_id"]);
                 }
             }*/
             fileName = LabelToKeepFileName.Text;
             myfullPath = Server.MapPath("Files/" + fileName);

             string insertSql = "insert into Files(fullPath,chapter_id,fileName) values (@PATH,@CHAPTERID,@FILENAME)";
             SqlCommand cmd1 = new SqlCommand();
             cmd1.Connection = con;
             cmd1.CommandType = CommandType.Text;
             cmd1.CommandText = insertSql;
             SqlParameter fullPath = new SqlParameter("@PATH", SqlDbType.VarChar,200);
             fullPath.Value = myfullPath;
             cmd1.Parameters.Add(fullPath);

             SqlParameter chaperid = new SqlParameter("@CHAPTERID", SqlDbType.Int);
             chaperid.Value = chaptID;
             cmd1.Parameters.Add(chaperid);

             SqlParameter filnm = new SqlParameter("@FILENAME", SqlDbType.VarChar, 50);
             filnm.Value = fileName;
             cmd1.Parameters.Add(filnm);

            cmd1.ExecuteNonQuery();

            string insertLecture = "insert into Lectures(lectureText,chapter_id) values (@LECTURETEXT,"+chaptID+")";
            SqlCommand cmd4 = new SqlCommand();
            cmd4.Connection = con;
            cmd4.CommandType = CommandType.Text;
            cmd4.CommandText = insertLecture;

            SqlParameter lectureText = new SqlParameter("@LECTURETEXT", SqlDbType.Text);
            lectureText.Value = PreviewTheoryTextBox.Text;
            cmd4.Parameters.Add(lectureText);

            cmd4.ExecuteNonQuery();

            //εισαγωγή παραδειγμάτων

           // string example = "";
          //  foreach (string item in myExampleList)
           // {
            //    example = item.ToString();
            
                string insertexamples = "insert into Examples(exampleFullText,chapter_id) values (@EXAMPLE,"+chaptID+")";

                
                using (SqlCommand cmd2 = new SqlCommand(insertexamples, con)) {
                    cmd2.Parameters.AddWithValue("@EXAMPLE", "");
                    foreach (string examp in myExampleList) {
                        cmd2.Parameters["@EXAMPLE"].Value = examp;

                        cmd2.ExecuteNonQuery();
                    }
               // }
            }
                int errID = Convert.ToInt32(DrdlErrors.SelectedValue);

            string insertadvices = "insert into Advices(adviceText,error_id) values (@ADVICE,"+errID+")";
            using (SqlCommand cmd3 = new SqlCommand(insertadvices, con)) {
                cmd3.Parameters.AddWithValue("@ADVICE", "");
                foreach (string adv in myAdviceList) {
                    cmd3.Parameters["@ADVICE"].Value = adv;
                    cmd3.ExecuteNonQuery();
                }
            }

            con.Close();
            lblTheorySuccess.Text = "Επιτυχής Προσθήκη";
           // lblTheorySuccess.Text = fileName;
           
        }

        catch (SqlException ex)
        {
            string errorMessage = "Error in inserting theory";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
        }
        finally {
            con.Close();
        }
    }
    protected void goToExamplesbtn_Click(object sender, EventArgs e)
    {
        chaptersList1.Visible = false;
        Label1.Visible = false;
        MultiView1.ActiveViewIndex++;
    }
    protected void goToGiveAdvice_Click(object sender, EventArgs e)
    {
        if (ExampleTextBox.Text != "")
        {
            myExampleList.Add(ExampleTextBox.Text);
        }
        MultiView1.ActiveViewIndex++;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        myExampleList.Add(ExampleTextBox.Text);
        ExampleTextBox.Text = String.Empty;
    }
    protected void newAdvicebtn_Click(object sender, EventArgs e)
    {
        myAdviceList.Add(adviceTextBox.Text);
        adviceTextBox.Text = String.Empty;
    }
}