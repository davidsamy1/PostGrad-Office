using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void sign_in_Click1(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand userLogin2 = new SqlCommand("userLogin2", conn);
            userLogin2.CommandType = CommandType.StoredProcedure;
            String email = (TextBox1.Text).ToString();
            String password = (TextBox2.Text).ToString();
            userLogin2.Parameters.Add(new SqlParameter("@email", email));
            userLogin2.Parameters.Add(new SqlParameter("@password", password));
            SqlParameter Success = userLogin2.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = userLogin2.Parameters.Add("@type", SqlDbType.Int);
            SqlParameter id = userLogin2.Parameters.Add("@id", SqlDbType.Int);
            Success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;

            conn.Open();
            userLogin2.ExecuteNonQuery();
            if (Success.Value.ToString() == "0")
            {

                MessageBox.Show("Wrong Credentials", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else if (Success.Value.ToString() == "1")
            {
                Session["user"] = id.Value.ToString();

                if (type.Value.ToString() == "0")
                {
                    MessageBox.Show("LOGIN SUCCESSFULLY", "STUDENT", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Response.Redirect("Student home.aspx");
                }
                else if (type.Value.ToString() == "1")
                {
                    MessageBox.Show("LOGIN SUCCESSFULLY", "ADMIN", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Response.Redirect("Admin.aspx");

                }
                else if (type.Value.ToString() == "2")
                {
                    MessageBox.Show("LOGIN SUCCESSFULLY", "SUPERVISOR", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Response.Redirect("Supervisor.aspx");

                }
                else if (type.Value.ToString() == "3")
                {
                    MessageBox.Show("LOGIN SUCCESSFULLY", "EXAMINER", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Response.Redirect("examiner.aspx");

                }
                conn.Close();
            }
        }

        protected void RegisterPage(object sender, EventArgs e)
        {
            Response.Redirect("Registeration.aspx");
        }
    }
}