using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Teacher_ProjectsByStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        int rowIndex = GridView1.SelectedIndex;
        string fullPath = GridView1.DataKeys[rowIndex].Values[0].ToString();
        string fileName = GridView1.DataKeys[rowIndex].Values[1].ToString();
        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        response.ClearContent();
        response.Clear();
        response.ContentType = "text/plain";
        response.AddHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
        response.TransmitFile(fullPath);
        response.Flush();
        response.End();
        
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int _selectedRowIndex = e.RowIndex;
       // HiddenField hidden = (HiddenField)
        int projID = (int)GridView1.DataKeys[_selectedRowIndex].Values[2];
        int rowIndex = GridView1.SelectedIndex;
      //  int projID = Convert.ToInt32( GridView1.DataKeys[rowIndex].Values[2]);
       // int projID = 4;
        TextBox txtForMark = (TextBox)(GridView1.Rows[e.RowIndex].FindControl("theMarkTextBox"));
        string newMark = txtForMark.Text.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
          //  con.Open();
            string upDate = "UPDATE StudentsProjects SET mark=" + newMark + " WHERE projectID=" + projID + " ";
          //  SqlCommand updateCommand = new SqlCommand(upDate, con);
          //  updateCommand.CommandType = CommandType.Text;
           // updateCommand.ExecuteNonQuery();
           // con.Close();
           // SqlDataSource1.Update();
            SqlDataSource1.UpdateCommand = upDate;
          //  GridView1.DataSource = SqlDataSource1;
            
          //  GridView1.DataBind();
        }
        catch { }
        //SqlDataSource1.Update();
    }
}