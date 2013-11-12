<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageForum.master" AutoEventWireup="true" CodeFile="NewPost.aspx.cs" Inherits="Students_Forum_NewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server">
            </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <table>
                <tr>
                    <td>
                        Τίτλος</td>
                    <td>
                        <asp:TextBox ID="txtTitle" Columns="50" MaxLength="255" runat="server"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfvTitle" Text="*" runat="server" ErrorMessage="Απαιτείται τίτλος" ControlToValidate="txtTitle">
                        </asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td>
                        Μύνημα</td>
                    <td>
                        <asp:TextBox ID="txtMessage" TextMode="MultiLine" Rows="6" Columns="40" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Απαιτείται Μήνυμα" Text="*" ControlToValidate="txtMessage">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Εισαγωγή" 
                            onclick="btnSubmit_Click" />   
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                       </td>
                    
                </tr>
            </table>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>

