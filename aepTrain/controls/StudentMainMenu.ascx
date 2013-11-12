<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentMainMenu.ascx.cs" Inherits="controls_StudentMainMenu" %>


<link rel="stylesheet"
 href="../css/Styles.css"
type="text/css"
/>


<div id="header"
align="center"
>
<table width="100%"
cellpadding ="0"
cellspacing ="0"
align="center">
 <tr>
<td  align="center">
    <asp:Menu ID="Menu1" runat="server" Orientation
="Horizontal" CssClass ="Menu" Font-Names="Verdana"
ForeColor ="#333333"
Width="800px" Font-Size="Medium" StaticDisplayLevels="1">
    <StaticMenuItemStyle Height
="40px" ItemSpacing="80" Width="140px" CssClass="item"/>
   
    <DynamicMenuItemStyle CssClass
="dynamicMenu" Height="40px" HorizontalPadding="15px" ItemSpacing="20"
/>
    <dynamichoverstyle 
CssClass ="menuhover" ForeColor="#0066FF"
/>
    <StaticHoverStyle CssClass
="menuhover" ForeColor="#0066FF" />
       <Items>
    <asp:MenuItem Text="Αρχική" NavigateUrl="~/Students/DefaultStudent.aspx">
    
        </asp:MenuItem>
    <asp:MenuItem Text="Μαθήματα" >
        <asp:MenuItem Text="Θεωρία και εξάσκηση" Value="Θεωρία και Εξάσκηση" NavigateUrl="~/Students/WatchTheory.aspx"></asp:MenuItem>
    </asp:MenuItem>    
     
    <asp:MenuItem Text="Επιδόσεις">
   
        <asp:MenuItem Text="Επιδόσεις" Value="Επιδόσεις" NavigateUrl="~/Students/StudentPerform.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Βαθμολογία Εργασιών" Value="Βαθμολογία Εργασιών" NavigateUrl="~/Students/MyProjectMark.aspx"></asp:MenuItem>
        
   
        
        </asp:MenuItem>
    <asp:MenuItem Text="Εργασία">
    <asp:MenuItem Text="Στείλε την εργασία σου" Value="Στείλε την εργασία σου" NavigateUrl="~/Students/UploadProject.aspx"></asp:MenuItem>
    </asp:MenuItem>
    <asp:MenuItem Text="Forum" Value="Forum" NavigateUrl="~/Students/Forum/DefaultForum.aspx"></asp:MenuItem>
    
    
    
   
    </Items>
    </asp:Menu>
 </td>
</tr>
 </table>
 </div>