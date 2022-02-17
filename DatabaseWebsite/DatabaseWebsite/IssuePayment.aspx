<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="IssuePayment.aspx.cs"
Inherits="DatabaseWebsite.IssuePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div style="height: 255px">
        SerialNo:
        <asp:TextBox ID="SerialNoBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Amount:
        <asp:TextBox
          ID="AmountBox"
          runat="server"
          type="number"
          min="0"
          max="1000000"
          step="5000"
        ></asp:TextBox>
        <br />
        <br />
        Number Of Installments:
        <asp:TextBox
          ID="NoInstallmentsBox"
          runat="server"
          type="number"
          min="0"
          max="50"
          step="1"
        ></asp:TextBox>
        <br />
        <br />
        Fund Percentage:
        <asp:TextBox
          ID="FundPercentageBox"
          runat="server"
          type="number"
          min="0"
          max="100"
          step="5"
        ></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button
          ID="IssueButton"
          runat="server"
          Text="Issue"
          OnClick="IssueButtonClick"
          Width="96px"
        />
        <br />
      </div>
    </form>
  </body>
</html>
