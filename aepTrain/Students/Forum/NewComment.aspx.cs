using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Students_Forum_NewComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string commentUserName = Session["USERNAME"].ToString();
        string commentMessage = ((TextBox)LoginView1.FindControl("txtMessage")).Text;
        DateTime commentDateTime = DateTime.Now;
        int PostId = int.Parse(Request.QueryString["id"]);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(
            "INSERT INTO Comments(PostID,CommentUserName,CommentMessage,CommentDateTime)" +
            "VALUES(@PostId,@CommentUserName,@CommentMessage,@CommentDateTime)", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", PostId);
        cmd.Parameters.AddWithValue("@CommentUserName", commentUserName);
        cmd.Parameters.AddWithValue("@CommentMessage", commentMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", commentDateTime);

        using (conn) {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("Post.aspx?id=" + PostId.ToString());
    }
}