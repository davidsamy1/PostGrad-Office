<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DatabaseWebsite.Login" %>


<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body{
            display:flex;
            justify-content:center;
            align-items:center;
            background-image:url("Images/gucslide.jpg");
            background-size:cover;
             background-attachment:fixed;
            background-color: #cccccc;
            }

        div{
            background-color:transparent;

             backdrop-filter:blur(15px) brightness(110%);
             border-radius:1em;
             transform: translateY(25%)
        }
        form{
            display:flex;
            flex-direction:column;           
            background-color:transparent;
            font-weight:bold;
            font-size:2em;
            padding:1em;
            border-radius:0.5em;


        }

        input[type = "text"]{
        font-size: 1em; 
        width: 20em;
        height:1em;
        font-weight:bold;

        }

        input[type = "password"]{
        font-size: 1em; 
        width: 20em;
        height:1em;
        font-weight:bold;

        }


        .btn{
            max-width:10em;
            position:relative;
            left:50%;
            transform:translateX(-50%);
            background-color:black;
            color:white;
            min-width:30em;
            min-height:3em;
            border-radius:0.5em;
        }
        .btn:hover{
            max-width:10em;
            position:relative;
            left:50%;
            transform:translateX(-50%);
            background-color:white;
            color:black;
            min-width:30em;
            min-height:3em;
            border-radius:0.5em;
            cursor:pointer;

        }
    </style>
</head>
<body>
    <div>
        <form id="form1" runat="server">
            <label for="Uname">Email:</label> <br/>
            <asp:TextBox ID="TextBox1" runat="server" type="text"></asp:TextBox><br>
            
            <label for="password">Password:</label> <br/> 
            <asp:TextBox ID="TextBox2" runat="server" type="password"></asp:TextBox> <br />

            <asp:Button ID="sign_in" class="btn" runat="server" Text="Sign in" OnClick="sign_in_Click1" /> <br />
            <asp:Button ID="Button1" class="btn" runat="server" Text="Register" OnClick="RegisterPage" /> 
        </form>
    </div>
   <img src="/Images/GUC LOGO.png" alt="Sample Photo" 
        style="z-index: 1; left: 1100px; top: -55px; position: absolute" />

</body>
</html>
