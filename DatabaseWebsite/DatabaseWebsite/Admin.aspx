<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs"
Inherits="DatabaseWebsite.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Admin</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles/navigation.css" />
  </head>
  <body>
    <nav class="navbar" id="nav">
      <button class="toggle-menu" id="menu">
        <i class="fas fa-bars"></i>
      </button>
      <div class="nav-items">
        <div class="admin-profile">
          <div class="icons">
            <i class="fas fa-user"></i>
          </div>
          <span class="nav-link">Admin</span>
        </div>
        <div class="list-item">
          <div class="icons">
            <a href="/supervisors.aspx">
              <i class="fas fa-user-edit"></i>
            </a>
          </div>
          <a href="/supervisors.aspx" class="nav-link">Supervisors</a>
        </div>
        <div class="list-item">
          <div class="icons">
            <a href="/defenses.aspx">
              <i class="fas fa-shield-alt"></i>
            </a>
          </div>
          <a href="/defenses.aspx" class="nav-link">My Defenses</a>
        </div>
        <div class="list-item">
          <div class="icons">
            <a href="/addComment.aspx">
              <i class="far fa-comment-dots"></i>
            </a>
          </div>
          <a href="/addComment.aspx" class="nav-link">Add Comment</a>
        </div>
        <div class="list-item">
          <div class="icons">
            <a href="/addGrade.aspx">
              <i class="fas fa-users"></i>
            </a>
          </div>
          <a href="/addGrade.aspx" class="nav-link">Add Grade</a>
        </div>
        <div class="list-item">
          <div class="icons">
            <a href="/search.aspx">
              <i class="fas fa-search"></i>
            </a>
          </div>
          <a href="/search.aspx" class="nav-link">Thesis Search</a>
        </div>
        <div class="list-item logout">
          <div class="icons">
            <a href="#">
              <i class="fas fa-sign-out-alt"></i>
            </a>
          </div>
          <a href="#" class="nav-link">Logout</a>
        </div>
      </div>
    </nav>
    <form id="form1" runat="server">
      <p style="height: 264px">
        <asp:Button
          ID="Button1"
          runat="server"
          OnClick="Supervisors"
          Text="List Supervisors"
        />

        <asp:Button
          ID="Button3"
          runat="server"
          Text="Theses"
          Width="173px"
          OnClick="ThesisRedirect"
        />
        <asp:GridView ID="ListSupGrid" runat="server"> </asp:GridView>
      </p>
      <p style="height: 183px">&nbsp;</p>
      <p>&nbsp;</p>
    </form>
  </body>
</html>
