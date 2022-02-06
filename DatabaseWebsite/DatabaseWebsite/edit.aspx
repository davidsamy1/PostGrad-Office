<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs"
Inherits="DatabaseWebsite.edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <!-- <style>
      body {
        background: yellow;
      }

      div {
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        min-height: 10vh;
      }

      .label {
        font-weight: bold;
        font-size: 1.5em;
      }
      .text {
        font-size: 1em;
        width: 25em;
        height: 2em;
        font-weight: bold;
        border-radius: 1em;
      }

      .fail {
        font-weight: bold;
        font-size: 1.5em;
        position: relative;
        padding-top: 2em;
        left: 46.5%;
        color: red;
        z-index: -1;
        /**/
      }

      .success {
        font-weight: bold;
        font-size: 1.5em;
        position: relative;
        padding-top: 2em;
        left: 42.5%;
        color: green;
        z-index: -1;
      }

      #Button1 {
        margin: 0;
        background-color: white;
        width: 15em;
        height: 3em;
        border: 3px solid black;
        border-radius: 1em;
        font-weight: bold;
        font-size: 1em;
        transition: all 0.5s ease;
      }
      #Button1:hover {
        color: white;
        cursor: pointer;
        box-shadow: inset 15em 0 0 0 #ef2f88;
      }

      #btn2 {
        margin: 0;
        background-color: white;
        width: 10em;
        height: 3em;
        border: 3px solid black;
        border-radius: 1em;
        font-weight: bold;
        font-size: 1em;
        transition: all 0.5s ease;
        position: absolute;
        top: 5%;
        left: 5%;
      }
      #btn2:hover {
        color: white;
        cursor: pointer;
        box-shadow: inset 15em 0 0 0 #ef2f88;
      }
    </style> -->
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="/styles/navigation.css" />
  </head>
  <body>
    <div class="nav-holder">
      <nav class="navbar" id="nav">
        <button class="toggle-menu" id="menu">
          <i class="fas fa-bars"></i>
        </button>
        <ul class="nav-items">
          <div class="admin-profile">
            <div class="icons">
              <i class="fas fa-user"></i>
            </div>
            <span class="nav-link">Admin</span>
          </div>
          <li class="list-item">
            <div class="icons">
              <i class="fas fa-tachometer-alt"></i>
            </div>
            <a href="#" class="nav-link">Dashboard</a>
          </li>
          <li class="list-item">
            <div class="icons">
              <i class="fas fa-wallet"></i>
            </div>
            <a href="#" class="nav-link">Coupons</a>
          </li>
          <li class="list-item">
            <div class="icons">
              <i class="far fa-comment-dots"></i>
            </div>
            <a href="#" class="nav-link">Messages</a>
          </li>
          <li class="list-item">
            <div class="icons">
              <i class="fas fa-users"></i>
            </div>
            <a href="#" class="nav-link">Team</a>
          </li>
          <li class="list-item">
            <div class="icons">
              <i class="fas fa-list"></i>
            </div>
            <a href="#" class="nav-link">Userlist</a>
          </li>
          <li class="list-item logout">
            <div class="icons">
              <i class="fas fa-sign-out-alt"></i>
            </div>
            <a href="#" class="nav-link">Logout</a>
          </li>
        </ul>
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

    <script src="/scripts/navigation.js"></script>
  </body>
</html>
