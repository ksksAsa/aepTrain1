<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="loginOrRegister_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Εγγραφή Χρήστη</title>
    <style type="text/css">
        .loginalign{
        float:left;
        background-color:Gray;
        width:70%; 
        height:100%;
        margin:0 auto;
    }
    .remind
    {
         float:right;
         background-color: Silver;
         width:30%;
          min-height:100%;
          margin:0 auto;
        }
        .style2
        {
            width: 335px;
        }
        .style3
        {
            width: 100%;
        }
    </style>
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link href="../css/register.css" rel="Stylesheet" type="text/css" />
</head>
<body>
<div class="container">
    <section class="register">
    <h1>Εγγραφή στο σύστημα</h1>
    <form id="form1" runat="server">
    
     <asp:Label ID="lblMessageText" runat="server"></asp:Label>
        
       
                         <div class="reg_section personal_info">
                
                    <asp:TextBox ID="usrnTextBox" runat="server" placeholder="Δώστε username"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="usernameValidator" runat="server" 
                        ControlToValidate="usrnTextBox" Display="Dynamic" ErrorMessage="Δώστε username" 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                <div class="reg_section password">
                   
                
                    <asp:TextBox ID="pswTextBox" TextMode="Password"  runat="server" placeholder="Δώστε κωδικό"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="passwordValidator" runat="server" 
                        ControlToValidate="pswTextBox" Display="Dynamic" 
                        ErrorMessage="Δώστε ένα κωδικό" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                    
                <div class="reg_section password">
                    <asp:TextBox ID="cnfpaswTextBox" TextMode="Password" runat="server" placeholder="Επιβεβαίωση"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="confirmpswValidator" runat="server" 
                        ControlToValidate="cnfpaswTextBox" Display="Dynamic" 
                        ErrorMessage="Ξαναγράψτε τον κωδικό" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="pswCompareValidator" runat="server" 
                        ControlToCompare="pswTextBox" ControlToValidate="cnfpaswTextBox" 
                        Display="Dynamic" ErrorMessage="O κωδικός δεν είναι ο ίδιος" 
                        SetFocusOnError="True"></asp:CompareValidator>
                </div>
                    <div class="reg_section personal_info">
                
                    <asp:TextBox ID="nameTextBox" runat="server" placeholder="Όνομα"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="nameValidator" runat="server" 
                        ControlToValidate="nameTextBox" Display="Dynamic" 
                        ErrorMessage="Δώστε το όνομά σας">*</asp:RequiredFieldValidator>
                </div>
                   
                   <div class="reg_section personal_info">
                
                    <asp:TextBox ID="surnameTextBox" runat="server" placeholder="Επίθετο"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="surnameValidator" runat="server" 
                        ControlToValidate="surnameTextBox" Display="Dynamic" 
                        ErrorMessage="Δώστε το επίθετο" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                    
                    <div class="reg_section personal_info">
                
                    <asp:TextBox ID="mailTextBox" runat="server" placeholder="e-mail"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="mailrequiredValidator3" runat="server" 
                        ControlToValidate="mailTextBox" Display="Dynamic" ErrorMessage="Δώστε το email" 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="mailTextBox" 
                        ErrorMessage="Δώστε μια κανονική διεύθυνση e-mail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                    <asp:Button ID="submitBtn" runat="server" Text="Εγγραφή" 
                        onclick="submitBtn_Click" />
                
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
    
    </form>
    </section>
    </div>
</body>
</html>
