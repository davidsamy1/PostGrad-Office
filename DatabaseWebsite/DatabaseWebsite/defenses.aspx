<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="defenses.aspx.cs" Inherits="DatabaseWebsite.defenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-color:yellow;
            font-weight: bold;
            font-size:1em;
        }

        .grid{
            position:relative;
            left:35%;
            top:35%;
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
            <asp:GridView class="grid" ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="btn2" runat="server" Text="back" OnClick="back" />

        </div>

    </form>
</body>
</html>
