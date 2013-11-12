<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="InsertTheory.aspx.cs" Inherits="Teacher_InsertTheory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" 
    Text="Επιλέξτε ενότητα και ανεβάστε το αρχείο της θεωρίας"></asp:Label>
<br />
<asp:DropDownList ID="chaptersList1" runat="server" 
    DataSourceID="allChaptersInList" DataTextField="chapter_name" DataValueField="chapter_id">
</asp:DropDownList>
<asp:SqlDataSource ID="allChaptersInList" runat="server" 
    ConnectionString="<%$ ConnectionStrings:allChaptersInList %>" 
    SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
<br />
<br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
    <asp:View ID="insertTheryView" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server"/>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Προεπισκόπηση"/>
    <br />
    <br />
    <asp:TextBox ID="PreviewTheoryTextBox" runat="server" TextMode="MultiLine" 
        Height="282px" Width="609px"></asp:TextBox>
    <br />
        <br />
        <asp:Button ID="goToExamplesbtn" runat="server" onclick="goToExamplesbtn_Click" 
            Text="Επόμενο" />
    <br />
    </asp:View>
   <asp:View ID="insertExamplesView" runat="server">
        <asp:Label ID="Label2" runat="server" Text="Προσθέστε παραδείγματα"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Γράψτε το Παράδειγμα ή επικολήστε"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="ExampleTextBox" runat="server" Height="143px" TextMode="MultiLine" 
            Width="559px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Νέο Παράδειγμα" 
            onclick="Button2_Click" />
        <br />
        <br />
        <asp:Button ID="goToGiveAdvice" runat="server" Text="Εισαγωγή και επόμενο" 
            onclick="goToGiveAdvice_Click" />
        <br />
   </asp:View>

   <asp:View ID="InsertsumbitsMultiview" runat="server">
       <asp:Label ID="Label4" runat="server" Text="Εισάγετε προτεινόμενα ανάλογα το λάθος"></asp:Label>
       <br />
       <br />
       <asp:DropDownList ID="DrdlErrors" runat="server" DataSourceID="SqlDataSource1" 
           DataTextField="error" DataValueField="error_id">
       </asp:DropDownList>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
           SelectCommand="SELECT * FROM [PossibleErrors] WHERE ([chapter_id] = @chapter_id)">
           <SelectParameters>
               <asp:ControlParameter ControlID="chaptersList1" Name="chapter_id" 
                   PropertyName="SelectedValue" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
       <br />
       <asp:TextBox ID="adviceTextBox" runat="server" TextMode="MultiLine" 
           Height="79px" Width="524px"></asp:TextBox>
       <br />
       <br />
       <asp:Button ID="newAdvicebtn" runat="server" Text="Προσθέστε νέο" 
           onclick="newAdvicebtn_Click" />
       <br />
       <br />
   <asp:Button ID="submitTheory" runat="server" onclick="submitTheory_Click" 
        Text="Εισαγωγή και αποθήκευση" />
   </asp:View>
    </asp:MultiView>
    
    <br />
    <br />
    <asp:Label ID="lblTheorySuccess" runat="server"></asp:Label>
    <br />
    <asp:Label ID="LabelToKeepFileName" runat="server" Visible="False"></asp:Label>
    <br />
<br />
</asp:Content>

