<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="UploadProject.aspx.cs" Inherits="Students_UploadProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Επέλεξε την ενότητα και στη συνέχεια ανέβασε το αρχείο"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="chapter_name" 
        DataValueField="chapter_id" AppendDataBoundItems="true" 
        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="0" Selected="True" Text="Επιλέξτε ενότητα" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Υποβολή εργασίας" 
        onclick="Button1_Click" />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" 
        Text="H εργασία ανέβηκε επιτυχώς. Η βαθμολογία θα αναρτηθεί στις βαθμολογίες εργασιών" Visible="false"></asp:Label>
    <br />
</asp:Content>

