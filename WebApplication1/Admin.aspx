<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblID" runat="server"></asp:Label>
        <div style="float: right">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="登出" />
        </div>
        借書證號：<asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        &nbsp;ISBN：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查詢" Height="25px" Width="70px" />
        &nbsp;
        <asp:Button ID="Button3" runat="server" Height="25px" OnClick="Button3_Click" Text="借閱" Width="70px" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" EmptyDataText="查無資料">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                <asp:BoundField DataField="datefrom" HeaderText="datefrom" SortExpression="datefrom" />
                <asp:BoundField DataField="dateto" HeaderText="dateto" SortExpression="dateto" />
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="歸還" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:Label ID="lblOutput" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Rant] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [Rant] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Rant] ([Id], [name], [Author], [ISBN], [datefrom], [dateto]) VALUES (@Id, @name, @Author, @ISBN, @datefrom, @dateto)" UpdateCommand="UPDATE [Rant] SET [name] = @name, [Author] = @Author, [ISBN] = @ISBN, [datefrom] = @datefrom, [dateto] = @dateto WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="datefrom" Type="DateTime" />
                <asp:Parameter Name="dateto" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="Id" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="datefrom" Type="DateTime" />
                <asp:Parameter Name="dateto" Type="DateTime" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Book] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Book] ([Id], [Name], [Author], [ISBN], [Is_rant]) VALUES (@Id, @Name, @Author, @ISBN, @Is_rant)" SelectCommand="SELECT * FROM [Book] WHERE ([ISBN] = @ISBN)" UpdateCommand="UPDATE [Book] SET [Name] = @Name, [Author] = @Author, [ISBN] = @ISBN, [Is_rant] = @Is_rant WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Is_rant" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblOutput" Name="ISBN" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Is_rant" Type="Boolean" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </form>
</body>
</html>
