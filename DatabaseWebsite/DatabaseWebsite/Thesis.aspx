<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="Thesis.aspx.cs" Inherits="DatabaseWebsite.Thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div>
        <asp:GridView ID="ListThesesGrid" runat="server">
        </asp:GridView>
        <asp:GridView ID="OngoingGrid" runat="server"> </asp:GridView>
        <br />
        <br />
        <asp:Button
          ID="IssuePaymentButton"
          runat="server"
          Text="Issue a Payment"
          OnClick="IssuePaymentMethod"
        />
        <br />
        <br />
        <br />
        <br />
        Payment ID:
        <asp:TextBox
          ID="PaymentIDBox"
          runat="server"
          type="number"
          min="0"
          max="1000000"
          step="1"
        ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp; Start Date:
        <asp:TextBox
          ID="StartDateBox"
          runat="server"
          textmode="Date"
        ></asp:TextBox>
        <br />
        <br />
        <asp:Button
          ID="IssueInstallmentButton"
          runat="server"
          Text="Issue Installments"
          OnClick="IssueInstallmentClick"
        />
        <br />
        <br />
        <br />
        <br />
        Serial Number:
        <asp:TextBox
          ID="SerialNoBox"
          runat="server"
          type="number"
          min="0"
          max="1000000"
          step="1"
        ></asp:TextBox>
        <br />
        <br />
        <asp:Button
          ID="UpdateExtensionButton"
          runat="server"
          Text="Update Extension"
          OnClick="UpdateExtensionButtonClick"
        />
      </div>
    </form>
  </body>
</html>
