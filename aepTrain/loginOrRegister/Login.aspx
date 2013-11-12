<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LoginOrRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Σύνδεση</title>
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
        .style3
        {
            width: 100%;
        }
    </style>
   
    <link href="../css/login.css" rel="Stylesheet" type="text/css" />
</head>
<div class="container">
	<section id="content">
		<form id="form1" runat="server" action="">
			<h1>Είσοδος στο σύστημα</h1>
			<div>
				<asp:TextBox ID="logusrnTextbox" runat="server"></asp:TextBox>
			</div>
			<div>
				<asp:TextBox ID="logpswTextBox" TextMode="Password" runat="server"></asp:TextBox>
			</div>
			<div>
				<asp:Button ID="loginBtn" runat="server" Text="Σύνδεση" 
                        onclick="loginBtn_Click" />
				
				<a href="Register.aspx">Εγγραφείτε</a>
			</div>
		</form><!-- form -->
		<div class="button">
			
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
    
</html>
