<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ManageExercises.aspx.cs" Inherits="Teacher_ManageExercises" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="chaptDrDown" runat="server" DataSourceID="SqlDataSource1" 
    DataTextField="chapter_name" DataValueField="chapter_id" 
        onselectedindexchanged="chaptDrDown_SelectedIndexChanged" 
        AppendDataBoundItems="True" AutoPostBack="True">
        <asp:ListItem Text="Επιλέξτε ενότητα" Selected="True" Value="0"></asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="true">
        <asp:ListItem>Σωστού Λάθους</asp:ListItem>
        <asp:ListItem>Πολλαπλής Επιλογής</asp:ListItem>
        <asp:ListItem>Συμπλήρωσης Κενού</asp:ListItem>
    </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:allChaptersInList %>" 
    SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
<br />
<asp:MultiView ID="ManageQuestsMultiView" runat="server">
        <asp:View ID="ManageTrueFalseView" runat="server">
<asp:XmlDataSource ID="XmlDataSource1" runat="server" 
         DataFile="~/Teacher/PossibleErrors.xml" XPath = "/Errors/Error[@chaptID=1]">
         </asp:XmlDataSource>
<div style="overflow-x:auto; width:800px">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="truefalseQuestID" DataSourceID="SqlDataSource2" 
        EmptyDataText="There are no data records to display." Font-Size="Medium" 
        ForeColor="#333333" onrowupdating="GridView1_RowUpdating" 
        AllowPaging="True" AllowSorting="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowediting="GridView1_RowEditing">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" DeleteImageUrl="~/images/delete.jpg" EditImageUrl="~/images/edit.jpg" />
            <asp:TemplateField HeaderText="Εκφώνηση" SortExpression="pronunciation">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("pronunciation") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("pronunciation") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Επίπεδο" SortExpression="level">
                <EditItemTemplate>
                    <asp:DropDownList ID="dropforLevel" runat="server" SelectedIndex='<%# GetselectedLevelCase(Eval("level")) %>' 
                    DataSource = '<%# Level_Cases %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="Επίπεδο" Value="0" Enabled="true"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("level") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Σ ή Λ" SortExpression="answerIs">
                <EditItemTemplate>
                    
                    <asp:DropDownList ID="ddltrueOrFalse" runat="server">
                    <asp:ListItem Text="Σωστό" Value="Σωστό"></asp:ListItem>
                    <asp:ListItem Text="Λάθος" Value="Λάθος"></asp:ListItem>
                    </asp:DropDownList>  
                
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("answerIs") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Μήνυμα λάθους" 
                SortExpression="falseAnswerMessage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" 
                        Text='<%# Bind("falseAnswerMessage") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("falseAnswerMessage") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Αιτία Λάθους" SortExpression="caseOfError">
                <EditItemTemplate>
                <asp:DropDownList ID="ddlPossErr" 
                    DataTextField="value"    runat="server"
                       AppendDataBoundItems="true" DataSourceID="XmlDataSource1">
                       <asp:ListItem Text="Αιτία Λάθους" Value="0" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("caseOfError") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [TrueFalseQuestions] WHERE [truefalseQuestID] = @truefalseQuestID" 
        InsertCommand="INSERT INTO [TrueFalseQuestions] ([pronunciation], [level], [answerIs], [chapter_id], [userID], [falseAnswerMessage], [caseOfError]) VALUES (@pronunciation, @level, @answerIs, @chapter_id, @userID, @falseAnswerMessage, @caseOfError)" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT [truefalseQuestID], [pronunciation], [level], [answerIs], [chapter_id], [userID], [falseAnswerMessage], [caseOfError] FROM [TrueFalseQuestions] WHERE ([chapter_id] = @chapter_id)" 
        UpdateCommand="UPDATE [TrueFalseQuestions] SET [pronunciation] = @pronunciation, [level] = @level, [answerIs] = @answerIs, [falseAnswerMessage] = @falseAnswerMessage, [caseOfError] = @caseOfError WHERE [truefalseQuestID] = @truefalseQuestID">
        <DeleteParameters>
            <asp:Parameter Name="truefalseQuestID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pronunciation" Type="String" />
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="answerIs" Type="String" />
            <asp:Parameter Name="chapter_id" Type="Int32" />
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="falseAnswerMessage" Type="String" />
            <asp:Parameter Name="caseOfError" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="chaptDrDown" Name="chapter_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="pronunciation" Type="String" />
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="answerIs" Type="String" />
            <asp:Parameter Name="chapter_id" Type="Int32" />
            <asp:Parameter Name="userID" Type="Int32" />
            <asp:Parameter Name="falseAnswerMessage" Type="String" />
            <asp:Parameter Name="caseOfError" Type="String" />
            <asp:Parameter Name="truefalseQuestID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
     </asp:View>
     <asp:View ID="manageTrueFalse" runat="server">
     <asp:Label ID="manTf" Text="Επεξεργασία ερωτήσεων πολλαπλής επιλογής" runat="server"></asp:Label>
         <br />
         <br />
         <div style="overflow-x:auto;width:800px">
         <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
             AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
             DataKeyNames="multChoiceID" DataSourceID="SqlDataSource3" ForeColor="#333333" 
             GridLines="None" Font-Size="Small" onrowupdating="GridView2_RowUpdating" 
                 onrowediting="GridView2_RowEditing" 
                 onselectedindexchanged="GridView2_SelectedIndexChanged">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" EditImageUrl="~/images/edit.jpg" DeleteImageUrl="~/images/delete.jpg" />
                 <asp:TemplateField HeaderText="Εκφώνηση" SortExpression="multChPronunciation">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"
                             Text='<%# Bind("multChPronunciation") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("multChPronunciation") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Επίπεδο" SortExpression="level">
                     <EditItemTemplate>
                         <asp:DropDownList ID="ddlevelForMultCh" runat="server" 
                         SelectedIndex='<%# GetselectedLevelCase(Eval("level")) %>' 
                    DataSource = '<%# Level_Cases %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="Επίπεδο" Value="0" Selected="True"></asp:ListItem>
                         </asp:DropDownList>
                        
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("level") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Σωστή Απάντηση" SortExpression="trueAnswer">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("trueAnswer") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label3" runat="server" Text='<%# Bind("trueAnswer") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="1η Λανθασμένη" SortExpression="falseAns1">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("falseAns1") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label4" runat="server" Text='<%# Bind("falseAns1") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="2η Λανθασμένη" SortExpression="falseAns2">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("falseAns2") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label5" runat="server" Text='<%# Bind("falseAns2") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="3η Λανθασμένη" SortExpression="falseAns3">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("falseAns3") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label6" runat="server" Text='<%# Bind("falseAns3") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Μήνυμα Λάθους" 
                     SortExpression="falseAnswerMessage">
                     <EditItemTemplate>
                         
                        
                         <asp:TextBox ID="TextBox7" runat="server" 
                             Text='<%# Bind("falseAnswerMessage") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label7" runat="server" Text='<%# Bind("falseAnswerMessage") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Αιτία Λάθους" SortExpression="caseOfError">
                     <EditItemTemplate>
                          <asp:DropDownList ID="ddForMultChoCaseOferror" runat="server" 
                          DataTextField="value" 
                       AppendDataBoundItems="true" DataSourceID="XmlDataSource1">
                        <asp:ListItem Text="Αιτία Λάθους" Value="0" Selected="true"></asp:ListItem>

                         </asp:DropDownList> 
                         
                        
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label8" runat="server" Text='<%# Bind("caseOfError") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         </div>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             DeleteCommand="DELETE FROM [MultipleChoiceQuestions] WHERE [multChoiceID] = @multChoiceID" 
             InsertCommand="INSERT INTO [MultipleChoiceQuestions] ([multChPronunciation], [level], [trueAnswer], [falseAns1], [falseAns2], [falseAns3], [chapter_id], [userID], [falseAnswerMessage], [caseOfError]) VALUES (@multChPronunciation, @level, @trueAnswer, @falseAns1, @falseAns2, @falseAns3, @chapter_id, @userID, @falseAnswerMessage, @caseOfError)" 
             SelectCommand="SELECT * FROM [MultipleChoiceQuestions] WHERE ([chapter_id] = @chapter_id)" 
             UpdateCommand="UPDATE [MultipleChoiceQuestions] SET [multChPronunciation] = @multChPronunciation, [level] = @level, [trueAnswer] = @trueAnswer, [falseAns1] = @falseAns1, [falseAns2] = @falseAns2, [falseAns3] = @falseAns3,  [falseAnswerMessage] = @falseAnswerMessage, [caseOfError] = @caseOfError WHERE [multChoiceID] = @multChoiceID">
             <DeleteParameters>
                 <asp:Parameter Name="multChoiceID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="multChPronunciation" Type="String" />
                 <asp:Parameter Name="level" Type="String" />
                 <asp:Parameter Name="trueAnswer" Type="String" />
                 <asp:Parameter Name="falseAns1" Type="String" />
                 <asp:Parameter Name="falseAns2" Type="String" />
                 <asp:Parameter Name="falseAns3" Type="String" />
                 <asp:Parameter Name="chapter_id" Type="Int32" />
                 <asp:Parameter Name="userID" Type="Int32" />
                 <asp:Parameter Name="falseAnswerMessage" Type="String" />
                 <asp:Parameter Name="caseOfError" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:ControlParameter ControlID="chaptDrDown" Name="chapter_id" 
                     PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="multChPronunciation" Type="String" />
                 <asp:Parameter Name="level" Type="String" />
                 <asp:Parameter Name="trueAnswer" Type="String" />
                 <asp:Parameter Name="falseAns1" Type="String" />
                 <asp:Parameter Name="falseAns2" Type="String" />
                 <asp:Parameter Name="falseAns3" Type="String" />
                 <asp:Parameter Name="chapter_id" Type="Int32" />
                 <asp:Parameter Name="userID" Type="Int32" />
                 <asp:Parameter Name="falseAnswerMessage" Type="String" />
                 <asp:Parameter Name="caseOfError" Type="String" />
                 <asp:Parameter Name="multChoiceID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <br />
     <br />
     </asp:View>
     <asp:View ID="manageFillTheBlank" runat="server">
     <asp:Label ID="manfb" Text="Επεξεργασία ερωτήσεων συμπλήρωσης κενού" runat="server"></asp:Label>
         <br />
         <br />
         <div style="overflow-x:auto;width:800px">
         <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
             AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
             DataKeyNames="fillTheBlankQuestID" DataSourceID="SqlDataSource4" 
             Font-Size="Medium" GridLines="None" 
             onrowediting="GridView3_RowEditing" 
             onselectedindexchanged="GridView3_SelectedIndexChanged" 
             onrowupdating="GridView3_RowUpdating" ForeColor="#333333">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                     ButtonType="Image" DeleteImageUrl="~/images/delete.jpg" 
                     EditImageUrl="~/images/edit.jpg" >
                 <ItemStyle Width="100px" />
                 </asp:CommandField>
                 <asp:TemplateField HeaderText="Εκφώνηση" 
                     SortExpression="fillTheBlankQuestPronunc">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"
                             Text='<%# Bind("fillTheBlankQuestPronunc") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" 
                             Text='<%# Bind("fillTheBlankQuestPronunc") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle Width="180px" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Επιπεδο" SortExpression="level">
                     <EditItemTemplate>
                        <asp:DropDownList ID="ddlevelForFillTheblnk" runat="server" 
                         SelectedIndex='<%# GetselectedLevelCase(Eval("level")) %>' 
                    DataSource = '<%# Level_Cases %>' AppendDataBoundItems="true">
                   
                    <asp:ListItem  Text="Επιλέξτε επίπεδο" Selected="True" Value="0">
                    </asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("level") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Λεξη που λείπει" 
                     SortExpression="fillTheBlankMissingWord">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" 
                             Text='<%# Bind("fillTheBlankMissingWord") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label3" runat="server" 
                             Text='<%# Bind("fillTheBlankMissingWord") %>'></asp:Label>
                     </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Αιτία Λάθους" SortExpression="caseOfError">
                     <EditItemTemplate>
                        <asp:DropDownList ID="ddForFillTheBlCaseOferror" runat="server" 
                          DataTextField="value" 
                       AppendDataBoundItems="true" DataSourceID="XmlDataSource1">
                       <asp:ListItem Text="Αιτία Λάθους" Value="0" Selected="true"></asp:ListItem>
                       </asp:DropDownList>
                     </EditItemTemplate><ItemTemplate>
                         <asp:Label ID="Label4" runat="server" Text='<%# Bind("caseOfError") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         </div>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
             DeleteCommand="DELETE FROM [FillTheBlankQuestions] WHERE [fillTheBlankQuestID] = @fillTheBlankQuestID" 
             InsertCommand="INSERT INTO [FillTheBlankQuestions] ([fillTheBlankQuestPronunc], [level], [fillTheBlankMissingWord], [chapter_id], [userID], [caseOfError]) VALUES (@fillTheBlankQuestPronunc, @level, @fillTheBlankMissingWord, @chapter_id, @userID, @caseOfError)" 
             SelectCommand="SELECT * FROM [FillTheBlankQuestions] WHERE ([chapter_id] = @chapter_id)" 
             UpdateCommand="UPDATE [FillTheBlankQuestions] SET [fillTheBlankQuestPronunc] = @fillTheBlankQuestPronunc, [level] = @level, [fillTheBlankMissingWord] = @fillTheBlankMissingWord, [caseOfError] = @caseOfError WHERE [fillTheBlankQuestID] = @fillTheBlankQuestID">
             <DeleteParameters>
                 <asp:Parameter Name="fillTheBlankQuestID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="fillTheBlankQuestPronunc" Type="String" />
                 <asp:Parameter Name="level" Type="String" />
                 <asp:Parameter Name="fillTheBlankMissingWord" Type="String" />
                 <asp:Parameter Name="chapter_id" Type="Int32" />
                 <asp:Parameter Name="userID" Type="Int32" />
                 <asp:Parameter Name="caseOfError" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:ControlParameter ControlID="chaptDrDown" Name="chapter_id" 
                     PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="fillTheBlankQuestPronunc" Type="String" />
                 <asp:Parameter Name="level" Type="String" />
                 <asp:Parameter Name="fillTheBlankMissingWord" Type="String" />
                 <asp:Parameter Name="chapter_id" Type="Int32" />
                 <asp:Parameter Name="userID" Type="Int32" />
                 <asp:Parameter Name="caseOfError" Type="String" />
                 <asp:Parameter Name="fillTheBlankQuestID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
     </asp:View>
    </asp:MultiView>

</asp:Content>

