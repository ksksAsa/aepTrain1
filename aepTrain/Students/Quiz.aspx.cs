using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections;
using System.Configuration;
using System.Diagnostics;
using System.IO;


public partial class Students_Quiz : System.Web.UI.Page
{
    public static int numberOfTrueAnswers;

   public string myUnit;
    bool hasTrueFalse;
    bool hasMultipleChoce;
    bool hasFillTheblank;

    public static DataTable dt = new DataTable();

    //metablites gia na oristei i bathmologia

    public  int totalQuestions;
    public  double theScore;
    
    public  string mostFreqError;

    public   string studentsLevel;

    public List<string> caseOfErrList; 
    //orismos metabliton gia session
    public static List<errorInformation> errList;

    public static List<string> levelList;

    DataTable projTable = new DataTable();
    //dilosi metabliton gia to test sostou-lathous
    public static int i;
    SqlConnection con;
     
    SqlDataAdapter adapterTrueFalse;
    DataTable dataTableForTrueFalse = new DataTable();
    DataRow datRowForTrueFalse;
    public static string trueFalsePronunciation;
    public static string myTrueFalseAnswer;
   public static string trueFalseAnswer;
   public static string trueFalseMessage;
   public static string trueFalseCaseOfError;
   public static string truefalseLevel;
    //dilosi metablioton gia to test pollaplis epilogis

    public static int rowIndexMultiChoce;
    SqlDataAdapter adapterMultChoice;
    DataTable dataTableMultChoice = new DataTable();
    DataRow datRowForMultChoice;
    public static string multipleChoicePronunciation;
    public static string myMiltipleChoiceAnswer;
    public static string multplTrueAnsewr;
    string firstAns;
    string secAns;
    string thirdAns;
    public static string MultChoiceMessage;
    public static string MultipleChoiceCaseOfError;
    string[] allanswers = new string[4];
    public static string multipleLevel;
    //dilosi metabliton gia test simplirosis kenou

