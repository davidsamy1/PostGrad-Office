<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuperVisorAddExaminer.aspx.cs" Inherits="DatabaseWebsite.SuperVisorAddExaminer" %>

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

    <link rel="stylesheet" href="./styles/navigation.css" />
    <style>
      .main-content {
        height: 90vh;
        margin-left: 3rem;
        position: relative;
        overflow: auto;
        padding: 15px;
        min-height: 600px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 15px;
        box-shadow: 0 0 15px -5px hsla(0, 0%, 0%, 0.188);
        background-color: hsla(0, 0%, 100%, 0.251);
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
      }

      form {
        position: relative;
        width: 50%;
        height: 50%;
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
       
        border-radius: 15px;
        color: #fff;
        font-size: 16px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      }
      input[type="submit"] {
        background: #fff;
        color: #111;
        max-width: 250px;
        padding: 8px 10px;
        box-shadow: none;
        letter-spacing: 1px;
        cursor: pointer;
        transition: 1.5s;
        border-radius: 15px;
      }

      input[type="submit"]:hover {
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

      .fail,
      .success {
        position: absolute;
        top: 0;
        transform: translateY(-100%);
        padding: 1rem 2rem;
        border-radius: 30px;
        color: #fff;
        backdrop-filter: blur(20px);
        border: 2px solid hsla(0, 0%, 100%, 0.188);
      }
      .fail {
        background: linear-gradient(to bottom right, #fbd72b, #f9484a);
      }
      .success {
        background: linear-gradient(315deg, #00b712 0%, #5aff15 74%);
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

          <div class="list-item ">
            <div class="icons">
              <a href="/SuperVisorStudents.aspx">
               <i class="fas fa-scroll"></i>
              </a>
            </div>
            <a href="/SuperVisorStudents.aspx" class="nav-link">My Students & Publications</a>
          </div>

          <div class="list-item ">
            <div class="icons">
              <a href="/SuperVisorAddDefense.aspx">
                <i class="fas fa-shield"></i>
              </a>
            </div>
            <a href="/SuperVisorAddDefense.aspx" class="nav-link">Add Defense</a>
          </div>

          <div class="list-item active" >
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
      <form id="form1" runat="server">
            <span>Thesis Serial Number</span>
            <asp:TextBox ID="TextBox8" class="text" runat="server" type="number" min="0" max="1000000" step="1"></asp:TextBox>

            <span>Defense Date</span>
            <asp:TextBox ID="TextBox9" class="text" runat="server" textmode="Date"></asp:TextBox>

            <span>Examiner Email</span>
            <asp:TextBox ID="TextBox16" class="text" runat="server" MaxLength="20"></asp:TextBox>

            <span>Examiner Password</span>
            <asp:TextBox ID="TextBox17" class="text" runat="server" MaxLength="20" ></asp:TextBox>
            
            <span>Examiner Name</span>
            <asp:TextBox ID="TextBox10" class="text" runat="server" MaxLength="20"></asp:TextBox>

            <span>Examiner Field of Work</span>
            <asp:TextBox ID="TextBox11" class="text" runat="server" MaxLength="20"></asp:TextBox>

            <span>Check if National</span>
            <asp:CheckBox ID="national" runat="server" />

            <asp:Button ID="Button5" runat="server" Text="Add Examiner" OnClick="Button5_Click" />
      </form>
    </section>

    <script src="./scripts/navigation.js"></script>
    <script>
      setActive(3);
    </script>
  </body>
</html>
