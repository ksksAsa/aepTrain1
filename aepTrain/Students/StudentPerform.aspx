<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="StudentPerform.aspx.cs" Inherits="Students_StudentPerform" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="682px" 
        AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
        <asp:BoundField DataField="chapter_name" FooterText="chapter_name"
         SortExpression="chapter_name" HeaderText="Ενότητα" >
            <HeaderStyle HorizontalAlign="Left" Width="70px" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="totalscore" HeaderText="Επίδοση" 
                SortExpression="totalscore" />
            <asp:BoundField DataField="mostError" HeaderText="Συνήθες Λάθος" 
                SortExpression="mostError" >
            <HeaderStyle HorizontalAlign="Left" Width="70px" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT DISTINCT stats.[totalscore], stats.[mostError], chapts.[chapter_name]
        FROM [studentPerformStats] stats
        INNER JOIN Chapters chapts
        ON stats.chapter_id = chapts.chapter_id
        WHERE ([userID] = @userID)">
        <SelectParameters>
            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

