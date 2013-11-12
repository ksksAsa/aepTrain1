using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Xml.XPath;

public partial class Teacher_InsertFillTheBlankQuest : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        
        
    }

  
    protected void missingWordTxtBox_TextChanged(object sender, EventArgs e)
    {
        string ekfonisi = fillTheBlankPronunc.Text;
        string theword = missingWordTxtBox.Text;
        string newekfonisi = ekfonisi.Replace(theword, "..............");
        fillTheBlankPronunc.Text = newekfonisi;
       
    }
    protected void ddlChapters_SelectedIndexChanged(object sender, EventArgs e)
    {
        
            string selected = ddlChapters.SelectedValue.ToString();
            XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
            if (!Page.IsPostBack)
            {
               
                // DropDownList1.DataTextField = "value";
                // DropDownList1.DataValueField = "id";

                DropDownList1.DataBind();
            }
    }
    protected void sbmbtm_Click(object sender, EventArgs e)
    {
       
        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql =
            "INSERT INTO FillTheBlankQuestions (fillTheBlankQuestPronunc,level,fillTheBlankMissingWord,chapter_id,userID,caseOfError)"
       + " values (@FILLTHEBLANKQUESTPRONUNC,@LEVEL,@FILLTHEBLANKMISSINGWORD,@CHAPTER_ID,@USERID,@CASEOFERROR)";

        SqlConnection con = new SqlConnection(connectionString);
        try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = insertSql;

            SqlParameter fillTheBlankQuestPronunc = new SqlParameter("@FILLTHEBLANKQUESTPRONUNC", SqlDbType.NVarChar, 200);
            fillTheBlankQuestPronunc.Value = fillTheBlankPronunc.Text;
            cmd.Parameters.Add(fillTheBlankQuestPronunc);

            SqlParameter level = new SqlParameter("@LEVEL", SqlDbType.NChar, 10);
            level.Value = rdbtFillTheblabel.SelectedItem.Text;
            cmd.Parameters.Add(level);

            SqlParameter fillTheBlankMissingWord = new SqlParameter("@FILLTHEBLANKMISSINGWORD", SqlDbType.NVarChar, 50);
            fillTheBlankMissingWord.Value = missingWordTxtBox.Text;
            cmd.Parameters.Add(fillTheBlankMissingWord);

            SqlParameter chapter_id = new SqlParameter("@CHAPTER_ID", SqlDbType.Int, 1);
            chapter_id.Value = ddlChapters.SelectedValue;
            cmd.Parameters.Add(chapter_id);

            SqlParameter userID = new SqlParameter("@USERID", SqlDbType.Int, 1);
            userID.Value = Convert.ToInt32(Session["UserID"].ToString());
            cmd.Parameters.Add(userID);

            SqlParameter caseOfError = new SqlParameter("@CASEOFERROR", SqlDbType.NVarChar, 50);
            caseOfError.Value = DropDownList1.SelectedItem.Text;
            cmd.Parameters.Add(caseOfError);

            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();

            fillTheBlankPronunc.Text = String.Empty;
            missingWordTxtBox.Text = string.Empty;
            foreach (ListItem btn in rdbtFillTheblabel.Items)
            {
                btn.Selected = false;
            }
            refLbl.Text = "Επιτυχής προσθήκη ερώτησης";
        }

        catch (SqlException ex)
        {
            string errorMessage = "Error in inserting exercise";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
            con.Close();
        }

        finally
        {
            con.Close();
        }

    }
    protected void cancbtn_Click(object sender, EventArgs e)
    {
        fillTheBlankPronunc.Text = String.Empty;
        missingWordTxtBox.Text = string.Empty;
        foreach (ListItem btn in rdbtFillTheblabel.Items)
        {
            btn.Selected = false;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
   }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }

    
}