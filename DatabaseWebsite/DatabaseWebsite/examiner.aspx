<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examiner.aspx.cs"
Inherits="DatabaseWebsite.examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Examiner</title>
  </head>
  <body>
    <p class="label">EXAMINER</p>

    <form id="form1" runat="server">
      <div>
        <asp:Button
          class="btn"
          runat="server"
          Text="Edit Profile"
          OnClick="edit"
        />
        <asp:Button
          class="btn"
          runat="server"
          Text="Defenses Attended"
          OnClick="Unnamed_Click"
        />
        <asp:Button
          class="btn"
          runat="server"
          Text="Add comment to defense"
          OnClick="addComment"
        />
        <asp:Button
          class="btn"
          runat="server"
          Text="Add grade to defense"
          OnClick="addGrade"
        />
        <asp:Button
          class="btn"
          runat="server"
          Text="Search for thesis"
          OnClick="search"
        />
      </div>
    </form>
  </body>
</html>
