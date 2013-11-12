<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageForum.master" AutoEventWireup="true" CodeFile="DefaultForum.aspx.cs" Inherits="Students_Forum_DefaultForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
    <HeaderTemplate>
    <table border="1" width="730px" cellpadding="5px" border-color:green>
    <tr>
    <td>
    Ενότητα:
    </td>
    <td>
    Τελευταία άρθρο:
    </td>
    <td>
    Από:
    </td>
    <td>
    Ημερομηνία:
    </td>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td>
    <a href="Topics.aspx?id=<%# Eval("TopicID") %>"><%# Eval("TopicName") %></a>
    </td>
    <td><%# Eval("LastPostTitle") %></td>
    <td><%# Eval("LastPostUserName") %></td>
    <td><%# Eval("LastPostDateTime") %></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Topics]"></asp:SqlDataSource>
</asp:Content>

