using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_MasterPageForum : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            seslbl.Text = Session["USERNAME"].ToString();
        }
        else
        {
            Response.Redirect("~/loginOrRegister/Login.aspx");
        }
    }

    protected void logoutBtn_Click(object sender, EventArgs e)
    {

        Session.Abandon();

    }
}
