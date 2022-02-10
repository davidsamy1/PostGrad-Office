<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examiner.aspx.cs"
Inherits="DatabaseWebsite.examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Examiner</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles/navigation.css" />
  </head>
  <body>
    <div class="nav-holder">
      <nav class="navbar" id="nav">
        <button class="toggle-menu" id="menu">
          <i class="fas fa-bars"></i>
        </button>
        <div class="nav-items">
          <div class="admin-profile">
            <div class="icons">
              <i class="fas fa-user"></i>
            </div>
            <span class="nav-link">Examiner</span>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/edit.aspx">
                <i class="fas fa-user-edit"></i>
              </a>
            </div>
            <a href="/edit.aspx" class="nav-link">Edit Profile</a>
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
    </div>
    <section class="main-content">
      <form id="form1" runat="server"></form>
    </section>
    <script src="./scripts/navigation.js"></script>
  </body>
</html>
