<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examiner.aspx.cs" Inherits="DatabaseWebsite.examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
           background-color:yellow;

        }
        .label{
            font-size:2.5em;
            position:relative;
            left:43.5%;
            top:50%
            


        }
        div{
            display:flex;
            justify-content:space-around;
            align-items:center;
            min-height:10vh;

        }
        .btn{
            margin: 0;
            background-color:white;
            width: 15em;
            height:3em;
            border: 3px solid black;
            border-radius:1em;
            font-weight:bold;
            font-size: 1em;
            transition: box-shadow 0.5s ease-out;
        }
        .btn:hover{
            color: white;
            cursor:pointer;
            box-shadow:inset 15em 0 0 0 #ef2f88;
        }
    </style>
</head>
<body>
        <p class="label">EXAMINER</p>

    <form id="form1" runat="server">
        <div>
            <asp:Button class="btn" runat="server" Text="Edit Profile" OnClick="edit" />
            <asp:Button class="btn" runat="server" Text="Defenses Attended" OnClick="Unnamed_Click" />
            <asp:Button class="btn" runat="server" Text="Add comment to defense" OnClick="addComment"/>
            <asp:Button class="btn" runat="server" Text="Add grade to defense" OnClick="addGrade"/>
            <asp:Button class="btn" runat="server" Text="Search for thesis" OnClick="search"/>
        </div>
    </form>
</body>
</html>
