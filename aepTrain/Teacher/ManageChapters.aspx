<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="ManageChapters.aspx.cs" Inherits="Teacher_ManageChapters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Ενεργοποιήστε το μάθημα"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="chapter_id" DataSourceID="SqlDataSource1" 
        GridLines="Vertical" onrowupdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Κεφάλαιο" SortExpression="chapter_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("chapter_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("chapter_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ενεργοποιημένο" SortExpression="enabled">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlEnabled" runat="server"
                    SelectedIndex='<%# getEnabled(Eval("enabled")) %>' 
                    DataSource = '<%# enableCase %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="Επιλέξτε" Value="0" Enabled="true"></asp:ListItem>
                    </asp:DropDownList>  
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("enabled") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myLessonsStoreConnectionString %>" 
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
    <br />
    <br />
</asp:Content>

