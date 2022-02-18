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
    public partial class UpdateExtension : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

    }
}