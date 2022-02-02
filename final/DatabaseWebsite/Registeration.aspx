<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="DatabaseWebsite.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
          .btn{
            
            background-color:black;
            color:white;         
            border-radius:0.5em;
        }
        .btn:hover{
            
            background-color:white;
            color:black;
            border-radius:0.5em;
            cursor:pointer;

        }
body {
    background-image:url("/Images/login2.jpg");
     background-size:cover;
    background-attachment:fixed;
}
        #form1 {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 465px;
            width: 1541px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       

        <br />
    <asp:TextBox ID="Email" runat="server" 
            style="z-index: 1; left: 550px; top: 62px; position: absolute" MaxLength="50"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" 
            style="z-index: 1; left: 1000px; top: 32px; position: absolute" 
            Text="Register As :"></asp:Label>
    <asp:TextBox ID="password" runat="server" type="password" 
            style="z-index: 1; left: 750px; top: 62px; position: absolute" MaxLength="20"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" 
            style="z-index: 1; left: 554px; top: 27px; position: absolute" Text="Email"></asp:Label>
        <br />
        <asp:Label ID="Label9" runat="server" 
            style="z-index: 1; left: 759px; top: 29px; position: absolute" Text="Password"></asp:Label>
        <br />
    <br />
        <br />
    <br />
    <br />
        <br />
    <br />
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 750px; top: 153px; position: absolute" MaxLength="20"></asp:TextBox>
    <br />
        <asp:Label ID="Label1" runat="server" 
            style="z-index: 1; left: 556px; top: 124px; position: absolute" 
            Text="First Name"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" 
            style="z-index: 1; left: 759px; top: 125px; position: absolute" 
            Text="Last Name"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" 
            style="z-index: 1; left: 557px; top: 211px; position: absolute; right: 944px;" 
            Text="Type"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" 
            style="z-index: 1; left: 755px; top: 210px; position: absolute" Text="Faculty"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" 
            style="z-index: 1; left: 754px; top: 299px; position: absolute" 
            Text="Phone Number"></asp:Label>
        <asp:Label ID="Label5" runat="server" 
            style="z-index: 1; left: 554px; top: 301px; position: absolute" Text="Address"></asp:Label>
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" 
            style="z-index: 1; left: 1019px; top: 152px; position: absolute" 
            Visible="False" />
        <asp:Label ID="Label7" runat="server" 
            style="z-index: 1; left: 1012px; top: 121px; position: absolute" 
            Text="Check if National" Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left: 550px; top: 331px; position: absolute" MaxLength="20"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 550px; top: 242px; position: absolute" MaxLength="20"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" 
            AutoPostBack="true" 
            style="z-index: 1; left: 991px; top: 64px; position: absolute">
            <asp:ListItem>Gucian</asp:ListItem>
            <asp:ListItem>Non Gucian</asp:ListItem>
            <asp:ListItem>SuperVisor</asp:ListItem>
            <asp:ListItem>Examiner</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 750px; top: 241px; position: absolute" MaxLength="20"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" style="z-index: 1; left: 750px; top: 330px; position: absolute" MaxLength="20"></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 550px; top: 153px; position: absolute; " MaxLength="20"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <br />
    <br />
    <br />
        <p>
            &nbsp;</p>
        
    <asp:Button ID="Button1" class="btn" runat="server" onclick="Register" Text="Register" 
            
            style="z-index: 1; left: 556px; top: 401px; position: absolute; width: 363px; height: 48px;" 
            Font-Size="20pt"  />
        
    </form>
</body>
</html>