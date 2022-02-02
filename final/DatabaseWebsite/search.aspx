<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="DatabaseWebsite.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background:yellow;
            font-weight:bold;
            
        }

        div{
            display:flex;
            flex-direction:column;
            justify-content:space-evenly;
            align-items:center;
            min-height:10vh;
        }

        .label{
            font-weight:bold;
            font-size:1.5em;
        }
        .text{
            font-size: 1em;
            width: 25em;
            height: 2em;
            font-weight: bold;
            border-radius:1em;
        }

        .fail{
            font-weight:bold;
            font-size:1.5em;
            position:absolute;
            left:40%;
            top:42%;
            color:red;
            z-index:-1
        }

         .success{
            font-weight:bold;
            font-size:1.5em;
            position:relative;
            padding-top:2em;
            left:40%;
            color:green;
            z-index:-1;
        }

        #Button1{
            margin: 0;
            background-color:white;
            width: 15em;
            height:3em;
            border: 3px solid black;
            border-radius:1em;
            font-weight:bold;
            font-size: 1em;
            transition: box-shadow 0.5s ease;
        }
        #Button1:hover{
            
            color: white;
            cursor:pointer;
            box-shadow:inset 15em 0 0 0 #ef2f88;


        }
        #GridView1{
            font-size:1.5em;
            text-align:center;
            background-color:#ef2f88;
        }

        #btn2{
            margin: 0;
            background-color:white;
            width: 10em;
            height:3em;
            border: 3px solid black;
            border-radius:1em;
            font-weight:bold;
            font-size: 1em;
            transition: all 0.5s ease;
            position:absolute;
            top:5%;
            left:5%;
        }
        #btn2:hover{
           color: white;
            cursor:pointer;
            box-shadow:inset 15em 0 0 0 #ef2f88;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label class="label"  ID="Label1" runat="server" Text="Thesis Name:"></asp:Label>
            <br />
            <asp:TextBox class="text"  ID="thesis" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="search" OnClick="Button1_Click" />
            <asp:GridView class="grid" ID="GridView1" runat="server" Height="228px" Width="419px"></asp:GridView>
            <asp:Button ID="btn2" runat="server" Text="back" OnClick="back" />
        </div>
    </form>
</body>
</html>
