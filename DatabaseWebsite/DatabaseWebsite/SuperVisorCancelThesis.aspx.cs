using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;


namespace DatabaseWebsite
{
    public partial class SuperVisorCancelThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Cancel = new SqlCommand("CancelThesis2", conn);
            Cancel.CommandType = CommandType.StoredProcedure;


            int ThesisSerialNo;
            int.TryParse((TextBox2.Text), out ThesisSerialNo);

            if (TextBox2.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can cancel Thesis ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {

                Cancel.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                SqlParameter exist = Cancel.Parameters.Add("@exist", SqlDbType.Int);
                SqlParameter req = Cancel.Parameters.Add("@Req", SqlDbType.Int);
                exist.Direction = ParameterDirection.Output;
                req.Direction = ParameterDirection.Output;

                conn.Open();
                Cancel.ExecuteNonQuery();
                if (exist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis Doesn't exist ", "Can not cancel thesis", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else if (req.Value.ToString() == "0")
                {
                    System.Windows.Forms.MessageBox.Show("last Progress report of that thesis is not 0  ", "Can not cancel thesis", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Thesis cancelled successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        }
    }
}