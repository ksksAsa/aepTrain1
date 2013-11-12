<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="MyProjectMark.aspx.cs" Inherits="Students_MyProjectMark" %>

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
            <asp:BoundField DataField="chapter_name" HeaderText="Ενότητα" 
                SortExpression="chapter_name" />
            <asp:BoundField DataField="mark" HeaderText="Βαθμολογία" SortExpression="mark" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT Chapters.chapter_name, StudentsProjects.mark FROM StudentsProjects INNER JOIN Chapters
         ON StudentsProjects.chapter_id = Chapters.chapter_id WHERE ([userID] = @userID) AND ([mark] IS NOT NULL)">
         <SelectParameters>
         <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

