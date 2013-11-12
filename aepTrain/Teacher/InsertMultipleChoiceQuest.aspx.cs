using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Teacher_InsertMultipleChoiceQuest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string insertSql =
            "INSERT INTO MultipleChoiceQuestions (multChPronunciation,level,trueAnswer,falseAns1,falseAns2,falseAns3,chapter_id,userID,falseAnswerMessage,caseOfError)"
       + " values (@MULTCHPRONUNCIATION,@LEVEL,@TRUEANSWER,@FALSEANS1,@FALSEANS2,@FALSEANS3,@CHAPTER_ID,@USERID,@FALSEANSWERMESSAGE,@CASEOFERROR)";

        SqlConnection con = new SqlConnection(connectionString);
        try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = insertSql;

            SqlParameter multChPronunciation = new SqlParameter("@MULTCHPRONUNCIATION", SqlDbType.VarChar, 300);
            multChPronunciation.Value = mulChPronunc.Text;
            cmd.Parameters.Add(multChPronunciation);

            SqlParameter level = new SqlParameter("@LEVEL", SqlDbType.Char, 10);
            level.Value = multchLevel.SelectedItem.ToString();
            cmd.Parameters.Add(level);

            

            

            if (firstIsTrue.Checked == true)
            {
                SqlParameter trueAnswer = new SqlParameter("@TRUEANSWER", SqlDbType.Char, 200);

                SqlParameter falseAns1 = new SqlParameter("@FALSEANS1", SqlDbType.Char, 200);

                SqlParameter falseAns2 = new SqlParameter("@FALSEANS2", SqlDbType.Char, 200);

                SqlParameter falseAns3 = new SqlParameter("@FALSEANS3", SqlDbType.Char, 200);
                trueAnswer.Value = firstAns.Text;
                falseAns1.Value = secAns.Text;
                falseAns2.Value = thirdAns.Text;
                falseAns3.Value = fourthAns.Text;
                cmd.Parameters.Add(trueAnswer);
                cmd.Parameters.Add(falseAns1);
                cmd.Parameters.Add(falseAns2);
                cmd.Parameters.Add(falseAns3);
            }
            else if (secIsTrue.Checked == true)
            {
                SqlParameter trueAnswer = new SqlParameter("@TRUEANSWER", SqlDbType.Char, 200);

                SqlParameter falseAns1 = new SqlParameter("@FALSEANS1", SqlDbType.Char, 200);

                SqlParameter falseAns2 = new SqlParameter("@FALSEANS2", SqlDbType.Char, 200);

                SqlParameter falseAns3 = new SqlParameter("@FALSEANS3", SqlDbType.Char, 200);
                trueAnswer.Value = secAns.Text;
                falseAns1.Value = firstAns.Text;
                falseAns2.Value = thirdAns.Text;
                falseAns3.Value = fourthAns.Text;
                cmd.Parameters.Add(trueAnswer);
                cmd.Parameters.Add(falseAns1);
                cmd.Parameters.Add(falseAns2);
                cmd.Parameters.Add(falseAns3);
            }

            else if (thirdIsTrue.Checked == true)
            {
                SqlParameter trueAnswer = new SqlParameter("@TRUEANSWER", SqlDbType.Char, 200);

                SqlParameter falseAns1 = new SqlParameter("@FALSEANS1", SqlDbType.Char, 200);

                SqlParameter falseAns2 = new SqlParameter("@FALSEANS2", SqlDbType.Char, 200);

                SqlParameter falseAns3 = new SqlParameter("@FALSEANS3", SqlDbType.Char, 200);
                trueAnswer.Value = thirdAns.Text;
                falseAns1.Value = firstAns.Text;
                falseAns2.Value = secAns.Text;
                falseAns3.Value = fourthAns.Text;
                cmd.Parameters.Add(trueAnswer);
                cmd.Parameters.Add(falseAns1);
                cmd.Parameters.Add(falseAns2);
                cmd.Parameters.Add(falseAns3);
            }

            else if (fourthIsTrue.Checked == true)
            {
                SqlParameter trueAnswer = new SqlParameter("@TRUEANSWER", SqlDbType.Char, 200);

                SqlParameter falseAns1 = new SqlParameter("@FALSEANS1", SqlDbType.Char, 200);

                SqlParameter falseAns2 = new SqlParameter("@FALSEANS2", SqlDbType.Char, 200);

                SqlParameter falseAns3 = new SqlParameter("@FALSEANS3", SqlDbType.Char, 200);
                trueAnswer.Value = fourthAns.Text;
                falseAns1.Value = firstAns.Text;
                falseAns2.Value = firstAns.Text;
                falseAns3.Value = thirdAns.Text;
                cmd.Parameters.Add(trueAnswer);
                cmd.Parameters.Add(falseAns1);
                cmd.Parameters.Add(falseAns2);
                cmd.Parameters.Add(falseAns3);
            }

           
            
            


            SqlParameter chapter_id = new SqlParameter("@CHAPTER_ID", SqlDbType.Int, 1);
            chapter_id.Value = chaptDropddl.SelectedValue;
            cmd.Parameters.Add(chapter_id);

            SqlParameter userID = new SqlParameter("@USERID", SqlDbType.Int, 1);
            userID.Value = Convert.ToInt32(Session["UserID"].ToString());
            cmd.Parameters.Add(userID);


            SqlParameter falseAnswerMessage = new SqlParameter("@FALSEANSWERMESSAGE", SqlDbType.VarChar, 200);
            falseAnswerMessage.Value = falseMessage.Text;
            cmd.Parameters.Add(falseAnswerMessage);

            SqlParameter caseOfError = new SqlParameter("@CASEOFERROR", SqlDbType.VarChar, 50);
            caseOfError.Value = DropDownList2.SelectedItem.ToString();
            cmd.Parameters.Add(caseOfError);

            con.Open();
            cmd.ExecuteNonQuery();

            refLabel.Text = "Επιτυχής προσθήκη άσκησης";

            mulChPronunc.Text = string.Empty;
            firstAns.Text = string.Empty;
            secAns.Text = string.Empty;
            thirdAns.Text = string.Empty;
            fourthAns.Text = string.Empty;

            firstIsTrue.Checked = false;
            secIsTrue.Checked = false;
            thirdIsTrue.Checked = false;
            fourthIsTrue.Checked = false;
            falseMessage.Text = string.Empty;

            con.Close();
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
    protected void chaptDropddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected = chaptDropddl.SelectedValue.ToString();

        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
        DropDownList2.DataBind();
    }
    protected void cancelbtn_Click(object sender, EventArgs e)
    {
        mulChPronunc.Text = string.Empty;
        firstAns.Text = string.Empty;
        secAns.Text = string.Empty;
        thirdAns.Text = string.Empty;
        fourthAns.Text = string.Empty;

        firstIsTrue.Checked = false;
        secIsTrue.Checked = false;
        thirdIsTrue.Checked = false;
        fourthIsTrue.Checked = false;
        falseMessage.Text = string.Empty;
    }
}