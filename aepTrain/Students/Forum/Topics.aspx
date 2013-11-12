<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageForum.master" AutoEventWireup="true" CodeFile="Topics.aspx.cs" Inherits="Students_Forum_Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <table border="1" width="730px" cellpadding="5px">
    <tr>
    <td colspan="2">
    <a href="NewPost.aspx?id=<%= Request.QueryString["id"] %>">Νέο άρθρο</a>
    </td>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td>
    <a href="Post.aspx?id=<%# Eval("PostID") %>"><%#Eval("PostTitle") %></a>
    </td>
    <td>
    Από: <%# Eval("PostUserName") %>@<%# Eval("PostDateTime").ToString() %>
    </td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Posts] WHERE ([TopicID] = @TopicID) ORDER BY [PostDateTime] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="TopicID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

