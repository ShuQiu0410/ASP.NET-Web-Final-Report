<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Found.aspx.cs" Inherits="WebApplication1.Found" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Right">
                    <div style="float: right">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx" Style="text-align: left">上一頁</asp:HyperLink>
                    </div>
                </asp:Panel>
                查詢方式：<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="Id">編號</asp:ListItem>
                    <asp:ListItem Value="Name">書名</asp:ListItem>
                    <asp:ListItem Value="Author">作者</asp:ListItem>
                    <asp:ListItem>ISBN</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                查詢值：<asp:TextBox ID="txtIndex" runat="server" Height="19px" Width="182px"></asp:TextBox>
                &nbsp;<asp:Button ID="Button1" runat="server" Font-Size="15px" Height="28px" Text="查詢" Width="81px" OnClick="Button1_Click" />
            
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" EmptyDataText="查無資料">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="編號" ReadOnly="True" SortExpression="Id" />
                        <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Details.aspx?id={0}" DataTextField="Name" HeaderText="書名" NavigateUrl="Details.aspx" />
                        <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                        <asp:CheckBoxField DataField="Is_rant" HeaderText="Is_rant" SortExpression="Is_rant" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE ([Id] LIKE '%' + @Id + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtIndex" Name="Id" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:Panel>
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
