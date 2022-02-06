<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs"
Inherits="DatabaseWebsite.edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Edit</title>
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <!-- <style>
      @import url("https://fonts.googleapis.com/css2?family=Raleway:wght@800&display=swap");
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        outline: none;
        border: none;
        font-family: "Raleway", sans-serif;
        transition: 0.4s;
      }

      body {
        min-height: 100vh;
        padding: 30px;
        background: linear-gradient(
          to left top,
          hsl(175, 66%, 64%),
          hsl(188, 76%, 67%),
          hsl(200, 86%, 70%)
        );
        display: grid;
        grid-template-columns: 300px minmax(450px, auto);
      }

      .navbar {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 300px;
        height: 90vh;
        background-color: hsla(0, 0%, 100%, 0.251);
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
        border-radius: 15px;
        position: relative;
        overflow: hidden;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        padding: 15px;
        min-height: 600px;
      }

      .toggle-menu {
        position: absolute;
        display: block;
        top: 15px;
        left: 25px;
        background-color: transparent;
        cursor: pointer;
      }

      .toggle-menu i {
        color: hsl(327, 46%, 35%);
        font-size: 2.5em;
      }

      .nav-items {
        width: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        height: 65vh;
      }

      .admin-profile,
      .list-item,
      .logout {
        width: 100%;
        display: flex;
        justify-content: start;
        align-items: center;
        cursor: pointer;
        border-radius: 10px;
      }

      .list-item:hover,
      .logout:hover {
        background-color: hsla(0, 0%, 100%, 0.376);
      }

      .admin-profile {
        margin: 40px 0;
        background-color: hsla(0, 0%, 100%, 0.439);
      }

      .logout {
        margin-top: 30px;
      }

      .icons {
        width: 50px;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
      }

      .icons img {
        width: 40px;
        height: 40px;
      }

      .icons i {
        font-size: 2em;
        color: hsl(327, 46%, 35%);
      }

      .nav-link,
      .navbar span {
        text-decoration: none;
        display: flex;
        font-size: 1.5em;
        letter-spacing: 1px;
        text-transform: uppercase;
        color: hsl(327, 46%, 35%);
        margin-left: 10px;
      }

      .main-content {
        height: 90vh;
        margin-left: 3rem;
        background-color: hsla(0, 0%, 100%, 0.251);
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
        border-radius: 15px;
        position: relative;
        overflow: hidden;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        padding: 15px;
        min-height: 600px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
    </style> -->
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
      <form id="form1" runat="server">
        <div>
          <asp:Label
            class="label"
            ID="Label1"
            runat="server"
            server=""
            Text="Name"
          ></asp:Label>
          <br />
          <asp:TextBox class="text" ID="name" runat="server"></asp:TextBox>
          <br />
          <asp:Label
            class="label"
            ID="Label2"
            runat="server"
            Text="Field Of Work"
          ></asp:Label>
          <br />
          <asp:TextBox class="text" ID="field" runat="server"></asp:TextBox>
          <br />
          <asp:Button
            ID="Button1"
            runat="server"
            Text="Update"
            OnClick="Button1_Click"
          />
          <asp:Button ID="btn2" runat="server" Text="back" OnClick="back" />
        </div>
      </form>
    </section>

    <script>
      var nav = document.getElementById("nav");
      var menu = document.getElementById("menu");
      var content = document.querySelector(".main-content");
      var navItems = document.querySelector(".nav-items");
      var navLinks = document.querySelectorAll(".nav-link");
      var screenWidth = window.outerWidth;
      menu.addEventListener("click", () => {
        if (nav.style.width == "85px") {
          nav.style.width = "300px";
          nav.style.minHeight = "600px";
          nav.style.height = "90vh";
          content.style.marginLeft = "3rem";
          navItems.style.display = "block";
          for (i = 0; i < navLinks.length; i++) {
            navLinks[i].style.display = "block";
          }
        } else {
          nav.style.width = "85px";
          nav.style.height = "90vh";
          content.style.marginLeft = "-180px";
          for (i = 0; i < navLinks.length; i++) {
            navLinks[i].style.display = "none";
          }
        }
      });

      if (screenWidth <= 768) {
        nav.style.width = "85px";
        nav.style.height = "90vh";
        content.style.marginLeft = "-180px";
        for (i = 0; i < navLinks.length; i++) {
          navLinks[i].style.display = "none";
        }
      }
    </script>
  </body>
</html>
