<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fillandaddprogressreport.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        ADD AND FILL YOUR PROGRESS REPORT<br />
        <br />
        THESIS SERIAL NO.<br />
        <asp:TextBox ID="thserialno" runat="server"></asp:TextBox>
        <br />
        POROGRESSREPORT NO.<br />
        <asp:TextBox ID="progno" runat="server" OnTextChanged="progno_TextChanged" ></asp:TextBox>
        <br />
        STATE<br />
        <asp:TextBox ID="state" runat="server" ></asp:TextBox>
        <br />
        DESCRIPTION:<br />
        <asp:TextBox ID="description" runat="server"></asp:TextBox>
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="ADD AND FILL PROGRESS REPORT" OnClick="Button1_Click" />
        <br />
    </form>
</body>
</html>
