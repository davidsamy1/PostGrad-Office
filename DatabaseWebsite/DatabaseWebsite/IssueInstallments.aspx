<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="IssueInstallments.aspx.cs"
Inherits="DatabaseWebsite.IssueInstallments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Issue Installments</title>
  </head>
  <body>
    <section class="main-content">
      <form id="form1" runat="server">
        Payment ID:
        <asp:TextBox
          ID="PaymentIDBox"
          runat="server"
          type="number"
          min="0"
          max="1000000"
          step="1"
        ></asp:TextBox>

        Start Date:
        <asp:TextBox
          ID="StartDateBox"
          runat="server"
          textmode="Date"
        ></asp:TextBox>

        <asp:Button
          ID="IssueInstallmentButton"
          runat="server"
          Text="Issue Installments"
          OnClick="IssueInstallmentClick"
        />
      </form>
    </section>
  </body>
</html>
