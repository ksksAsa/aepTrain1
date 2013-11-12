<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageForum.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Students_Forum_Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <table border="1" width="730px" cellpadding="5px">
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td align="right">
    Από: <%# Eval("CommentUserName") %> @ <%# Eval("CommentDateTime") %>
    </td>
    </tr>
    <tr>
    <td>
    <%# Eval("CommentMessage") %>
    </td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    <tr>
    <td>
    <a href="NewComment.aspx?id=<%# Request.QueryString["id"] %>">Σχολιάστε</a>
    </td>
    </tr>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Comments] WHERE ([PostID] = @PostID) ORDER BY [CommentDateTime] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="PostID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

