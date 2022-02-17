<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="supervisors.aspx.cs" Inherits="DatabaseWebsite.supervisors"
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Supervisors</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles/navigation.css" />
  </head>
  <body>
    <form id="form1" runat="server">
      <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
      </div>
    </form>
    <script src="./scripts/navigation.js"></script>
  </body>
</html>
