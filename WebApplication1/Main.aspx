<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel2" runat="server" BackColor="#FFFF99" HorizontalAlign="Right">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin.aspx">管理員登入</asp:HyperLink>
                <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Center">
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Size="40pt" Text="圖 書 館 查 詢 系 統"></asp:Label>
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" HorizontalAlign="Center">
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="藏書查詢" Font-Size="40pt" Height="80px" OnClick="Button1_Click" Width="400px" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Font-Size="40pt" Height="80px" OnClick="Button2_Click" Text="借閱查詢" Width="400px" />
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
