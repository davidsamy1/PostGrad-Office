using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class Issue_Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IssueButtonClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            try
            {

                int SerialNo = Int16.Parse(SerialNoBox.Text);
                Decimal Amount = Decimal.Parse(AmountBox.Text);
                int NoInstallments = Int16.Parse(NoInstallmentsBox.Text);
                Decimal FundPercentage = Decimal.Parse(FundPercentageBox.Text);

                SqlCommand IssuePayment = new SqlCommand("AdminIssueThesisPayment2", conn);
                IssuePayment.CommandType = CommandType.StoredProcedure;
                IssuePayment.Parameters.Add(new SqlParameter("@ThesisSerialNo", SerialNo));
                IssuePayment.Parameters.Add(new SqlParameter("@amount", Amount));
                IssuePayment.Parameters.Add(new SqlParameter("@noOfInstallments", NoInstallments));
                IssuePayment.Parameters.Add(new SqlParameter("@fundPercentage", FundPercentage));

                SqlParameter Success = IssuePayment.Parameters.Add("@success", SqlDbType.Int);

                Success.Direction = ParameterDirection.Output;

                conn.Open();
                 
                IssuePayment.ExecuteNonQuery();

                if (Success.Value.ToString() == "1")
                {
                    System.Windows.Forms.MessageBox.Show("Issue successful", "Payment Issued", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else if (Success.Value.ToString() == "0")
                {
                    System.Windows.Forms.MessageBox.Show("Thesis does not exist, please enter an existing Serial Number", "Failed to Issue Payment", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Ambizo", "Failed to Issue Payment", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            catch (System.FormatException)
            {
                System.Windows.MessageBox.Show("Input is not in the correct format, please enter a number", "Cannot Update Extension", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
            /* catch (Exception E)
            {
                System.Windows.MessageBox.Show(E.ToString(), "Cannot Issue Payment", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
            */
            conn.Close();

         
        }
    }
}