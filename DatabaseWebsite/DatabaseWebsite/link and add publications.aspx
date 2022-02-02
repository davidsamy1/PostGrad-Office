<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="link and add publications.aspx.cs" Inherits="WebApplication1.link_and_add_publications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ADD PUBLICATION
            <br />
            <br />
            TITLE :<br />
            <asp:TextBox ID="title1" runat="server"></asp:TextBox>
            <br />
            HOST<br />
            <asp:TextBox ID="host" runat="server"></asp:TextBox>
            <br />
            PLACE
            <br />
            <asp:TextBox ID="place" runat="server"></asp:TextBox>
            <br />
            publication date<br />
            <asp:TextBox ID="date" runat="server" type="date"></asp:TextBox>
            <br />
            ACCPTED :<asp:CheckBox ID="accpted" runat="server" />
            <br />
            <br />
            LINK THE PUBLICATION TO THESIS<br />
            <br />
            THESISSERIALNO. :
            <asp:TextBox ID="TextBox5" runat="server" type="number"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" Text="add /link to thesis" OnClick="Button2_Click" />
            <br />
            <br />
</div>
    </form>
</body>
</html>
