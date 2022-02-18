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
    public partial class IssueInstallments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void IssueInstallmentClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            try
            { 

            int paymentID = Int16.Parse(PaymentIDBox.Text);
            DateTime startDate = DateTime.Parse(StartDateBox.Text);

            SqlCommand IssueInstallment = new SqlCommand("AdminIssueInstallPayment2", conn);
            IssueInstallment.CommandType = CommandType.StoredProcedure;
            IssueInstallment.Parameters.Add(new SqlParameter("@paymentID", paymentID));
            IssueInstallment.Parameters.Add(new SqlParameter("@InstallStartDate", startDate));

             SqlParameter Success = IssueInstallment.Parameters.Add("@Success", SqlDbType.Int);
             Success.Direction = ParameterDirection.Output;

                conn.Open();
            
                IssueInstallment.ExecuteNonQuery();

                if (Success.Value.ToString() == "1")
                {
                    System.Windows.Forms.MessageBox.Show("Issue successful", "Installment Issued Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else if (Success.Value.ToString() == "0")
                {
                    System.Windows.Forms.MessageBox.Show("Please enter an existing paymentID", "Issue Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            catch (System.FormatException)
            {
                System.Windows.MessageBox.Show("Input is not in the correct format, please enter an ID and a date", "Cannot Issue Installment", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
            catch (System.Data.SqlClient.SqlException)
            {
                System.Windows.MessageBox.Show("There already exists Installments with this paymentID and Date. Please enter a new installment", "Cannot Issue Installment", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
            catch (Exception E)
            {
                System.Windows.MessageBox.Show(E.ToString(), "Cannot Issue Installment", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
           
            conn.Close();
        }

    }
}