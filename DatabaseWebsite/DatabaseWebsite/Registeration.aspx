<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="DatabaseWebsite.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
                 * {
  margin: 0;
  padding: 0;
}

body {
  background: #031323;
  overflow: hidden;
  margin: 0px;
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
  width: 300px;
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
        border-style: none;
            width : 200px ;
            border-width: medium;
            border-radius: 15px;
            font-size: 15px;
            padding-left: 5px;
            padding-right: 10px;
            padding-top: 8px;
            padding-bottom: 8px;
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

    </style>
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
<form id="form1" runat="server">
        <asp:Label ID="Label10" runat="server" Text="Register As :" font-size="18px" ></asp:Label>
    <br />
    <br />
     <asp:DropDownList ID="DropDownList1" runat="server" 
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" 
            AutoPostBack="true" >
            <asp:ListItem>Gucian</asp:ListItem>
            <asp:ListItem>Non Gucian</asp:ListItem>
            <asp:ListItem>SuperVisor</asp:ListItem>
            <asp:ListItem>Examiner</asp:ListItem>
        </asp:DropDownList>
    <br />
    <br />
         <asp:TextBox ID="Email" runat="server" MaxLength="50" ></asp:TextBox>
         <asp:Label ID="Label8" runat="server" Text="Email"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="password" runat="server" type="password" MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label9" runat="server" Text="Password"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox1" runat="server"  MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="First Name"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox2" runat="server"  MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Last Name"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox3" runat="server" MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Type"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox4" runat="server" MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Faculty"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox5" runat="server" MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Text="Address"  font-size="13px"></asp:Label>
    <br />
    <br />
        <asp:TextBox ID="TextBox6" runat="server"  MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" Text="Phone Number"  font-size="13px"></asp:Label>
    <br />
    <br />   
        <asp:CheckBox ID="CheckBox1" runat="server" Visible="False" />
        <asp:Label ID="Label7" runat="server" Text="Check if National" Visible="False"  font-size="17px"></asp:Label>
    <br />
    <br />     
        <asp:Button ID="Button1" class="btn" runat="server" onclick="Register" Text="Register" Font-Size="15pt" Width="346px"  />
    </form>
              </div>
             </div>
            </div>
    </section>
</body>
</html>