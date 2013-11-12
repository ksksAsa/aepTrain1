<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="InsertFillTheBlankQuest.aspx.cs" Inherits="Teacher_InsertFillTheBlankQuest" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#fillTheBlankPronunc").bind('copy', function (e) {
            alert('copying text!');
        });

        $("#fillTheBlankPronunc").bind('paste', function (e) {
            alert('pasting text!');
        });

        $("#fillTheBlankPronunc").bind('cut', function (e) {
            alert('cutting text!');
        });
    });
</script>

    <asp:DropDownList ID="ddlChapters" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="chapter_name" 
        DataValueField="chapter_id" 
        onselectedindexchanged="ddlChapters_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" 
        Text="Δώστε την ερώτηση επιλέγοντας τη λέξη που θα συμπληρωθεί"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="fillTheBlankPronunc" runat="server" Height="47px" 
        TextMode="MultiLine" Width="346px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Αντιγράψτε τη λέξη εδώ"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="missingWordTxtBox" runat="server" Height="33px" Width="183px" 
        ontextchanged="missingWordTxtBox_TextChanged"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Αλλαγή" onclick="Button1_Click" />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Επίπεδο Ερώτησης"></asp:Label>
    <br />
    <asp:RadioButtonList ID="rdbtFillTheblabel" runat="server">
        <asp:ListItem>Εύκολο</asp:ListItem>
        <asp:ListItem>Μέτριο</asp:ListItem>
        <asp:ListItem>Δύσκολο</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Αιτίες λάθους"></asp:Label>
    &nbsp;
    <br />
    <br />
    
    <asp:DropDownList ID="DropDownList1" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
        AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="error" 
        DataValueField="error_id">
        <asp:ListItem Value="" Text="" Enabled="false"></asp:ListItem>
    </asp:DropDownList>
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [PossibleErrors] WHERE ([chapter_id] = @chapter_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChapters" Name="chapter_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   
   <asp:XmlDataSource ID="XmlDataSource1" runat="server"
           DataFile="~/Teacher/PossibleErrors.xml" XPath="/Errors/Error[@chaptID='1']">
    </asp:XmlDataSource>
    
    <br />
    <asp:Button ID="sbmbtm" runat="server" onclick="sbmbtm_Click" Text="Υποβολή" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="cancbtn" runat="server" onclick="cancbtn_Click" 
        Text="Ακύρωση" />
    <br />
    <br />
    <asp:Label ID="refLbl" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </asp:Content>

