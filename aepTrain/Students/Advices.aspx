<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="Advices.aspx.cs" Inherits="Students_Advices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="TextBox1" runat="server" Height="282px" TextMode="MultiLine" 
        Width="569px"></asp:TextBox>
    <br />
    <br />
    <br />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="80px" 
        ImageUrl="~/images/back.jpg" onclick="ImageButton2_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton1" runat="server" Height="85px" 
        ImageUrl="~/images/forward.jpg" onclick="ImageButton1_Click"/>
    <br />
</asp:Content>

