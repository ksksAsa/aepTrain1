<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPageForum.master" AutoEventWireup="true" CodeFile="NewComment.aspx.cs" Inherits="Students_Forum_NewComment" %>

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
                        Μήνυμα</td>
                    <td>
                        <asp:TextBox ID="txtMessage" runat="server" Rows="6" Columns="40"></asp:TextBox>    
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Απαιτείται Μήνυμα" Text="*" ControlToValidate="txtMessage">
                        </asp:RequiredFieldValidator>
                     </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Αποστολή" 
                            onclick="btnSubmit_Click" />  
                        </td>
                    
                </tr>
            </table>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>

