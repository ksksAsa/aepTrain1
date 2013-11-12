using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Windows.Forms;

public partial class Students_WatchTheory : System.Web.UI.Page
{
   public static int i;
   public static int j;
 //   public static  List<string> splitString = new List<string> { "" };
  //  public  static  List<string> exampleList = new List<string>();

   public static List<string> splitString;
   public static List<string> exampleList;

    public static  string myLink;
    public static  string filename;
   
    public static string theLecture;

    SqlDataAdapter lectureAdapter;
    SqlDataAdapter fileAdapter;
    SqlDataAdapter exampleAdapter;
    
   public  DataTable lectdt = new DataTable();
   public  DataTable filetbl = new DataTable();
   public static  DataTable exampltab = new DataTable();

   public static DataRow exampleDatR;
   // DataRow lectDR = new DataRow();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["chapterID"] = DropDownList1.SelectedValue;
        if (DropDownList1.SelectedValue != "0")
        {
            splitString = new List<string> { "" };
            exampleList = new List<string>();
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            string selectLecture = "select * from LECTURES WHERE chapter_id =" + DropDownList1.SelectedValue + "";

            lectureAdapter = new SqlDataAdapter(selectLecture, con);

            i = 0;
            j = 0;
            lectureAdapter.Fill(lectdt);
            theLecture = lectdt.Rows[0][1].ToString();
            
            var resultArray = theLecture.Split(' ');

            foreach (var word in resultArray)
            {
                if (splitString.Last().Length + 1 <= 1000)
                {
                    splitString[splitString.Count - 1] += word + " ";
                }
                else
                {
                    splitString.Add(word);
                }
            }

            LectureTextBox1.Text = splitString[0].ToString();
            //  LectureTextBox1.Text = lectdt.Rows[0][1].ToString();

            string selectFile = "select * from Files where chapter_id=" + DropDownList1.SelectedValue + "";
            fileAdapter = new SqlDataAdapter(selectFile, con);
            fileAdapter.Fill(filetbl);

         //   DirectoryInfo di = new DirectoryInfo(filetbl.Rows[0][1].ToString());
            
          //  foreach (FileInfo fi in di.GetFiles()) {
           //     HyperLink1.NavigateUrl = "downloading.aspx?file=" + fi.Name;
           // }
           
           // HyperLink1.NavigateUrl = filetbl.Rows[0][1].ToString();
            myLink = filetbl.Rows[0][1].ToString();
            filename = filetbl.Rows[0][3].ToString();

            //eksagogi ton paradeigmaton

            string selectExamples = "select Examples.exampleFullText from Examples WHERE Examples.chapter_id =" + DropDownList1.SelectedValue +"";
            exampleAdapter = new SqlDataAdapter(selectExamples, con);
            exampleAdapter.Fill(exampltab);
           // examplesTextbox.Text = exampltab.Rows[0][0].ToString();
            exampleDatR = exampltab.Rows[0];
            examplesTextbox.Text = exampleDatR[0].ToString();
            
            
            con.Close();
            this.DropDownList1.Visible = false;
        }
    }
    protected void forwardbtn_Click(object sender, ImageClickEventArgs e)
    {
        back.Enabled = true;
        if (MultiviewForWatcingTheory.ActiveViewIndex == 0) {
            i++;
            if (i > splitString.Count - 1)
            {
                MultiviewForWatcingTheory.ActiveViewIndex++;
                
            }
            else {
                LectureTextBox1.Text = splitString[i].ToString();
            }
        }
        else if (MultiviewForWatcingTheory.ActiveViewIndex == 1) {
            j++;
            if (j > exampltab.Rows.Count-1)
            {
                string parameter = DropDownList1.SelectedValue;
                LectureTextBox1.Text = string.Empty;
                examplesTextbox.Text = string.Empty;
                lectdt.Clear();
                filetbl.Clear();
                exampltab.Clear();
                theLecture = string.Empty;
                
                Response.Redirect("~/Students/Quiz.aspx?unit=" + HttpUtility.UrlEncode(parameter));
               
            }
            else {
                exampleDatR = exampltab.Rows[j];
                examplesTextbox.Text = exampleDatR[0].ToString();
               
            }
        }
     
    }
    
    protected void back_Click(object sender, ImageClickEventArgs e)
    {
        if (MultiviewForWatcingTheory.ActiveViewIndex == 0) {
            i--;
            if (i == -1)
            {
                back.Enabled = false;
            }
            else {
                LectureTextBox1.Text = splitString[i].ToString();
            }
        }
        else if (MultiviewForWatcingTheory.ActiveViewIndex == 1) {
            j--;
            if (j == -1)
            {
                back.Enabled = false;
            }
            else {
                exampleDatR = exampltab.Rows[j];
                examplesTextbox.Text = exampleDatR[0].ToString();
            }
        }
       /* i--;
        j--;
        if (i == -1)
        {
            back.Enabled = false;
        }
        else
        {
            exampleDatR = exampltab.Rows[j];
            examplesTextbox.Text = exampleDatR[0].ToString();
            LectureTextBox1.Text = splitString[i].ToString();
        }*/
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        response.ClearContent();
        response.Clear();
        response.ContentType = "text/plain";
        response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ";");
        response.TransmitFile(myLink);
        response.Flush();
        response.End();
        
        
        
    }
}