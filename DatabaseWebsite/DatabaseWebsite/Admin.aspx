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
    <div class="nav-holder">
      <nav class="navbar" id="nav">
        <button class="toggle-menu" id="menu">
          <i class="fas fa-bars"></i>
        </button>
        <div class="nav-items">
          <div class="admin-profile">
            <div class="icons">
              <i class="fas fa-user-cog"></i>
            </div>
            <span class="nav-link">Admin</span>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/supervisors.aspx">
                <i class="fas fa-user-tie"></i>
              </a>
            </div>
            <a href="/supervisors.aspx" class="nav-link">Supervisors</a>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/Thesis.aspx">
                <i class="fas fa-scroll"></i>
              </a>
            </div>
            <a href="/Thesis.aspx" class="nav-link">List Theses</a>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/IssuePayment.aspx">
                <i class="fas fa-dollar-sign"></i>
              </a>
            </div>
            <a href="/IssuePayment.aspx" class="nav-link">Payments</a>
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/IssueInstallments.aspx">
                <i class="fas fa-coins"></i>
              </a>
            </div>
            <a href="/IssueInstallments.aspx" class="nav-link"
              >Installments</a
            >
          </div>
          <div class="list-item">
            <div class="icons">
              <a href="/UpdateExtension.aspx">
                <i class="far fa-plus-square"></i>
              </a>
            </div>
            <a href="/UpdateExtension.aspx" class="nav-link"
              >Extensions</a
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
