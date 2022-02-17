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
    public partial class Thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ListTheses = new SqlCommand("AdminViewAllTheses", conn);
            ListTheses.CommandType = CommandType.StoredProcedure;

            SqlCommand OngoingThesis = new SqlCommand("AdminViewOngoingThesis", conn);
            OngoingThesis.CommandType = CommandType.StoredProcedure;


            conn.Open();
            ListTheses.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ListTheses);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            ListThesesGrid.DataSource = da;
            ListThesesGrid.DataBind();

            OngoingThesis.ExecuteNonQuery();
            SqlDataAdapter Ongoing = new SqlDataAdapter(OngoingThesis);
            DataTable OngoingTable = new DataTable();
            Ongoing.Fill(OngoingTable);
            OngoingGrid.DataSource = OngoingTable;
            OngoingGrid.DataBind();

            conn.Close();
        }

    

        protected void IssuePaymentMethod(object sender, EventArgs e)
        {
            Response.Redirect("Issue Payment.aspx");
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

            
        protected void UpdateExtensionButtonClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int SerialNo = Int16.Parse(SerialNoBox.Text);

                SqlCommand UpdateExtension = new SqlCommand("AdminUpdateExtension2", conn);
                UpdateExtension.CommandType = CommandType.StoredProcedure;
                UpdateExtension.Parameters.Add(new SqlParameter("@ThesisSerialNo", SerialNo));

                SqlParameter Success = UpdateExtension.Parameters.Add("@Success", SqlDbType.Int);
                Success.Direction = ParameterDirection.Output;



                conn.Open();
                UpdateExtension.ExecuteNonQuery();

                if (Success.Value.ToString() == "1")
                {
                    System.Windows.Forms.MessageBox.Show("Update successful", "Extension Updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else if (Success.Value.ToString() == "0")
                {
                    System.Windows.Forms.MessageBox.Show("Incorrect Serial Number", "Update Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
       
            }
            catch(System.FormatException)
            {
                System.Windows.MessageBox.Show("Input is not in the correct format, please enter a number", "Cannot Update Extension", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }
            catch (Exception E)
            {
                System.Windows.MessageBox.Show(E.ToString(), "Cannot Update Extension", (MessageBoxButton)MessageBoxButtons.OK, (MessageBoxImage)MessageBoxIcon.Error);
            }

            

            conn.Close();

        }

        protected void ListThesesButton_Click(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ListTheses = new SqlCommand("AdminViewAllTheses", conn);
            ListTheses.CommandType = CommandType.StoredProcedure;

            SqlCommand OngoingThesis = new SqlCommand("AdminViewOngoingThesis", conn);
            OngoingThesis.CommandType = CommandType.StoredProcedure;


            conn.Open();
            ListTheses.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ListTheses);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            ListThesesGrid.DataSource = da;
            ListThesesGrid.DataBind();

            OngoingThesis.ExecuteNonQuery();
            SqlDataAdapter Ongoing = new SqlDataAdapter(OngoingThesis);
            DataTable OngoingTable = new DataTable();
            Ongoing.Fill(OngoingTable);
            OngoingGrid.DataSource = OngoingTable;
            OngoingGrid.DataBind();

            conn.Close();
        }
    }
}