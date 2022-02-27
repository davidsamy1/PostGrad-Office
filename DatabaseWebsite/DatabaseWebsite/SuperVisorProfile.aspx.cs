using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class SuperVisorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyInfo = new SqlCommand("SupViewProfile2", conn);
            ViewMyInfo.CommandType = CommandType.StoredProcedure;
            //should get it from login page//

            ViewMyInfo.Parameters.Add(new SqlParameter("@supervisorID", id));

            conn.Open();
            ViewMyInfo.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ViewMyInfo);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            GridView1.DataSource = da;
            GridView1.DataBind();
            conn.Close();
        }

        protected void UpdateInfo(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UpdateMyInfo = new SqlCommand("UpdateSupProfile", conn);
            UpdateMyInfo.CommandType = CommandType.StoredProcedure;

            SqlCommand ViewMyInfo = new SqlCommand("SupViewProfile2", conn);
            ViewMyInfo.CommandType = CommandType.StoredProcedure;
            ViewMyInfo.Parameters.Add(new SqlParameter("@supervisorID", id));
      

            string newname = Name.Text;
            string newfaculty = Faculty.Text;
            if (newname.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Name", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (newfaculty.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Faculty", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                UpdateMyInfo.Parameters.Add(new SqlParameter("@supervisorID", id));
                UpdateMyInfo.Parameters.Add(new SqlParameter("@name", newname));
                UpdateMyInfo.Parameters.Add(new SqlParameter("@faculty", newfaculty));

                conn.Open();
                UpdateMyInfo.ExecuteNonQuery();
                ViewMyInfo.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter(ViewMyInfo);
                DataTable da = new DataTable();
                sqlDa.Fill(da);
                GridView1.DataSource = da;
                GridView1.DataBind();
                conn.Close();
            }
        }
    }
}