<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="defenses.aspx.cs" Inherits="DatabaseWebsite.defenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>My Defences</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="./styles/navigation.css" />
    <style>
      .main-content {
        height: 90vh;
        margin-left: 3rem;
        border-radius: 15px;
        position: relative;
        overflow: hidden;
        padding: 15px;
        min-height: 600px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        background-color: hsla(0, 0%, 100%, 0.251);
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
      }

      form {
        position: relative;
        opacity: 1;
        width: 100%;

        /* display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center; */
        gap: 1rem;
        padding: 2rem;
        border-radius: 15px;
        /* border: #fff 1px solid; */
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
        max-width: 100px;
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

      .grid-container {
        position: relative;
        left: 50%;
        transform: translate(-50%);
      }
      .grid {
        background: #fff;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        background-color: hsla(0, 0%, 100%, 0.251);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
        overflow: hidden;
        width: 100%;
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
        /* border-right: #555 2px solid; */
        padding: 1rem;
      }
      td:last-child,
      th:last-child {
        border: none;
      }
    </style>
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
          <div class="list-item active">
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
      <form id="form1" runat="server">
        <div class="grid-container">
          <asp:GridView
            class="grid"
            ID="GridView1"
            PagerStyle-CssClass="pager"
            HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows"
            AllowPaging="True"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            runat="server"
          ></asp:GridView>

          <asp:Button
            ID="btn2"
            runat="server"
            Text="back"
            OnClick="back"
          />
        </div>
      </form>
    </section>
    <script src="./scripts/navigation.js"></script>
    <script>
      setActive(1);
    </script>
  </body>
</html>
