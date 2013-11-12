<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="InsertMultipleChoiceQuest.aspx.cs" Inherits="Teacher_InsertMultipleChoiceQuest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="chaptDropddl" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="chapter_name" 
        DataValueField="chapter_id" 
        onselectedindexchanged="chaptDropddl_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Δώστε την εκφώνηση"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="mulChPronunc" runat="server" TextMode="MultiLine" 
        Width="302px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" 
        Text="Δώστε πιθανές απαντήσεις επιλέγοντας τη σωστή"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="firstAns" runat="server" TextMode="MultiLine"></asp:TextBox>
&nbsp;
    <asp:CheckBox ID="firstIsTrue" runat="server" />
    <br />
    <asp:TextBox ID="secAns" runat="server" TextMode="MultiLine"></asp:TextBox>
&nbsp;
    <asp:CheckBox ID="secIsTrue" runat="server" />
    <br />
    <asp:TextBox ID="thirdAns" runat="server" TextMode="MultiLine"></asp:TextBox>
&nbsp;
    <asp:CheckBox ID="thirdIsTrue" runat="server" />
    <br />
    <asp:TextBox ID="fourthAns" runat="server" TextMode="MultiLine"></asp:TextBox>
&nbsp;
    <asp:CheckBox ID="fourthIsTrue" runat="server" />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Επιλέξτε επίπεδο"></asp:Label>
    <br />
    <asp:RadioButtonList ID="multchLevel" runat="server">
        <asp:ListItem>Εύκολο</asp:ListItem>
        <asp:ListItem>Μέτριο</asp:ListItem>
        <asp:ListItem>Δύσκολο</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Δώστε ένα μήνυμα λάθους"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="falseMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Πιθανή αιτία λάθους"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="error" 
        DataValueField="error_id" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [PossibleErrors] WHERE ([chapter_id] = @chapter_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="chaptDropddl" Name="chapter_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
        DataFile="~/Teacher/PossibleErrors.xml" XPath="/Errors/Error[@chaptID='1']">
    </asp:XmlDataSource>
    <br />
    <br />
    <asp:Button ID="submitbtn" runat="server" onclick="submitbtn_Click" 
        Text="Υποβολή" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="cancelbtn" runat="server" onclick="cancelbtn_Click" 
        Text="Ακύρωση" />
    <br />
    <br />
    <asp:Label ID="refLabel" runat="server"></asp:Label>
</asp:Content>

