<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="WebApplication1.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     
            
            <div style="display: inline-block; width: 450px; height: 400px;">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="50px" style="margin-right: 0px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="書名" SortExpression="Name" />
                    <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:CheckBoxField DataField="Is_rant" HeaderText="Is_rant" SortExpression="Is_rant" Visible="False" />
                    <asp:ImageField DataImageUrlField="Id" DataImageUrlFormatString="~/BookImg/{0}.jpg" HeaderText="封面">
                        <ControlStyle Height="600px" Width="400px" />
                        <ItemStyle Height="300px" Width="140px" />
                    </asp:ImageField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
            </div>
            <div style="display: inline-block; width: 446px; height: 400px;">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <br />
        
    </form>
</body>
</html>
