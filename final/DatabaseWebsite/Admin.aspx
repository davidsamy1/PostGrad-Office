<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DatabaseWebsite.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            &nbsp;</p>
        <p style="height: 264px">
            <asp:Button ID="Button1" runat="server" OnClick="Supervisors" Text="List Supervisors" />
            &nbsp;<asp:GridView ID="ListSupGrid" runat="server">
            </asp:GridView>
            <asp:Button ID="Button3" runat="server" Text="Theses" Width="173px" OnClick="ThesisRedirect" />
            </p>
        <p style="height: 183px">
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
