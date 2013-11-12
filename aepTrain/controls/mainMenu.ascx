<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mainMenu.ascx.cs" Inherits="controls_mainMenu" %>


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
Width="800px" Font-Size="Medium" StaticDisplayLevels="1" >
    <StaticMenuItemStyle Height
="40px" ItemSpacing="80" Width="140px" CssClass="item"/>
   
    <DynamicMenuItemStyle CssClass
="dynamicMenu" Height="40px" HorizontalPadding="15px"  ItemSpacing="20px" />
    <dynamichoverstyle 
CssClass ="menuhover" ForeColor="#0066FF"
/>
    <StaticHoverStyle CssClass
="menuhover" ForeColor="#0066FF" />





       <Items>
    <asp:MenuItem Text="Αρχική" Value="Αρχική" NavigateUrl="~/Default.aspx" >
    
        </asp:MenuItem>
    <asp:MenuItem Text="Μαθήματα" NavigateUrl="~/Teacher/ManageChapters.aspx" >
        <asp:MenuItem Text="Εισαγωγή Ενότητας" Value="Εισαγωγή Ενότητας" NavigateUrl="~/Teacher/InsertTheory.aspx">
       <asp:MenuItem Text="Διαχείριση Ενοτήτων" Value="Διαχείρηση Ενοτήτων" NavigateUrl="~/Teacher/ManageUnits.aspx"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem Text="Διαχείρηση Ασκήσεων" Value="Διαχείρηση Ασκήσεων" NavigateUrl="~/Teacher/ManageExercises.aspx">
        </asp:MenuItem>
        <asp:MenuItem Text="Εισαγωγή Άσκησης" Value="Εισαγωγή Άσκησης">
        <asp:MenuItem Text="Σωστό - Λάθος" Value="Σωστό - Λάθος" NavigateUrl="~/Teacher/Insert-True-False-Quest.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Πολλαπλής Επιλογής" Value="Πολλαπλής Επιλογής" NavigateUrl="~/Teacher/InsertMultipleChoiceQuest.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Συμπλήρωσης Κενού" Value="Συμπλήρωσης Κενού" NavigateUrl="~/Teacher/InsertFillTheBlankQuest.aspx"></asp:MenuItem>
        </asp:MenuItem>
    </asp:MenuItem>    
     
    <asp:MenuItem Text="Μαθητές">
   
        
        <asp:MenuItem Text="Στατιστικά" Value="Στατιστικά" ></asp:MenuItem>
        <asp:MenuItem Text="Επιδόσεις" Value="Επιδόσεις" NavigateUrl="~/Teacher/seePerformance.aspx"></asp:MenuItem>
   
        
        </asp:MenuItem>
    <asp:MenuItem Text="Εργασίες">
    <asp:MenuItem Text="Εισαγωγή Εργασίας" Value="Εισαγωγή Εργασίας" NavigateUrl="~/Teacher/InsertProject.aspx" />
    <asp:MenuItem Text="Εργασίες Μαθητών" Value="Εργασίες Μαθητών" NavigateUrl="~/Teacher/ProjectsByStudents.aspx" />
    </asp:MenuItem>
    
    
    
   
    </Items>
    </asp:Menu>
 </td>
</tr>
 </table>
 </div>



 