    public static int rowIndexFillTheBlank;
    SqlDataAdapter adapterFillTheBlank;
    DataTable dataTableFillTheBlank = new DataTable();
    DataRow datRowForFillTheBlank;
    public static string fillTheBlankPronunciation;
    public static string myFillTheBlankAnswer;
    public static string fillTheBlankTrueAns;
    public static string fillTheBlankCaseOfError;
    public static string fillBlankLevel;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            MultiView1.ActiveViewIndex = 0;
            i = -1;
            rowIndexMultiChoce = -1;
            rowIndexFillTheBlank = -1;
           
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        myUnit = Request.QueryString["unit"];
        
    }

    

    void next(object sender, System.EventArgs e) {
        MultiView1.ActiveViewIndex += 1;
    }
   
   
    protected void ddlchapters_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlchapters.Visible = false;
        MultiView1.Visible = true;
        bindTrueFalseTest();
        bindMultipleChoiceTest();
        bindFillTheBlankTest();
    }

    protected void bindTrueFalseTest()
    {
        i++;
       
        string selectTrueFalseQuery = "Select * from TrueFalseQuestions where chapter_id =" + myUnit + "";
        adapterTrueFalse = new SqlDataAdapter(selectTrueFalseQuery, con);
        adapterTrueFalse.Fill(dataTableForTrueFalse);
        if (i == (dataTableForTrueFalse.Rows.Count))
        {
            string mess = "Τέλος Ερωτήσεων Σωστού -Λάθους";
          
            MultiView1.ActiveViewIndex += 1;
            Session.Add("TFtotal", dataTableForTrueFalse.Rows.Count);
            
       
        }
        else
        {
            datRowForTrueFalse = dataTableForTrueFalse.Rows[i];
            trueFalsePronunciation = Convert.ToString(datRowForTrueFalse[1]);
            true_false_pronunc_lbl.Text = trueFalsePronunciation;
          
            trueFalseAnswer = datRowForTrueFalse[3].ToString().Trim();
            trueFalseMessage = Convert.ToString(datRowForTrueFalse[6]);
            trueFalseCaseOfError = Convert.ToString(datRowForTrueFalse[7]);
            truefalseLevel = Convert.ToString(datRowForTrueFalse[2]);
            con.Close();
        }
      
    }

    protected void bindMultipleChoiceTest()
    {
        rowIndexMultiChoce++;
      
        string selectMultipleChoiceQuery = "Select * from MultipleChoiceQuestions where chapter_id =" + myUnit + "";
        try
        {
            adapterMultChoice = new SqlDataAdapter(selectMultipleChoiceQuery, con);
            adapterMultChoice.Fill(dataTableMultChoice);
            if (rowIndexMultiChoce == (dataTableMultChoice.Rows.Count))
            {
                string mess = "Τέλος Ερωτήσεων Πολλαπλής Επιλογής";
                
                MultiView1.ActiveViewIndex += 1;
              
                Session.Add("MCtotal", dataTableMultChoice.Rows.Count);
               
                
            }
            else
            {
                datRowForMultChoice = dataTableMultChoice.Rows[rowIndexMultiChoce];
                multipleChoicePronunciation = Convert.ToString(datRowForMultChoice[1]);
                MltpChPronunclbl.Text = multipleChoicePronunciation;
                multplTrueAnsewr = datRowForMultChoice[3].ToString().Trim();
                firstAns = datRowForMultChoice[4].ToString().Trim();
                secAns = datRowForMultChoice[5].ToString().Trim();
                thirdAns = datRowForMultChoice[6].ToString().Trim();
                MultChoiceMessage = datRowForMultChoice[9].ToString().Trim();
                MultipleChoiceCaseOfError = datRowForMultChoice[10].ToString().Trim();
                multipleLevel = Convert.ToString(datRowForMultChoice[2]);
                allanswers[0] = multplTrueAnsewr;
                allanswers[1] = firstAns;
                allanswers[2] = secAns;
                allanswers[3] = thirdAns;

                mixArray(allanswers);

                rdbtnMultiplChoice.DataSource = allanswers;
                rdbtnMultiplChoice.DataBind();

            }
          
        }
        catch (Exception ex) {
            string meesag = "Δέν υπάρχουν πολλαπλής επιλογής";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + Convert.ToString(meesag) + "');", true);
           
        }
        finally{
            hasMultipleChoce = false;
           
        }
    }

    protected void mixArray(string[] array) {
        int index;
        string temp;
        Random rand = new Random();
        for (int i = 0; i < array.Length; i++) {
            index = rand.Next(array.Length);
            temp = array[i];
            array[i] = array[index];
            array[index] = temp;
        }
    }

    protected void bindFillTheBlankTest()
    {
        
            rowIndexFillTheBlank++;
            string selectFillTheBlankQuery = "Select * from FillTheBlankQuestions  where chapter_id =" + myUnit + "";
            try
            {
                adapterFillTheBlank = new SqlDataAdapter(selectFillTheBlankQuery, con);
                adapterFillTheBlank.Fill(dataTableFillTheBlank);
                if (rowIndexFillTheBlank == dataTableFillTheBlank.Rows.Count)
                {
                    string mess = "Τέλος Ερωτήσεων Συμπλήρωσης Κενού";
                   
                    Session.Add("FBtotal", dataTableFillTheBlank.Rows.Count);
                    getTheStudentsLevel();
                  
                    bindTheSummaryGridView();
                    
                  
                }

                else
                {
                    
                        datRowForFillTheBlank = dataTableFillTheBlank.Rows[rowIndexFillTheBlank];
                        fillTheBlankPronunciation = datRowForFillTheBlank[1].ToString();
                        lblFillTheblPronunc.Text = fillTheBlankPronunciation;
                        fillTheBlankTrueAns = datRowForFillTheBlank[3].ToString().Trim();
                        fillTheBlankCaseOfError = datRowForFillTheBlank[6].ToString();
                        fillBlankLevel = Convert.ToString(datRowForFillTheBlank[2]);
                    }
                
            }
            catch (Exception ex)
            {
                string meesag = "Δέν υπάρχουν συμπλήρωσης Κενού";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + Convert.ToString(meesag) + "');", true);

            }
        }
    


    protected void sbmtAnsBtn_Click(object sender, EventArgs e)
    {

        if (i == (dataTableForTrueFalse.Rows.Count - 1))
        {
            string mess = "Τέλος εγγραφών";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mess + "');", true);
        }
        else {
            
            checkTrueFalseAnswer();
            sbmtAnsBtn.Visible = false;
            }
        }

    protected void sbmtMultChans_Click(object sender, EventArgs e)
    {
        if (rowIndexMultiChoce == (dataTableMultChoice.Rows.Count - 1))
        {
            string mess = "Τέλος εγγραφών";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mess + "');", true);
        }
        else
        {
            checkMultipleChoiceAnswer();
            sbmtMultChans.Visible = false;
        }

    }

    protected void checkTrueFalseAnswer() {
        myTrueFalseAnswer = rdbtn_true_false_possible_answers.SelectedItem.Text;
        if (myTrueFalseAnswer.Equals(trueFalseAnswer) == false)
        {
            addResultsToSession();
          
            
            rdbtn_true_false_possible_answers.ClearSelection();

        }
        else {
            numberOfTrueAnswers++;
            levelList.Add(truefalseLevel);
            Session.Add("trueAns", numberOfTrueAnswers);
        }
         rdbtn_true_false_possible_answers.ClearSelection(); 
        this.bindTrueFalseTest();
    }

   protected void checkMultipleChoiceAnswer(){
       myMiltipleChoiceAnswer = rdbtnMultiplChoice.SelectedItem.Text;
       if (myMiltipleChoiceAnswer.Equals(multplTrueAnsewr) == false)
       {
           addResultsToSession();
           rdbtnMultiplChoice.ClearSelection();
       }
       else {
           numberOfTrueAnswers++;
           levelList.Add(multipleLevel);
           Session.Add("trueAns", numberOfTrueAnswers);
       }

       rdbtnMultiplChoice.ClearSelection();
       this.bindMultipleChoiceTest();
    }



    protected void rdbtn_true_false_possible_answers_SelectedIndexChanged(object sender, EventArgs e)
    {
        sbmtAnsBtn.Visible = true;
    }

    protected void rdbtnMultiplChoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        sbmtMultChans.Visible = true;
    }
    protected void sbmFillTheblnk_Click(object sender, EventArgs e)
    {
        if (rowIndexFillTheBlank == (dataTableFillTheBlank.Rows.Count - 1)) {
            string msg = "Τέλος Ερωτήσεων συμπλήρωσης κενού";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + msg + "');", true);
            
            
        }
        checkFilltheBlankAnswer();
        
    }

    protected void checkFilltheBlankAnswer()
    {
        myFillTheBlankAnswer = answerTxtbox.Text;
        if (myFillTheBlankAnswer.Equals(fillTheBlankTrueAns) == false)
        {
           
            addResultsToSession();
            answerTxtbox.Text = string.Empty;
        
        }
        else {
            numberOfTrueAnswers++;
            levelList.Add(fillBlankLevel);
            Session.Add("trueAns", numberOfTrueAnswers);
        }
        
        answerTxtbox.Text = string.Empty;
        
        this.bindFillTheBlankTest();
    }

    protected void addResultsToSession()
    {
        
        StackTrace stackTrace = new StackTrace();

        string calledMethod = stackTrace.GetFrame(1).GetMethod().Name;
        if (calledMethod.Equals("checkTrueFalseAnswer")) {

            errList.Add(new errorInformation(trueFalsePronunciation, myTrueFalseAnswer, trueFalseAnswer, trueFalseMessage, trueFalseCaseOfError));
        }

        else if (calledMethod.Equals("checkMultipleChoiceAnswer")) {
            errList.Add(new errorInformation(multipleChoicePronunciation, myMiltipleChoiceAnswer, multplTrueAnsewr, MultChoiceMessage, MultipleChoiceCaseOfError));   
        }
     
        else if (calledMethod.Equals("checkFilltheBlankAnswer"))
        {
            errList.Add(new errorInformation(fillTheBlankPronunciation, myFillTheBlankAnswer, fillTheBlankTrueAns, "Πρόσεχε τη θεωρία", fillTheBlankCaseOfError));
        }
        
       
    }

    protected void calculateTheScor() {
      
        totalQuestions = Convert.ToInt32(Session["TFtotal"]) + Convert.ToInt32(Session["MCtotal"]) + Convert.ToInt32(Session["FBtotal"]);
        theScore = ((double)numberOfTrueAnswers/(double)totalQuestions)*100;
        theScore = Math.Round(theScore, 2);
        
    }

    protected void generateTheErrorList() {
        caseOfErrList = new List<string>();
    foreach(errorInformation errInf in errList){
        caseOfErrList.Add(errInf.caserr);
    }
    }

    protected void getTheMostFreqError() {
        if (caseOfErrList.Count > 0)
        {
            var mostFreq = caseOfErrList.GroupBy(x => x)
             .Select(g => new { Value = g.Key, Count = g.Count() })
             .OrderByDescending(x => x.Count).
             First();
            mostFreqError = mostFreq.Value;
            Session["mostError"] = mostFreqError;
        }
    }

    protected void getTheStudentsLevel() {
        var studLevel = levelList.GroupBy(x => x)
            .Select(g => new { Value = g.Key, Count = g.Count() })
            .OrderByDescending(x => x.Count).First();
        studentsLevel = studLevel.Value;
        Session["level"] = studentsLevel;
    }

    protected void bindTheSummaryGridView()
    {


        
        
        
        DetailsView1.DataSource = errList;
        DetailsView1.DataBind();
        MultiView1.ActiveViewIndex += 1;
        bindTheProjectLink();
      
    }
    public static string projLink;
    public static string projectName;
    
    private void bindTheProjectLink()
    {
        string lev = "Εύκολο";

        SqlConnection conp = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
            conp.Open();
        string selectProject = "select * from ProjectsFiles where projectLevel=@level AND chapter_id=@id";
        SqlCommand command = new SqlCommand(selectProject, conp);
        command.Parameters.AddWithValue("@level", studentsLevel);
     
      DataSet ds = new DataSet();
   
      SqlDataReader reader = null;
      reader = command.ExecuteReader();
      if (reader.Read()) {

          projLink = reader["fullPath"].ToString();
          projectName = reader["fileName"].ToString();
         
         
          
      }
     
      conp.Close();
    }

    public class errorInformation
    {
       
        private string question;
        private string myAnswer;
        private string theThrueAnswer;
        private string theMessage;
        private string theErrorCase;

        

        public errorInformation(string quest, string myans, string trueans, string mess, string caserr)
        {
            this.question = quest;
            this.myAnswer = myans;
            this.theThrueAnswer = trueans;
            this.theMessage = mess;
            this.theErrorCase = caserr;
        }

        public string quest {
            get { return question; }
            set { question = value; }
        }

        public string myans {
            get { return myAnswer; }
            set { myAnswer = value; }
        }

        public string trueans {
            get { return theThrueAnswer; }
            set { theThrueAnswer = value; }
        }

        public string mess {
            get { return theMessage; }
            set { theMessage = value; }
        }

        public string caserr {
            get { return theErrorCase; }
            set { theErrorCase = value; }
        }

        }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
       
        DetailsView1.PageIndex = e.NewPageIndex;
        DetailsView1.DataSource = errList;
        DetailsView1.DataBind();

        
    }

    protected void insertPerformanceStatsTodatabase()
    {
        string usrnm = (string)Session["USERNAME"];
        string insertStatsql = "insert into studentPerformStats(userID,chapter_id,totalscore,mostError) values" +
            "((select Users.userID from Users where Users.username = '"+usrnm+"'),'"+myUnit+"','"+theScore.ToString()+"','"+mostFreqError+"')";
        
        SqlCommand cmdstats = new SqlCommand();
        cmdstats.Connection = con;
        cmdstats.CommandType = CommandType.Text;
        cmdstats.CommandText = insertStatsql;
        try
        {
            
            con.Open();
            cmdstats.ExecuteNonQuery();
           
        }
        catch (SqlException ex) {
            ex.StackTrace.ToString();
        }
        con.Close();
    }
    protected void beginTestBtn_Click(object sender, EventArgs e)
    {
        
        ddlchapters.Visible = false;
        MultiView1.Visible = true;
        bindTrueFalseTest();
        bindMultipleChoiceTest();
        bindFillTheBlankTest();
        this.beginTestBtn.Visible = false;
        errList = new List<errorInformation>();
        levelList = new List<string>();
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        generateTheErrorList();
        getTheMostFreqError();
        calculateTheScor();

        insertPerformanceStatsTodatabase();
       
        
        Response.Redirect("~/Students/Advices.aspx?advicefor="+HttpUtility.UrlEncode(mostFreqError));
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
         
        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        response.ClearContent();
        response.Clear();
        response.ContentType = "text/plain";
        response.AddHeader("Content-Disposition", "attachment; filename=" + projectName + ";");
        response.TransmitFile(projLink);
        response.Flush();
        response.End();
    }
}