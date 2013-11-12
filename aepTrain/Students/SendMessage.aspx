<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageStudent.master" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="Students_SendMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Επικοινωνήστε με τον διδάσκοντα"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Θέμα"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="messageSubj" runat="server" Height="20px" Width="375px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Κείμενο"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="messageBody" runat="server" TextMode="MultiLine" Width="380px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Αποστολή" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

