<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherMessages.aspx.cs" Inherits="Teacher_TeacherMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="messageID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" 
        >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="20px" />
            </asp:TemplateField>
            <asp:BoundField DataField="messageSubject" HeaderText="Θέμα" 
                SortExpression="messageSubject">
            <HeaderStyle Font-Size="Medium" />
            <ItemStyle Font-Size="Medium" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Κείμενο" SortExpression="messageFullText">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("messageFullText")%>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label  ID="Label1" runat="server" Text='<%# Bind("messageFullText") %>'></asp:Label>
                </ItemTemplate>
                
                <HeaderStyle Font-Size="Medium" />
                <ItemStyle Font-Size="Medium" Font-Strikeout="False" HorizontalAlign="Left" 
                    VerticalAlign="Middle" Width="200px" Height="5px" />
            </asp:TemplateField>
            <asp:BoundField DataField="userID" HeaderText="Από" SortExpression="userID">
            <HeaderStyle Font-Size="Medium" />
            <ItemStyle Font-Size="Medium" />
            </asp:BoundField>
            <asp:BoundField DataField="dateSended" HeaderText="Ημερομηνία" 
                SortExpression="dateSended">
            <HeaderStyle Font-Size="Medium" />
            <ItemStyle Font-Size="Medium" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Messages]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>

