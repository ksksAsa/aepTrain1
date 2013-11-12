using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Students_Forum_NewPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataReader rdr = null;
        string postUserName = Session["USERNAME"].ToString();
        string postTitle = ((TextBox)LoginView1.FindControl("txtTitle")).Text;
        string postMessage = ((TextBox)LoginView1.FindControl("txtMessage")).Text;
        DateTime postDateTime = DateTime.Now;
        int topicID = int.Parse(Request.QueryString["id"]);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand(
            "INSERT INTO Posts(TopicID,PostTitle,PostUserName,PostDateTime) VALUES" +
            "(@TopicId,@PostTitle,@PostUserName,@PostDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", topicID);
        cmd.Parameters.AddWithValue("@PostTitle", postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", postUserName);
        cmd.Parameters.AddWithValue("@PostDateTime", postDateTime);

        using (conn) {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        int postId = 0;
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cmd = new SqlCommand(
            "SELECT * FROM Posts WHERE TopicID=@TopicId AND PostTitle=@PostTitle AND PostUserName=@PostUserName AND PostDateTime=@PostDateTime", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", topicID);
        cmd.Parameters.AddWithValue("@PostTitle", postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", postUserName);
        cmd.Parameters.AddWithValue("@PostDateTime", postDateTime.ToString());

        using (conn) {
            conn.Open();
            rdr = cmd.ExecuteReader();
            if (rdr.Read()) {
                postId = int.Parse(rdr["PostID"].ToString());
            }
        }

        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cmd = new SqlCommand(
            "INSERT INTO Comments(PostID,CommentUserName,CommentMessage,CommentDateTime)" +
            "VALUES(@PostId,@CommentUserName,@CommentMessage,@CommentDateTime)", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", postId);
        cmd.Parameters.AddWithValue("@CommentUserName", postUserName);
        cmd.Parameters.AddWithValue("@CommentMessage", postMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", postDateTime);

        using (conn) { 
        conn.Open();
        cmd.ExecuteNonQuery();
        }

        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        cmd = new SqlCommand(
            "Update Topics Set LastPostTitle=@LastPostTitle,LastPostUserName=@LastPostUserName," +
            "LastPostDateTime=@LastPostDateTime WHERE TopicID=@TopicId", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@LastPostTitle", postTitle);
        cmd.Parameters.AddWithValue("@LastPostUserName", postUserName);
        cmd.Parameters.AddWithValue("@LastPostDateTime", postDateTime);
        cmd.Parameters.AddWithValue("@TopicId", topicID);

        using (conn) {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("Topics.aspx?id=" + topicID.ToString());
    }
}