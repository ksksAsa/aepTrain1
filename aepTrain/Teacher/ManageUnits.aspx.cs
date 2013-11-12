using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ManageUnits : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList yesOrno = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("yesOrno"));

        e.NewValues.Add("enabled", yesOrno.SelectedItem.ToString());
        
    }
}