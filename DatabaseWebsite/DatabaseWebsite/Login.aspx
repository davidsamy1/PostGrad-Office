﻿l<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DatabaseWebsite.Login" %>


<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
   <style>
        * {
  margin: 0;
  padding: 0;
}

body {
  background: #031323;
  overflow: hidden;
  margin:-20px;
}

.fas {
  width: 32px;
}

section {
  display: flex;
 
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
  background-size: 400% 400%;
  animation: gradient 10s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.box {
  position: relative;
}
  .square {
    position: absolute;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(5px);
    box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 15px;
    animation: square 10s linear infinite;
    animation-delay: calc(-1s * var(--i));
  }

  @keyframes square {
    0%,
    100% {
      transform: translateY(-20px);
    }

    50% {
      transform: translateY(20px);
    }
  }

  .square:nth-child(1) {
    width: 100px;
    height: 100px;
    top: -15px;
    right: -45px;
  }

  .square:nth-child(2) {
    width: 150px;
    height: 150px;
    top: 105px;
    left: -125px;
    z-index: 2;
  }

  .square:nth-child(3) {
    width: 60px;
    height: 60px;
    bottom: 85px;
    right: -45px;
    z-index: 2;
  }

  .square:nth-child(4) {
    width: 50px;
    height: 50px;
    bottom: 35px;
    left: -95px;
  }

  .square:nth-child(5) {
    width: 50px;
    height: 50px;
    top: -15px;
    left: -25px;
  }

  .square:nth-child(6) {
    width: 85px;
    height: 85px;
    top: 165px;
    right: -155px;
    z-index: 2;
  }


.container {
  position: relative;
  padding: 50px;
  width: 260px;
  min-height: 380px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(5px);
  border-radius: 10px;
  box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
}

.container::after {
  content: "";
  position: absolute;
  top: 5px;
  right: 5px;
  bottom: 5px;
  left: 5px;
  border-radius: 5px;
  pointer-events: none;
  background: linear-gradient(
    to bottom,
    rgba(255, 255, 255, 0.1) 0%,
    rgba(255, 255, 255, 0.1) 2%
  );
}

.form {
  position: relative;
  width: 100%;
  height: 100%;
}
  h2 {
    color: #fff;
    letter-spacing: 2px;
    margin-bottom: 30px;
  }

  .inputBx {
    position: relative;
    width: 100%;
    margin-bottom: 20px;
  }
    input {
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

    .password-control {
      position: absolute;
      top: 11px;
      right: 10px;
      display: inline-block;
      width: 20px;
      height: 20px;
      background: url(https://snipp.ru/demo/495/view.svg) 0 0 no-repeat;
      transition: 0.5s;
    }

    .view {
      background: url(https://snipp.ru/demo/495/no-view.svg) 0 0 no-repeat;
      transition: 0.5s;
    }

    .fas {
      position: absolute;
      top: 13px;
      left: 13px;
    }

    input[type="submit"] {
      background: #fff;
      color: #111;
      max-width: 100px;
      padding: 8px 10px;
      box-shadow: none;
      letter-spacing: 1px;
      cursor: pointer;
      transition: 1.5s;
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

    span {
      position: absolute;
      left: 30px;
      padding: 10px;
      display: inline-block;
      color: #fff;
      transition: 0.5s;
      pointer-events: none;
    }

    input:focus ~ span{
        transform: translateX(-30px) translateY(-25px);
      font-size: 12px;
    }
    input:valid ~ span {
      transform: translateX(-30px) translateY(-25px);
      font-size: 12px;
    }
  

  p {
    color: #fff;
    font-size: 15px;
    margin-top: 5px;
  }

    a {
      color: #fff;
    }

    a:hover {
    
        filter: invert(42%) sepia(93%) saturate(0%) hue-rotate(0deg) brightness(200%) contrast(100%);
 
    }

    </style>
      <link rel="stylesheet" href="/css/all.css" />
</head>
<body>
        <section>
        <div class="box">
          <div class="square" style="--i:0;"></div>
          <div class="square" style="--i:1;"></div>
          <div class="square" style="--i:2;"></div>
          <div class="square" style="--i:3;"></div>
          <div class="square" style="--i:4;"></div>
          <div class="square" style="--i:5;"></div>

         <div class="container"> 
          <div class="form"> 
            <h2>LOGIN to GUC</h2>
            <form id="form1" runat="server">
              <div class="inputBx">
                <asp:TextBox ID="TextBox1" runat="server" type="text" required="required"> </asp:TextBox>
                <span>Email</span>
                <i class="fas fa-user-circle"></i>
              </div>
              <div class="inputBx password">
                <asp:TextBox ID="TextBox2" runat="server" type="password" required="required"> </asp:TextBox>
                <span>Password</span>
                <a href="#" class="password-control" onclick="return show_hide_password(this);"></a>
                <i class="fas fa-key"></i>
              </div>
              <div class="inputBx">
                <asp:Button ID="Sign_in"  runat="server" Text="Login" OnClick="Sign_in_Click1" /> 

              </div>
                  <script>
                      function show_hide_password(target) {
                         var input = document.getElementById('TextBox2');
                           if (input.getAttribute('type') == 'password') {
                                   target.classList.add('view');
                                   input.setAttribute('type', 'text');
                           } else {
                                   target.classList.remove('view');
                                   input.setAttribute('type', 'password');
                           }
                           return false;
                           }
                       </script>
            </form>  
              <p>Don't have an account? <a href="Registeration.aspx">Sign up</a></p>
          </div>
        </div>  
        </div>
    </section>
</body>
</html>
