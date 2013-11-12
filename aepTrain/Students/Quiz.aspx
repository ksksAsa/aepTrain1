<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="Quiz.aspx.cs" Inherits="Students_Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="ddlchapters" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="chapter_name" DataValueField="chapter_id" 
        AutoPostBack="True" 
        onselectedindexchanged="ddlchapters_SelectedIndexChanged" 
        AppendDataBoundItems="true" Visible="False">
        <asp:ListItem Text="Επιλέξτε ενότητα" Selected="True" Value="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="beginTestBtn" runat="server" Height="38px" 
        onclick="beginTestBtn_Click" Text="Ξεκινήστε το τέστ" Width="204px" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters] WHERE ([enabled] = @enabled)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Ναί" Name="enabled" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:MultiView ID="MultiView1" runat="server" Visible="false">
    <asp:View ID="true_false_view" runat="server">
    <br />
    <br />

        <asp:Label ID="true_false_lbl" runat="server" Text="Ερωτήσεις Σωστό - Λάθος"></asp:Label>
        <br />
        <br />
        <asp:Label ID="true_false_pronunc_lbl" runat="server" Text="Εκφώνηση" 
            Width="751px" MinHeight="23px"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="rdbtn_true_false_possible_answers" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="rdbtn_true_false_possible_answers_SelectedIndexChanged">
        <asp:ListItem Text="Σωστό"></asp:ListItem>
        <asp:ListItem Text="Λάθος"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        
        <br />
        <br />
        <asp:Button ID="sbmtAnsBtn" runat="server" onclick="sbmtAnsBtn_Click" 
            Text="Υποβολή" Visible="false" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </asp:View>
    <asp:View ID="multiple_choice_view" runat="server">
        <asp:Label ID="mul_ch_lbl" runat="server" Text="Πολλαπλής Επιλογής"></asp:Label>
        <br />
        <br />
        <asp:Label ID="MltpChPronunclbl" runat="server" Text="Εκφώνηση" Width="713px" MinHeight="23px"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="rdbtnMultiplChoice" runat="server" AutoPostBack="True" 
            onselectedindexchanged="rdbtnMultiplChoice_SelectedIndexChanged">
            <asp:ListItem>Απάντηση1</asp:ListItem>
            <asp:ListItem>Απάντηση2</asp:ListItem>
            <asp:ListItem>Απάντηση3</asp:ListItem>
            <asp:ListItem>Απάντηση4</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="sbmtMultChans" runat="server" Text="Υποβολή" 
            onclick="sbmtMultChans_Click" />
        <br />
        <br />
    </asp:View>
    <asp:View ID="fill_the_blank_view" runat="server">
        <asp:Label ID="fill_the_blank_lbl" runat="server" Text="Συμπλήρωσης Κενού"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblFillTheblPronunc" runat="server" Text="Label" Width="500px" MinHeight="23px"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="answerTxtbox" runat="server" Height="23px" Width="224px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="sbmFillTheblnk" runat="server" onclick="sbmFillTheblnk_Click" 
            Text="Υποβολή" />
        <br />
        <br />
    </asp:View>
    <asp:View ID="errorSummary" runat="server">
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="600px" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical" AllowPaging="True" 
            HeaderText = "Λίστα Λαθών" AutoGenerateRows="False" 
            onpageindexchanging="DetailsView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField HeaderText="Ερώτηση" DataField="quest" />
                <asp:BoundField HeaderText="Απάντησες" DataField="myans" />
                <asp:BoundField HeaderText="Σωστή Απάντηση" DataField="trueans" />
                <asp:BoundField HeaderText="Μήνυμα" DataField="mess" />
                <asp:BoundField HeaderText="Αιτία" DataField="caserr" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black"/>
            <PagerSettings Mode="Numeric" />
        </asp:DetailsView>
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/clickhere.jpg" onclick="ImageButton1_Click" />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Κατέβασε την εργασία σου doc</asp:LinkButton>
        <br />
        <asp:Label ID="errLabel" runat="server"></asp:Label>
        <br />
    </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>

