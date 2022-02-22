<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student
home.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Home</title>
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
              <i class="fas fa-user-graduate"></i>
            </div>
            <span class="nav-link">Student</span>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/Student info.aspx">
                <i class="fas fa-info"></i>
              </a>
            </div>
            <a href="/Student info.aspx" class="nav-link"
              >Student Info</a
            >
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/courses.aspx">
                <i class="fas fa-graduation-cap"></i>
              </a>
            </div>
            <a href="/courses.aspx" class="nav-link">Courses</a>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/getall thesis.aspx">
                <i class="fas fa-scroll"></i>
              </a>
            </div>
            <a href="/getall thesis.aspx" class="nav-link">Theses</a>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/fillandaddprogressreport.aspx">
                <i class="fas fa-clipboard"></i>
              </a>
            </div>
            <a href="/fillandaddprogressreport.aspx" class="nav-link"
              >Reports</a
            >
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/link and add publications.aspx">
                <i class="far fa-newspaper"></i>
              </a>
            </div>
            <a href="/link and add publications.aspx" class="nav-link"
              >Publications</a
            >
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
    <form id="form1" runat="server"></form>
    <script src="./scripts/navigation.js"></script>
  </body>
</html>
