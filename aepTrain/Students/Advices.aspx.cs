using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Students_Advices : System.Web.UI.Page
{
   public static int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            
                SqlCommand cmd = new SqlCommand("select * from Advices where error_id=(select error_id from PossibleErrors where error='" + Request.QueryString["advicefor"] + "')", con);
                SqlDataAdapter adciceadapt = new SqlDataAdapter(cmd);
                DataTable adviceTable = new DataTable();
                adciceadapt.Fill(adviceTable);
                if (i < adviceTable.Rows.Count)
                {
                    TextBox1.Text = adviceTable.Rows[i][1].ToString();
                }
                else {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Επιστροφή στην αρχική σελίδα');window.location.href='http://localhost:42268/aepTrain/Students/DefaultStudent.aspx';", true); 
                    
                }
            }
        
        catch (SqlException ex)
        {
            ex.StackTrace.ToString();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        i++;
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if(i>0)
        i--;
        
    }
}