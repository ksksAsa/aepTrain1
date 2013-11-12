<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ProjectsByStudents.aspx.cs" Inherits="Teacher_ProjectsByStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
.hide
{
    display:none;
    
    }
</style>
<div style="overflow-x:auto; width:800px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" DataKeyNames="fullPath,fileName,projectID" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowupdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Download" 
                ControlStyle-ForeColor="Blue" >
<ControlStyle ForeColor="Blue"></ControlStyle>
            </asp:CommandField>
            <asp:CommandField ShowEditButton = "True" SelectText="Βοθμολογήστε" />
            <asp:BoundField DataField="chapter_name" HeaderText="Ενότητα" 
                SortExpression="chapter_name" ReadOnly="true"/>
                <asp:BoundField DataField="projectID" HeaderText="projectID" 
                SortExpression="projectID" ReadOnly="true" Visible="false"/>
                <asp:BoundField DataField="chapter_id" HeaderText="chapter_id" 
                SortExpression="chapter_id" ReadOnly="true" Visible="false"/>
                <asp:BoundField DataField="userID" HeaderText="userID" 
                SortExpression="userID" ReadOnly="true" Visible="false"/>
                <asp:BoundField DataField="fullPath" Visible="false">
                </asp:BoundField>
                <asp:BoundField DataField="fileName" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="firstName" HeaderText="Όνομα" 
                SortExpression="firstName" ReadOnly="true" />
            <asp:BoundField DataField="lastName" HeaderText="Επώνυμο" 
                SortExpression="lastName" ReadOnly="true" />
            <asp:TemplateField HeaderText="Βαθμολογία" SortExpression="mark">
                <EditItemTemplate>
                    <asp:TextBox ID="theMarkTextBox" runat="server" Text='<%# Bind("mark") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="theMarkLabel" runat="server" Text='<%# Bind("mark") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />

<SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
        SelectCommand="SELECT StudentsProjects.projectID, StudentsProjects.chapter_id, StudentsProjects.userID, StudentsProjects.fullPath, StudentsProjects.fileName,
        StudentsProjects.mark, Chapters.chapter_name, Users.firstName,
        Users.lastName FROM [StudentsProjects] INNER JOIN [Users] ON
        StudentsProjects.userID = Users.userID  
        INNER JOIN [Chapters] ON StudentsProjects.chapter_id = Chapters.chapter_id
         WHERE (StudentsProjects.mark IS NULL)">
    </asp:SqlDataSource>
</asp:Content>

