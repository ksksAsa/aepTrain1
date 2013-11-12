<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="seePerformance.aspx.cs" Inherits="Teacher_seePerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="chapter_name" 
        DataValueField="chapter_id" AppendDataBoundItems="True">
        <asp:ListItem Selected="True" Value="0" Text="Επιλέξτε ενότητα"></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" 
        DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
           <asp:BoundField DataField="firstName" HeaderText="Όνομα" 
                SortExpression="firstName" />
           <asp:BoundField DataField="lastName" HeaderText="Επώνυμο" 
                SortExpression="lastName" />
                <asp:BoundField DataField="totalscore" HeaderText="Επίδοση" 
                SortExpression="totalscore" />
                <asp:BoundField DataField="mostError" HeaderText="Συνήθες λάθος" 
                SortExpression="mostError" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Users.firstName, Users.lastName, studentPerformStats.totalscore,
        studentPerformStats.mostError  FROM [studentPerformStats] INNER JOIN [Users] ON 
        studentPerformStats.userID = Users.userID
          WHERE ([chapter_id] = @chapter_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="chapter_id" 
                Name="chapter_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

