using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Teacher_ManageExercises : System.Web.UI.Page
{
    DropDownList caseOfErr;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        

    }
    protected void chaptDrDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
        
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList dropforLevel = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("dropforLevel"));

        caseOfErr = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("ddlPossErr"));

        DropDownList ddltrueOrFalse = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("ddltrueOrFalse"));
        
        e.NewValues.Add("level", dropforLevel.Text);

        e.NewValues.Add("caseOfError", caseOfErr.SelectedItem.ToString());

        e.NewValues.Add("answerIs", ddltrueOrFalse.SelectedItem.ToString());
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList ddlevelForMultCh = (DropDownList)(GridView2.Rows[e.RowIndex].FindControl("ddlevelForMultCh"));
        caseOfErr = (DropDownList)(GridView2.Rows[e.RowIndex].FindControl("ddForMultChoCaseOferror"));
        e.NewValues.Add("caseOfError", caseOfErr.SelectedItem.ToString());
        e.NewValues.Add("level", ddlevelForMultCh.SelectedItem.ToString());
    }


    

    protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList ddlevelForFillTheblnk = (DropDownList)(GridView3.Rows[e.RowIndex].FindControl("ddlevelForFillTheblnk"));
        caseOfErr = (DropDownList)(GridView3.Rows[e.RowIndex].FindControl("ddForFillTheBlCaseOferror"));
        e.NewValues.Add("level", ddlevelForFillTheblnk.SelectedItem.ToString());
        e.NewValues.Add("caseOfError", caseOfErr.SelectedItem.ToString());
    }

    protected string[] Level_Cases
    {
        get { return new string[] { "Εύκολο", "Μέτριο", "Δύσκολο" }; }
    }

    protected int GetselectedLevelCase(Object level)
    {
        return Array.IndexOf(Level_Cases, level.ToString());
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
        
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ManageQuestsMultiView.ActiveViewIndex = DropDownList1.SelectedIndex;
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
    }


    protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected = chaptDrDown.SelectedValue;
        XmlDataSource1.XPath = "/Errors/Error[@chaptID=" + "'" + selected + "']";
    }
    
}