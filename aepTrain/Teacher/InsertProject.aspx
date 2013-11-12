<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="InsertProject.aspx.cs" Inherits="Teacher_InsertProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="chapter_name" 
        DataValueField="chapter_id" AppendDataBoundItems="true" 
        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="0" Text="Επιλέξτε ενότητα" Selected="True"></asp:ListItem>
    </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    
    </td>
   <td>
    <asp:DropDownList ID="DropDownList2" runat="server" Height="16px">
    <asp:ListItem Value="0" Text="Επιλέξτε επίπεδο"></asp:ListItem>
    <asp:ListItem Value="Εύκολο" Text="Εύκολο"></asp:ListItem>
    <asp:ListItem Value="Μέτριο" Text="Μέτριο"></asp:ListItem>
    <asp:ListItem Value="Δύσκολο" Text="Δύσκολο"></asp:ListItem>
    </asp:DropDownList>
   
    <br />
    <br />
    <br />
    <br />
    </td>
    </tr>
    <tr>
    <td>
    <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </td>
    <td></td>
    </tr>
    <tr>
    <td>
    <asp:Button ID="Button1" runat="server" Text="Εισαγωγή" onclick="Button1_Click" />
    </td><td></td>
    </tr>
    
    </table>
    <br />
    <br />
    <br />
    <br />
     <asp:Label ID="LabelToKeepFileName" runat="server" Visible="False"></asp:Label>
</asp:Content>

