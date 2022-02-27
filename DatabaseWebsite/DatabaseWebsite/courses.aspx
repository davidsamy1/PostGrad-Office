<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Courses.aspx.cs" Inherits="DatabaseWebsite.Student_thesis"
%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Courses</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles/navigation.css" />
    <style>
      .main-content {
        height: max(90vh, auto);
        margin-left: 3rem;
        border-radius: 15px;
        position: relative;
        padding: 15px;
        min-height: 600px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        background-color: hsla(0, 0%, 100%, 0.251);
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
        overflow-x: auto;
        width: max(max-content, auto);
      }

      form {
        position: relative;
        opacity: 1;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        padding: 2rem;
        border-radius: 15px;
        /* border: #fff 1px solid; */
        width: max-content;
      }

      .text {
        width: 100%;
        outline: none;
        border: none;
        border: 1px solid rgba(255, 255, 255, 0.2);
        background: rgba(255, 255, 255, 0.2);
        padding: 8px 10px;
        padding-left: 40px;
        border-radius: 15px;
        color: #fff;
        font-size: 16px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      }
      input[type='submit'] {
        background: #fff;
        color: #111;
        /* max-width: 100px; */
        padding: 8px 10px;
        box-shadow: none;
        letter-spacing: 1px;
        cursor: pointer;
        transition: 1.5s;
        border-radius: 15px;
      }

      input[type='submit']:hover {
        background: linear-gradient(
          115deg,
          rgba(0, 0, 0, 0.1),
          rgba(255, 255, 255, 0.25)
        );
        color: #fff;
        transition: 0.5s;
      }

      input::placeholder {
        color: #fff;
      }

      .grid {
        background: #fff;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        background-color: hsla(0, 0%, 100%, 0.251);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
        overflow: hidden;
        /* height: auto; */
        /* width: 110%; */
      }
      .pager {
        background: #0f0;
      }

      .header {
        background: #0f0;
        padding: 1rem !important;
      }

      .rows {
        background: #fff;
      }
      td,
      th {
        padding: 0.25em;
      }
      td:last-child,
      th:last-child {
        border: none;
      }
    </style>
  </head>
  <body>
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
          <a href="/Student info.aspx" class="nav-link">Student Info</a>
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
    <section class="main-content">
      <form id="form1" runat="server">
        <asp:GridView
          ID="GridView1"
          class="grid"
          PagerStyle-CssClass="pager"
          HeaderStyle-CssClass="header"
          RowStyle-CssClass="rows"
          runat="server"
        ></asp:GridView>
      </form>
    </section>
    <script src="./scripts/navigation.js"></script>
    <script>
      setActive(1);
    </script>
  </body>
</html>
