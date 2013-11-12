<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUnits.aspx.cs" Inherits="Teacher_ManageUnits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="chapter_id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" onrowupdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="chapter_name" HeaderText="Ενότητα" 
                SortExpression="chapter_name" />
            <asp:TemplateField HeaderText="Διαθέσιμη" SortExpression="enabled">
                <EditItemTemplate>
                   <asp:DropDownList ID="yesOrno" runat="server">
                   <asp:ListItem Text="Όχι" Value="Όχι"></asp:ListItem>
                   <asp:ListItem Text="Ναί" Value="Ναί"></asp:ListItem>
                   </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("enabled") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
        DeleteCommand="DELETE FROM [Chapters] WHERE [chapter_id] = @chapter_id" 
        InsertCommand="INSERT INTO [Chapters] ([chapter_name], [enabled]) VALUES (@chapter_name, @enabled)" 
        SelectCommand="SELECT * FROM [Chapters]" 
        UpdateCommand="UPDATE [Chapters] SET [chapter_name] = @chapter_name, [enabled] = @enabled WHERE [chapter_id] = @chapter_id">
        <DeleteParameters>
            <asp:Parameter Name="chapter_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="chapter_name" Type="String" />
            <asp:Parameter Name="enabled" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="chapter_name" Type="String" />
            <asp:Parameter Name="enabled" Type="String" />
            <asp:Parameter Name="chapter_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

