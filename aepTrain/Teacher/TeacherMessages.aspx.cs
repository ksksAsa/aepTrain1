using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Text.RegularExpressions;

public partial class Teacher_TeacherMessages : System.Web.UI.Page
{
    public string limitChars(string myString)
    {
        if (myString.Length > 5) {
            myString = myString.Substring(0, 5);
        }
        return myString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) {
            ViewState["fullText"] = e.Row.Cells[2].Text;
            if (e.Row.Cells[2].Text.Length >= 30) {
                e.Row.Cells[2].Text = e.Row.Cells[2].Text.Substring(0, 30) + "...";
                e.Row.Cells[2].ToolTip = ViewState["fullText"].ToString();
            }
        }
    }
}