<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="IssueInstallments.aspx.cs"
Inherits="DatabaseWebsite.IssueInstallments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Issue Installments</title>
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
        width: 50%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
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
    <section class="main-content">
      <form id="form1" runat="server">
        Payment ID:
        <asp:TextBox
          ID="PaymentIDBox"
          class="text"
          runat="server"
          type="number"
          min="0"
          max="1000000"
          step="1"
        ></asp:TextBox>

        Start Date:
        <asp:TextBox
          ID="StartDateBox"
          class="text"
          runat="server"
          textmode="Date"
        ></asp:TextBox>

        <asp:Button
          ID="IssueInstallmentButton"
          runat="server"
          Text="Issue Installments"
          OnClick="IssueInstallmentClick"
        />
      </form>
    </section>
    <script src="./scripts/navigation.js"></script>
    <script>
      setActive(3);
    </script>
  </body>
</html>
