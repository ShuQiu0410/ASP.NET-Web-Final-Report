<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                    <div style="float: right">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx">上一頁</asp:HyperLink>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="登入" Font-Size="25px"></asp:Label>
                    <br />
                    員工編號：<asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                    <br />
                    密　　碼：<asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" Font-Size="18px" Text="登入" OnClick="Button1_Click" />
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
