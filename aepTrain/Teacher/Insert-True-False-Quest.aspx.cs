using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Teacher_Insert_True_False_Quest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void sbmTrueFalseBtn_Click(object sender, EventArgs e)
    {
        
        //δημιουργία connecion string
        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql =
            "INSERT INTO TrueFalseQuestions (pronunciation,level,answerIs,chapter_id,userID,falseAnswerMessage,caseOfError)"
       + " values (@PRONUNCIATION,@LEVEL,@ANSWERIS,@CHAPTER_ID,@USERID,@FALSEANSWERMESSAGE,@CASEOFERROR)";
        

            SqlConnection con = new SqlConnection(connectionString);
        try{
            //δημιουργία sql εντολής
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = insertSql;

            SqlParameter pronunciation = new SqlParameter("@PRONUNCIATION", SqlDbType.VarChar, 300);
            pronunciation.Value = trueFalsePronuntion.Text;
            cmd.Parameters.Add(pronunciation);

            SqlParameter level = new SqlParameter("@LEVEL", SqlDbType.Char, 10);
            level.Value = checkLevelrdb.SelectedItem.Text;
            cmd.Parameters.Add(level);


            SqlParameter answerIs = new SqlParameter("@ANSWERIS", SqlDbType.Char, 5);
            if (isTrueChk.Checked) {
                answerIs.Value = "Σωστό";
                cmd.Parameters.Add(answerIs);
            }
            else if (isFalseChk.Checked) {
                answerIs.Value = "Λάθος";
                cmd.Parameters.Add(answerIs);
            }

            
            SqlParameter chapter_id = new SqlParameter("@CHAPTER_ID", SqlDbType.Int, 1);
            chapter_id.Value = dropDownChapters.SelectedValue;
            cmd.Parameters.Add(chapter_id);

            SqlParameter userID = new SqlParameter("@USERID", SqlDbType.Int, 1);
            userID.Value = Convert.ToInt32(Session["UserID"].ToString());
            cmd.Parameters.Add(userID);


            SqlParameter falseAnswerMessage = new SqlParameter("@FALSEANSWERMESSAGE", SqlDbType.VarChar, 150);
            falseAnswerMessage.Value = falAnsMessTxtBox.Text;
            cmd.Parameters.Add(falseAnswerMessage);

            SqlParameter caseOfError = new SqlParameter("@CASEOFERROR", SqlDbType.VarChar, 200);
            caseOfError.Value = PossibleErrorsDropDnL.SelectedItem.ToString();
            cmd.Parameters.Add(caseOfError);
            
            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
            referenceLabel.Text = "Επιτυχής Εισαγωγή Άσκησης";
            trueFalsePronuntion.Text = String.Empty;
            
            falAnsMessTxtBox.Text = String.Empty;
            
            checkLevelrdb.ClearSelection();
            isTrueChk.Checked = false;
            isFalseChk.Checked = false;
           
        }

        catch (SqlException ex)
        {
            string errorMessage = "Error in inserting exercise";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
            con.Close();
        }

        finally {
            con.Close();
        }


    }


    protected void cancelTFbtn_Click(object sender, EventArgs e)
    {
        trueFalsePronuntion.Text = String.Empty;
        
        falAnsMessTxtBox.Text = String.Empty;
        
        checkLevelrdb.ClearSelection();
        isTrueChk.Checked = false;
        isFalseChk.Checked = false;
    }
    protected void dropDownChapters_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected = dropDownChapters.SelectedValue.ToString();

        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
        PossibleErrorsDropDnL.DataBind();
    }
}