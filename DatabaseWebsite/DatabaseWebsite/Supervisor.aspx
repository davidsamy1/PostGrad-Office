<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor.aspx.cs" Inherits="DatabaseWebsite.WebForm1" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>SuperVisor</title>
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
            <span class="nav-link">SuperVisor</span>
          </div>

            <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorProfile.aspx">
                <i class="fas fa-info"></i>
              </a>
            </div>
            <a href="/SuperVisorProfile.aspx" class="nav-link">My Profile</a>
          </div>

          <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorStudents.aspx">
               <i class="fas fa-scroll"></i>
              </a>
            </div>
            <a href="/SuperVisorStudents.aspx" class="nav-link">My Students & Publications</a>
          </div>

          <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorAddDefense.aspx">
                <i class="fas fa-shield"></i>
              </a>
            </div>
            <a href="/SuperVisorAddDefense.aspx" class="nav-link">Add Defense</a>
          </div>

          <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorAddExaminer.aspx">
                <i class="fas fa-user-plus"></i>
              </a>
            </div>
            <a href="/SuperVisorAddExaminer.aspx" class="nav-link">Add Examiner</a>
          </div>

                  <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorEvaluateReport.aspx">
               <i class="fas fa-check-double"></i>
              </a>
            </div>
            <a href="/SuperVisorEvaluateReport.aspx" class="nav-link">Evaluate Report</a>
          </div>

                <div class="list-item">
            <div class="icons">
              <a href="/SuperVisorCancelThesis.aspx">
                <i class="fas fa-ban"></i>
              </a>
            </div>
            <a href="/SuperVisorCancelThesis.aspx" class="nav-link">Cancel Thesis</a>
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

