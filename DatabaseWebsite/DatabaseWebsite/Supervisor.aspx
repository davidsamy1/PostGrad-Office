<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor.aspx.cs" Inherits="DatabaseWebsite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
           form{
            background-color:transparent;

             backdrop-filter:blur(15px) brightness(110%);
             border-radius:1em;
            
        }
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
    background-image:url('/Images/May-12-How-to-Create-Effective-and-Equitable-Grading-Policies-web-1536x1024.jpg');
     background-size:cover;
    background-attachment:fixed;
            height: 1170px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 
            <asp:Button ID="ViewMyInformation" class="btn"  runat="server" Text="View My Information" 
                OnClick="ViewInfo" 
                style="z-index: 1; left: 854px; top: 43px; position: absolute; height: 57px; width: 236px; right: 471px;" />
       
        <asp:GridView ID="GridView1" runat="server" Height="22px" 
                style="z-index: 1; left: 1116px; top: 43px; position: absolute; height: 22px; width: 200px">
        </asp:GridView>
        
            <asp:TextBox ID="Name" runat="server" MaxLength="20" 
                style="z-index: 1; left: 854px; top: 181px; position: absolute"></asp:TextBox>

            <asp:TextBox ID="Faculty" runat="server" MaxLength="20" 
                style="z-index: 1; left: 1119px; top: 181px; position: absolute"></asp:TextBox>

        
 
            <asp:Button ID="UpdateMyInformation" class="btn" runat="server" 
                Text="Update My Information" OnClick="UpdateInfo" 
                
                
                style="z-index: 1; left: 854px; top: 220px; position: absolute; height: 57px; width: 236px" />
       
        
        
 
            <asp:Button ID="ViewAllStudents" class="btn"  runat="server" 
                Text="View All my students and years they spent" OnClick="ViewAllStudentYears" 
                
                style="z-index: 1; left: 854px; top: 314px; position: absolute;height: 57px; width: 356px" />
       
      
 
            <asp:GridView ID="GridView2" runat="server" 
                style="z-index: 1; left: 1251px; top: 237px; position: absolute; height: 152px; width: 232px">
            </asp:GridView>
       
            <asp:Label ID="Label1" runat="server" 
                style="z-index: 1; left: 857px; top: 150px; position: absolute" 
                Text="Enter New Name"></asp:Label>
            <asp:Label ID="Label2" runat="server" 
                style="z-index: 1; left: 1122px; top: 148px; position: absolute" 
                Text="Enter New Faculty"></asp:Label>
    
        <p>
            Enter Student ID :</p>
        <p>
            <asp:TextBox ID="Studentid" runat="server" type="number" min="0" max="1000000" step="1"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button2" class="btn" runat="server" 
                Text="View all Students' Publications" Width="456px" OnClick="Button2_Click" 
                Height="57px" />
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server">
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <p>
            Enter </p>
        <p>
            Thesis Serial Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Defense Location</p>
        <p>
            <asp:TextBox ID="TextBox2" runat="server" Width="214px"  type="number" min="0" max="1000000" step="1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" textmode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" MaxLength="15"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button3" class="btn" runat="server" 
                Text="Add Defense For Gucian" OnClick="Button3_Click" Width="689px" 
                Height="57px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            Enter </p>
        <p>
            Thesis Serial Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Defense Location</p>
        <p>
            <asp:TextBox ID="TextBox5" runat="server" Width="214px"  type="number" min="0" max="1000000" step="1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" textmode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" MaxLength="15"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button4" class="btn" runat="server" 
                Text="Add Defense For Non-Gucian" OnClick="Button4_Click" Height="57px" 
                Width="709px" />
        </p>
        <p style="margin-left: 40px">
            &nbsp;</p>
        <p>
            Enter</p>
        <p>
            &nbsp;Thesis Serial Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Defense Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Examiner 
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Examiner Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Examiner Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Field Of Work&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Check Below box if national</p>
        <p>
            <asp:TextBox ID="TextBox8" runat="server" Width="214px"  type="number" min="0" max="1000000" step="1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox9" runat="server" textmode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox16" runat="server" MaxLength="20" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="TextBox17" runat="server" MaxLength="20" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox10" runat="server" MaxLength="20"></asp:TextBox>
        &nbsp;
            <asp:TextBox ID="TextBox11" runat="server" style="margin-left: 50px" Width="188px" MaxLength="20"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="national" runat="server" />
        </p>
        <p>
            <asp:Button ID="Button5" class="btn" runat="server" Text="Add Examiner" 
                OnClick="Button5_Click" Height="57px" Width="1507px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            Enter </p>
        <p>
            Thesis Serial Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Progress Report Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Evaluation</p>
        <p>
            <asp:TextBox ID="TextBox12" runat="server" Width="214px"  type="number" min="0" max="1000000" step="1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox13" runat="server" Width="193px" type="number" min="0" max="100" step="1"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox14" runat="server" style="margin-left: 0px"  type="number" min="0" max="3" step="1"></asp:TextBox>
        &nbsp;</p>
        <p>
            <asp:Button ID="Button6" class="btn" runat="server" 
                Text="Evaluate Progress Report" OnClick="Button6_Click" Height="57px" 
                Width="766px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            Enter Thesis Serial Number&nbsp;&nbsp; </p>
        <p>
            <asp:TextBox ID="TextBox15" runat="server" Width="214px"  type="number" min="0" max="1000000" step="1"></asp:TextBox>
        </p>
        <p style="font-weight: 700">
            <asp:Button ID="Button7" class="btn" runat="server" Text="Cancel Thesis" 
                OnClick="Button7_Click" Height="57px" Width="258px" />
        </p>
        
       
    </form>
</body>
</html>
