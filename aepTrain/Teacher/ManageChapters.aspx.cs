using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ManageChapters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList ddlEnabled = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("ddlEnabled"));
        e.NewValues.Add("enabled",ddlEnabled.SelectedItem.ToString());
    }

    protected string[] enableCase
    {
        get { return new string[] { "Όχι", "Ναί" }; }
    }

    protected int getEnabled(object enabled)
    {
        return Array.IndexOf(enableCase, enabled.ToString());
    }
}