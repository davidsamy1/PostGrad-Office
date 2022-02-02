<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student home.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         .btn{
            margin: 0;
            background-color:white;
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
    <form id="form1" runat="server">
        <div>
            
            <asp:Button class="btn" ID="Button1" runat="server" Height="53px" Text="view all my info" Width="177px" OnClick="Button1_Click" />
            <br />
            <asp:Button class="btn" ID="Button2" runat="server" Text="courses" OnClick="Button2_Click" Width="144px" />
            <br />
            <asp:Button class="btn" ID="Button3" runat="server" Text="get all thesis" OnClick="Button3_Click" Width="145px" />
            <br />
            <asp:Button class="btn" ID="Button4" runat="server" Text="fill/addprogressreport" Width="227px" OnClick="Button4_Click" />
            <br />
            <asp:Button ID="Button5" class="btn" runat="server" Text="Link and add publication
                " Width="246px" OnClick="Button5_Click" />
            <br />
        </div>
    </form>
</body>
</html>
