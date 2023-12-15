<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rant.aspx.cs" Inherits="WebApplication1.Rant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <div style="float: right">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx">上一頁</asp:HyperLink>
            </div>


            <asp:Label ID="Label1" runat="server" Font-Size="20px" Text="請輸入借書證號："></asp:Label>
            <asp:TextBox ID="txtID" runat="server" Height="20px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Font-Size="30px" Height="36px" Text="查詢" Width="311px" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" EmptyDataText="查無資料">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:BoundField DataField="datefrom" HeaderText="datefrom" SortExpression="datefrom" />
                    <asp:BoundField DataField="dateto" HeaderText="dateto" SortExpression="dateto" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Rant] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtID" Name="Id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />


        </div>
    </form>
</body>
</html>
