<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Insert-True-False-Quest.aspx.cs" Inherits="Teacher_Insert_True_False_Quest" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <asp:Label ID="Label1" runat="server" Text="Επιλέξτε ενότητα"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="dropDownChapters" runat="server" 
        DataSourceID="chapterNamesDataSource" DataTextField="chapter_name" 
        DataValueField="chapter_id" AutoPostBack="True" 
        onselectedindexchanged="dropDownChapters_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="chapterNamesDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:allChaptersInList %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Εκφώνηση"></asp:Label>
    <br />
    <br />
&nbsp;
    <asp:TextBox ID="trueFalsePronuntion" runat="server" TextMode="MultiLine" 
        Height="64px" Width="363px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldPronunce" 
        runat="server" ControlToValidate="trueFalsePronuntion" 
        ErrorMessage="Πρέπει να δώσετε μια εκφώνηση"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
    <asp:Label ID="Label6" runat="server" Text="Επίπεδο Δυσκολίας"></asp:Label>
    <br />
    
    <br />
    <asp:RadioButtonList ID="checkLevelrdb" runat="server">
        <asp:ListItem Value="Εύκολο">Εύκολo</asp:ListItem>
        <asp:ListItem Value="Μέτριο">Μέτριο</asp:ListItem>
        <asp:ListItem Value="Δύσκολο">Δύσκολo</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" 
        Text="Τσεκάρετε αν είναι σωστή ή λανθασμένη"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />
&nbsp;<asp:Label ID="Label4" runat="server" Text="α)"></asp:Label>
&nbsp;&nbsp;&nbsp;<asp:Label ID="isTrueLabel" runat="server" Text="Σωστό"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:CheckBox ID="isTrueChk" runat="server" />
    <br />
&nbsp;<asp:Label ID="Label5" runat="server" Text="β)"></asp:Label>
&nbsp;&nbsp;<asp:Label ID="IsFalseLabel" runat="server" Text="Λάθος"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CheckBox ID="isFalseChk" runat="server" />
    <br />
    <br />
&nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text="Δώστε ένα μήνυμα λάθους"></asp:Label>
    <br />
&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;
    <asp:TextBox ID="falAnsMessTxtBox" runat="server" TextMode="MultiLine" 
        Width="268px"></asp:TextBox>
    <br />
    <br />
&nbsp;&nbsp;
    <asp:Label ID="Label8" runat="server" Text="Πιθανές Αιτίες Λάθους"></asp:Label>
    <br />
    <br />
    &nbsp;&nbsp;
    <asp:DropDownList ID="PossibleErrorsDropDnL" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="error" 
        DataValueField="error_id" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [PossibleErrors] WHERE ([chapter_id] = @chapter_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dropDownChapters" Name="chapter_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
        DataFile="~/Teacher/PossibleErrors.xml" XPath="/Errors/Error[@chaptID='1']">
    </asp:XmlDataSource>
    <br />
    <br />
&nbsp; 
    <asp:Button ID="sbmTrueFalseBtn" runat="server" Text="Υποβολή" 
        onclick="sbmTrueFalseBtn_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
    <asp:Button ID="cancelTFbtn" runat="server" Text="Ακύρωση" 
        onclick="cancelTFbtn_Click" />
   
    <br />
    <asp:Label ID="referenceLabel" runat="server" Text="Αναφορά"></asp:Label>
    <br />
   
</asp:Content>

